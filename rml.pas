unit rml;

interface

type
  HReport = type Cardinal;
  TProgressProc = procedure (const Prompt: PChar); stdcall;

function InitRML (libname, mode, name, password: String;
                   ProgressProc: TProgressProc): Cardinal;
procedure RunRMLReport (const aLCVID: Integer;
                        const ModuleId: Integer;
                        const ReportId: HReport;
                        const DoPrint: Boolean = False;
                        const UseWPlan: Boolean = false);
procedure DoneRML (ModuleId: Integer);

function SetUPlanId (ModuleId: Integer; const UID, FacID, SFID, Year: Integer;
                     const FacName: String): HResult;
function SetUPlanFGOSId (ModuleId: Integer; const UID, Course, Count_course, FacID, SFID, Year: Integer;
                     const FacName: String): HResult;
function SetPrintMode (ModuleId: Integer;const PrintMode: Cardinal): HResult;
procedure SetParametr (ModuleId: Integer; const God, ses, id_f: Integer; const f_name: PChar);
// эти процедуры нужна только для teachers.rml

implementation

uses
  Forms,
  Controls,
  Windows,
  SysUtils,
  ShellAPI,
  Registry,
  Logs;   // исключительно чтобы вытащить CurrYear

type
  // functional types
  TModuleWriteLog = procedure (const aText: PChar;
                               const IsError: Bool); stdcall;

  TGetReportList = function (const Mode,
                             UserName,
                             Password: PChar;
                             List: Pointer;
                             ListLength: Cardinal;
                             Wnd: HWND;
                             WriteLogProc: TModuleWriteLog;
                             ProgressProc: TProgressProc): Cardinal; stdcall;
  TMakeReport = function (ReportHandle: HReport): HResult; stdcall;
  TShowParamDialog = function (ReportHandle: HReport;
                                              ReadOnly: Bool): HResult; stdcall;
  TDoneModule = procedure; stdcall;
  TTranslateResult = function (ReportHandle: HReport; ErrCode: HResult;
                                        var Buffer: PChar): Cardinal; stdcall;
  TSetIntValue = procedure (const Value: Integer); stdcall;
  TSetWPlanId = procedure (const WID, FacID, SFID, Year: Integer; const FacName: PChar); stdcall;
  TSetUPlanId = procedure (const UID, FacID, SFID, Year: Integer; const FacName: PChar); stdcall;
  TSetUplanFGOSId = procedure (const UID, Course, Count_course, FacID, SFID, Year: Integer; const FacName: PChar); stdcall;
  TSetPrintMode = procedure (const PrintMode: Cardinal); stdcall;
  TSetParametr = procedure (God, ses, id_f: Integer; f_name: PChar); stdcall;
  TModuleRec = record
    Path: String;
    Handle: THandle;
  end;

var
  HRMLs: Array of TModuleRec;

const
  S_BROWSE             = HRESULT($80004002);
  S_LINK               = HRESULT($80004003);
  S_BROWSE_EXTERNAL    = HRESULT($80004004);
  S_PRINT              = HRESULT($80004005);
  S_MAIL               = HRESULT($80004006);

  // report handles

  cErrorNotImplemented = 'Отчет не реализован';
  cErrorUnknownError = 'Ошибка формирования отчета';
  cErrorAborted = 'Формирование отчета было прервано';

procedure ModuleWriteLog (const aText: PChar;
                          const IsError: Bool); stdcall;
begin
  if IsError
  then
    Application.MessageBox (aText, 'Ошибка', MB_APPLMODAL or MB_ICONERROR or MB_OK)
  else
    WriteLog ('RML: ' + aText);
end;

procedure DoneRML (ModuleId: Integer);
var
  DoneModule: TDoneModule;
begin
  if (ModuleId >= Length (HRMLs))
  then
    Exit;
  if HRMLs [ModuleId].Handle <> 0
  then
  begin
    @DoneModule := GetProcAddress(HRMLs [ModuleId].Handle, 'DoneModule');
    if @DoneModule <> nil
    then
      DoneModule;
    FreeLibrary (HRMLs [ModuleId].Handle);
    HRMLs [ModuleId].Handle := 0;
  end;
end;

function InitRML (libname, mode, name, password: String;
                   ProgressProc: TProgressProc): Cardinal;
var
  GetReportList: TGetReportList;
  S: String;
  I: Integer;
  path: String;
