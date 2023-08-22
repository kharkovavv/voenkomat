//
//  ласс дл€ работы с отчетами в формате Word (через COM)
//
//              автор: ћ.ƒемидов, 17.04.2006
//
// ------------------------------------------------------
// ќсновна€ иде€:  шаблон  -  это документ, в котором дл€
// пометки мест, куда нужно что-то вставить, используютс€
// закладки.   —пециальные  методы  StartBand()/EndBand()
// позвол€ют выбрать закладку  (например,  ей может быть)
// помечена цела€ строка таблицы) и размножать ее столько
// раз, сколько вызываетс€  StartBand().  ѕри этом внутри
// нее тоже  могут  быть  закладки.  “ак реализован вывод
// в документ наборов данных.  ѕосле вставки каждой новой
// полосы  данных  закладки  внутри нее записываютс€  как
// обычно, а закладка дл€ самой  полосы удал€етс€.  ѕосле
// вызова  метода EndBand() удал€ютс€ все закладки внутри
// последней обработанной полосы
// ------------------------------------------------------

unit WordReport;

interface

uses
  Classes,
  SysUtils,
  WindowThread,
  Word;

const
  MaxLevel = 9;

resourceString
  sBadData = 'Data write error';
  sNotInProcess = 'Call to BeginReport() is missing';
  sFileNotFound = 'File %s not found';

  sDetailName = 'detail%d';  // do not localize!

const
  DT_INTEGER   = $00; // integer
  DT_STRING    = $01; // array of char or pascal-like string
  DT_REAL      = $02; // double / float / real etc.
  DT_DATE      = $03; // date
  DT_TIME      = $04; // time
  DT_DATETIME  = $05; // date & time

type
  EWordReport = class(Exception);
  ENoDataToWrite = class(EWordReport);
  ENotInProcess = class(EWordReport);
  EFileNotFound = class(EWordReport);

  TWordReport = class(TPersistent)
  private
    FTemplate: String;
    FProcess: Boolean;
    FBands: TStrings;
    FTW: TThreadWindow;
    FWordOperations: TWordOperations;

    procedure WriteDataInt (name: String;
                            data: Pointer;
                            datatype: Cardinal);
  public
    property Template: String read FTemplate;

    constructor CreateReport(const aTemplate: String);
    destructor Destroy; override;

    procedure BeginReport;
    procedure EndReport;

    procedure StartBand (Id: String; MakeBold: Boolean = false; MakeItalic: Boolean = false; Shaded: Boolean = false);
    procedure EndBand;

    procedure WriteData (const Name: String; const Data: String); overload;
    procedure WriteData (const Name: String; const Data: Integer); overload;
    procedure WriteData (const Name: String; const Data: Double); overload;
    procedure WriteData (const Name: String; const Data: TDateTime; const SubType: Cardinal); overload;
  end;

implementation

const
  DefFormats: Array [0..5] of String [20] = ('%d',              // integer
                                             '%s',              // string
                                             '0.00',            // real
                                             'ddddd',           // DT_DATE
                                             't',               // DT_TIME
                                             'ddddd'', ''t');   // DT_DATETIME

constructor TWordReport.CreateReport(const aTemplate: String);
begin
  Create;
  FProcess := False;
  FTemplate := aTemplate;
  FWordOperations := nil;
  FBands := TStringList.Create;
  if not FileExists (FTemplate)
  then
  begin
    FTemplate := ExtractFilePath (GetModuleName (hInstance) + FTemplate);
    
    if not FileExists (FTemplate)
    then
      raise EFileNotFound.CreateFmt(sFileNotFound, [FTemplate]);
  end;
end;

destructor TWordReport.Destroy;
begin
  FBands.Free;
  if Assigned (FWordOperations)
  then
    with FWordOperations
    do
    begin
      EndUpdate;
      Show;
      Free;
    end;
  inherited Destroy;
end;

