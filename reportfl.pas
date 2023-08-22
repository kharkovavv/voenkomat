unit reportfl;

interface

uses Windows, DB, dbgrideh;

type
  TCallingProc = function (istrd: integer): integer; stdcall;

function BeginReport (App: HWND;
                      picFile: PChar;
                      cProc: TCallingProc): Bool; stdcall;
external 'reportfl.dll' name 'BeginReport';
// ������ ������������ ������

function EndReport: Bool; stdcall;
external 'reportfl.dll' name 'EndReport';
// ��������� ������������ ������ � ������� ���

function AbortReport: Bool; stdcall;
external 'reportfl.dll' name 'AbortReport';
// ��������� ������������ ������ � �� �������� ���

function WriteEndOfRecord: Bool; stdcall;
external 'reportfl.dll' name 'WriteEndOfRecord';
// �������� ����� ������� ������

function WriteData (name: PChar;
                    data: Pointer;
                    datatype,
                    level: Cardinal): Bool; stdcall;
external 'reportfl.dll' name 'WriteData';
// ������ ����� ������ (��������, ������ ��� ������ ���� ����� ������)

function WriteDataEx (name: PChar;
                      data: Pointer;
                      datatype,
                      level: Cardinal;
                      format: PChar;
                      fontstyle: Cardinal): Bool; stdcall;
external 'reportfl.dll' name 'WriteDataEx';
// ������ ����� ������ (��������, ������ ��� ������ ���� ����� ������)

function StoreMode (value: Cardinal): Cardinal; stdcall;
external 'reportfl.dll' name 'StoreMode';
// ������ ����� ������: ��� ��� ������ ������ ������

function PrintMode (value: Cardinal): Cardinal; stdcall;
external 'reportfl.dll' name 'PrintMode';
// ������ ����� ������: ������� �������� ��� ����� ������

function SetNull (Id: Cardinal; NewValue: PChar): PChar; stdcall;
external 'reportfl.dll' name 'SetNull';
// ��� �������� "������" ���� (NULL)

function WriteFooter (F: TColumnFooterEh): Boolean;

const
// ����� ������
  SM_ALL       = $01; // store all
  SM_DISTINCT  = $02; // store distinct rows only

// ����� ������
  PM_VIEW      = $00; // view
  PM_PRINT     = $01; // print

// ���� ������
  DT_INTEGER   = $00; // integer
  DT_STRING    = $01; // string
  DT_REAL      = $02; // double / float / real
  DT_DATE      = $03; // tdatetime  |  ������-��, ��� ���� � �� ��, �� � ������
  DT_TIME      = $04; // tdatetime  }  ����� ��-������� ���������������, ����
  DT_DATETIME  = $05; // tdatetime  |  �� ����� ������ (�. �. �� ���������)
  DT_CURRENCY  = $06; // currency

// ����� ������ (����� ������������� � �������������� 'OR' ��� '+'):
  FS_DEFAULT   = $00; // �� ���������
  FS_PLAIN     = $01; // �������
  FS_BOLD      = $02; // ����������
  FS_ITALIC    = $04; // ������
  FS_UNDERLINE = $08; // ������������
  FS_STRIKEOUT = $10; // �����������
  FS_DBLUNDER  = $20; // ������� �������������
  FS_SMALLCAPS = $40; // ����� ���������

implementation

function WriteFooter (F: TColumnFooterEh): Boolean;
const avg = 'AVG';
      sum = 'SUM';
      count = 'CNT';
var FName: String;
    S: String;
begin
  Result := True;

  case F.ValueType of
    fvtAvg: FName := avg;
    fvtSum: FName := sum;
    fvtCount: FName := count;
  else exit;
  end;

  FName := FName + F.Column.Field.FieldName;

  S := F.Column.Grid.GetFooterValue (0, F.Column);

  WriteData (PChar (FName), @S, DT_STRING, 0);
end;

end.
