unit Logs;

interface

procedure WriteLog (What: String);
// пишет строку в LOG
procedure WriteLogNow (What: String);
// пишет строку и текущее время в LOG
procedure WriteLogEx (Time: TDateTime; What: String);
// пишет строку и время в LOG

var
  DontLoadApp: Boolean = false;

implementation

uses
  Forms,
  SysUtils,
  Windows,
  Messages;

var
  LogFile: TextFile;
  LogFileName: String;

procedure WriteLog (What: String);
begin
  WriteLn (LogFile, What);
  Application.ProcessMessages;
end;

procedure WriteLogNow (What: String);
begin
  WriteLogEx (Now, What);
end;

procedure WriteLogEx (Time: TDateTime; What: String);
begin
  Write (LogFile, FormatDateTime ('ddddd", "tt ', Time));
  WriteLog (what);
end;

var
  H: THandle;
  I: Integer;
initialization
  H := FindWindow ('TfmMain', nil);

  I := 0;
  if H <> 0
  then
    I := GetWindowLong (H, GWL_USERDATA);

  if I = 934567
  then
  begin
    MessageBox (0, 'Приложение уже запущено', 'Ошибка', MB_ICONERROR or MB_OK);
    if H <> 0
    then
    begin
      ShowWindow (H, CmdShow);
      SetForegroundWindow (H);
    end;
    DontLoadApp := true;
    if Assigned (Application)
    then
      Application.Terminate;
  end
  else
  begin
    LogFileName := ChangeFileExt(ParamStr (0), '.log');
    AssignFile (LogFile, LogFileName);
    Rewrite (LogFile);
    WriteLogEx (Now, 'Application started');
  end;
finalization
  if not DontLoadApp
  then
  begin
    WriteLogEx (Now, 'Application finished');
    CloseFile (LogFile);
  end;
end.