procedure TWordReport.WriteDataInt (name: String;
                                    data: Pointer;
                                    datatype: Cardinal);
var
  S: String;
  Ok: Boolean;
begin
  if not FProcess
  then
    raise ENotInProcess.Create (sNotInProcess);
  s := DefFormats [datatype];
  Ok := true;
  case datatype
  of
    DT_INTEGER : s := Sysutils.Format (s, [integer (data^)]);
    DT_STRING  : s := Sysutils.Format (s, [string (data^)]);
    DT_REAL    : s := Sysutils.FormatFloat (s, double (data^));
    DT_DATE,
    DT_TIME,
    DT_DATETIME: s := FormatDateTime (s, tdatetime (data^));
  else
    Ok := False;
  end;

  if Ok
  then
  try
    Ok := FWordOperations.SetBookmarkText (name, s);
  except
    on E: Exception
    do
      raise EWordReport.Create (E.Message)
  end;
  if not Ok
  then
    raise ENoDataToWrite.Create (sBadData);
  if FBands.Count > 0
  then
    FWordOperations.RemoveBookmark (name);
  // this is because of stupid message about lack of memory
  FWordOperations.ClearUndoList;

  with FTW
  do
    if Percent >= 1000
    then
      Percent := 0
    else
      Percent := Percent + 1;
end;

procedure TWordReport.WriteData (const Name: String; const Data: String);
begin
  WriteDataInt (Name, @Data, DT_STRING)
end;

procedure TWordReport.WriteData (const Name: String; const Data: Integer);
begin
  WriteDataInt (Name, @Data, DT_INTEGER)
end;

procedure TWordReport.WriteData (const Name: String; const Data: Double);
begin
  WriteDataInt (Name, @Data, DT_REAL)
end;

procedure TWordReport.WriteData (const Name: String; const Data: TDateTime; const SubType: Cardinal);
begin
  WriteDataInt (Name, @Data, SubType)
end;

procedure TWordReport.BeginReport;
begin
  FTW := TThreadWindow.Show('ѕеренос данных в Word');
  FTW.Message := 'ѕеренос данных в Word';
  FProcess := true;
  FWordOperations := TWordOperations.Create(true);
  FWordOperations.BeginUpdate;
  try
    FWordOperations.OpenTemplate (FTemplate);
  except
    FWordOperations.EndUpdate;
    FWordOperations.Exit(True);
    raise;
  end;
end;

procedure TWordReport.EndReport;
begin
  FreeAndNil (FTW);
  FProcess := false;
  with FWordOperations
  do
  try
    while FBands.Count > 0
    do
      EndBand;
    EndUpdate;
    RecalcAllFields;
    ClearUndoList;
    Show;
    Free;
    FWordOperations := nil;
  except
    EndUpdate;
    Exit(True);
    FWordOperations := nil;
    raise;
  end;
end;

procedure TWordReport.StartBand (Id: String; MakeBold: Boolean = false; MakeItalic: Boolean = false; Shaded: Boolean = false);
var
  BiD: String;
begin
  while (Id <> '') and
        (FBands.Count > 0) and
        (Id <> FBands [FBands.Count - 1])
  do // забыли EndBand()
    EndBand;
  if FBands.Count = 0
  then
  begin
    FWordOperations.CopyBookmarkIntoClipboard (Id);
    FBands.Add (Id);
    BiD := Id;
  end
  else
  begin
    BiD := FBands [FBands.Count - 1];
    FWordOperations.PasteFromClipboardIntoBookmark (BiD, pmPasteAfter);
  end;
  FWordOperations.SetBookmarkFont(BiD, MakeBold, MakeItalic);
  if Shaded
  then
    FWordOperations.ShadeBookmark (BiD);
  
end;

procedure TWordReport.EndBand;
begin
  if FBands.Count > 0
  then
  begin
    FWordOperations.RemoveBookmark (FBands [FBands.Count - 1]);
    FBands.Delete (FBands.Count - 1);
  end;
end;

end.