begin
  with TRegistry.Create
  do
  try
    RootKey := HKEY_LOCAL_MACHINE;
    if OpenKeyReadOnly ('\Software\Mik-Demidov\ReportManager\lib\')
    then
    try
      try
        path := ReadString(libname);
      except
        path := ''
      end;
    finally
      CloseKey;
    end;
    if (path = '')
    then
      Application.MessageBox (PChar ('Не найдена библиотека ' + libname + '.rml'),
                              'Ошибка',
                              MB_OK or MB_ICONERROR or MB_APPLMODAL);
  finally
    Free;
  end;

  if Length (HRMLs) > 0
  then
    for I := 0 to Length (HRMLs) - 1
    do
      if HRMLs[I].Path = path
      then
        DoneRML (I);

  Result := Length (HRMLs);
  SetLength (HRMLs, Result + 1);

  if path = ''
  then
    path := ChangeFileExt (Application.ExeName, '.rml');
  HRMLs [Result].Path := Path;
  HRMLs [Result].Handle := LoadLibrary (PChar (path));
  if HRMLs [Result].Handle <> 0
  then
  try
    @GetReportList := GetProcAddress(HRMLs [Result].Handle, 'GetReportList');
    if @GetReportList = nil
    then
    begin
      FreeLibrary (HRMLs [Result].Handle);
      HRMLs [Result].Handle := 0;
      S := 'Ошибка чтения отчетов из библиотеки "' + path + '"';
      Abort;
    end;
    I := GetReportList (PChar (Mode),
                        PChar (Name),
                        PChar (Password),
                        nil,
                        0,
                        Application.Handle,
                        ModuleWriteLog,
                        ProgressProc);
    if I = 0
    then
    begin
      S := 'Не обнаружено отчетов в библиотеке "' + path + '"';
      DoneRML (Result);
      Abort;
    end;
  except
    on E: EAbort
    do
      ModuleWriteLog (PChar (S), True);
    on E: Exception
    do
      ModuleWriteLog (PChar (E.Message), True);
  end
  else
  begin
    S := 'Не найдена библиотека "' + path + '"';
    ModuleWriteLog (PChar (S), True);
  end;
end;

function TranslateResult (ModuleId: Integer;
                          ReportId: HReport;
                          EID: Integer): String;
var
  IE: TTranslateResult;
  P: PChar;
  I: Integer;
begin
  Result := cErrorUnknownError;

  @IE := GetProcAddress(HRMLs [ModuleId].Handle, 'TranslateResult');
  if @IE <> nil
  then
  begin
    P := nil;
    I := IE (ReportId, EID, P);
    if I = 0
    then
      Result := cErrorUnknownError
    else
    begin
      P := StrAlloc (I);
      IE (ReportId, EID, P);
      Result := String (P);
      StrDispose (P);
    end
  end
  else
    Result := cErrorUnknownError;
end;

procedure RunRMLReport (const aLCVID: Integer;
                        const ModuleId: Integer;
                        const ReportId: HReport;
                        const DoPrint: Boolean = False;
                        const UseWPlan: Boolean = false);
var
  Res: HResult;
  ResText: String;

function ShowReportParams (ReportId: HReport): HResult;
var
  SD: TShowParamDialog;
begin
  @SD := GetProcAddress(HRMLs[ModuleId].Handle, 'ShowParamDialog');
  if @SD <> nil
  then
    Result := SD (ReportId, False)
  else
    Result := E_NOTIMPL;
end;

function MakeReport (ReportId: HReport): string;
var
  MR: TMakeReport;
  Cmd, S: String;
  H: LongWord;
begin
  @MR := GetProcAddress(HRMLs[ModuleId].Handle, 'MakeReport');
  if @MR <> nil
  then
    Res := MR (ReportId);
    case Res
    of
      S_OK:
        Result := '';
      S_FALSE:
        Result := cErrorAborted;
      E_NOTIMPL:
        ;
      S_BROWSE,
      S_LINK,
      S_BROWSE_EXTERNAL,
      S_PRINT,
      S_MAIL:
        begin
          S := TranslateResult (ModuleId, ReportId, Res);
          Result := 'Файл не найден';
          if S <> ''
          then
          begin
            case Res
            of
              S_LINK:
                Cmd := 'open';
              S_BROWSE,
              S_BROWSE_EXTERNAL:
                Cmd := 'explore';
              S_PRINT:
                Cmd := 'print';
              S_MAIL:
              begin
                Cmd := 'open';
                S := Trim (S);
                if Pos ('mailto:', LowerCase (S)) = 0
                then
                  S := 'mailto:' + S;
              end;
            end;
            H := ShellExecute (Application.Handle,
                               PChar (Cmd),
                               PChar (S),
                               nil,
                               nil,
                               SW_SHOWNORMAL);
            if H > 32
            then
              Result := ''
            else
            case H
            of
              ERROR_FILE_NOT_FOUND,
              ERROR_PATH_NOT_FOUND:
                Result := 'Файл не найден: "' + S + '"';
              ERROR_BAD_FORMAT:
                Result := 'Исполняемый файл "' + S + '" имеет неправильный формат';
              SE_ERR_ACCESSDENIED:
                Result := 'Нет доступа к файлу "' + S + '"';
              SE_ERR_ASSOCINCOMPLETE:
                Result := 'Файл "' + S + '" не связан с приложением';
              SE_ERR_DDEBUSY,
              SE_ERR_DDEFAIL,
              SE_ERR_DDETIMEOUT:
                Result := 'Ошибка DDE';
              SE_ERR_DLLNOTFOUND:
                Result := 'Не найдена необходимая динамическая библиотека';
              SE_ERR_NOASSOC:
                Result := 'Файл "' + S + '" не связан с приложением';
              SE_ERR_OOM:
                Result := 'Недостаточно памяти для запуска приложения';
              SE_ERR_SHARE:
                Result := 'Ошибка совместного доступа к файлу "' + S + '"';
            end;
          end;
        end;
      E_UNEXPECTED: Result := cErrorUnknownError;
    else
      Result := TranslateResult (ModuleId, ReportId, Res)
    end;
end;

begin
  ResText := cErrorNotImplemented;
  Res := ShowReportParams (ReportId);

  case Res
  of
    S_OK,
    E_NOTIMPL:
      begin
        ResText := '';
        Screen.Cursor := crHourGlass;
        try
          ResText := MakeReport (ReportId);
        except
          on E: Exception
          do ResText := E.Message;
        end;
        Screen.Cursor := crDefault;
      end;
    S_FALSE     : ResText := '';
    E_UNEXPECTED: ModuleWriteLog ('Невозможно установить параметры для формирования отчета', True);
  else
    ResText := TranslateResult (ModuleId, ReportId, ModuleId);
  end;

  if ResText <> ''
  then
    ModuleWriteLog (PChar (ResText), True);
end;

procedure SetParametr (ModuleId: Integer; const God, ses, id_f: Integer; const f_name: PChar);
var
  LV: TSetParametr;
begin
  @LV := GetProcAddress(HRMLs[ModuleId].Handle, 'SetParametr');
  if @LV <> nil
  then   LV (God, ses, id_f,f_name); 
end;


function SetUPlanId (ModuleId: Integer; const UID, FacID, SFID, Year: Integer;
                     const FacName: String): HResult;
var
  LV: TSetUPlanID;
begin
  Result := S_FALSE;
  @LV := GetProcAddress(HRMLs[ModuleId].Handle, 'SetUPlanId');
  if @LV <> nil
  then
    try
      LV (UID, FacID, SFID, Year, PChar (FacName));
      Result := S_OK;
    except
      Result := S_FALSE;
    end;
end;

function SetUPlanFGOSId (ModuleId: Integer; const UID, Course, Count_course, FacID, SFID, Year: Integer;
                     const FacName: String): HResult;
var
  LV: TSetUPlanFGOSID;
begin
  Result := S_FALSE;
  @LV := GetProcAddress(HRMLs[ModuleId].Handle, 'SetUPlanFGOSId');
  if @LV <> nil
  then
    try
      LV (UID, Course, Count_course, FacID, SFID, Year, PChar (FacName));
      Result := S_OK;
    except
      Result := S_FALSE;
    end;
end;

function SetPrintMode (ModuleId: Integer;const PrintMode: Cardinal): HResult;
var
  PM: TSetPrintMode;
begin
  Result := S_FALSE;
  @PM := GetProcAddress(HRMLs[ModuleId].Handle, 'SetPrintMode');
  if @PM <> nil
  then
    try
      PM (PrintMode);
      Result := S_OK;
    except
      Result := S_FALSE;
    end;
end;

end.
