unit reportfl;

interface

uses Windows, DB, dbgrideh;

type
  TCallingProc = function (istrd: integer): integer; stdcall;

function BeginReport (App: HWND;
                      picFile: PChar;
                      cProc: TCallingProc): Bool; stdcall;
external 'reportfl.dll' name 'BeginReport';
// начать формирование отчета

function EndReport: Bool; stdcall;
external 'reportfl.dll' name 'EndReport';
// закончить формирование отчета и вывести его

function AbortReport: Bool; stdcall;
external 'reportfl.dll' name 'AbortReport';
// закончить формирование отчета и не выводить его

function WriteEndOfRecord: Bool; stdcall;
external 'reportfl.dll' name 'WriteEndOfRecord';
// пометить конец текущей записи

function WriteData (name: PChar;
                    data: Pointer;
                    datatype,
                    level: Cardinal): Bool; stdcall;
external 'reportfl.dll' name 'WriteData';
// запись блока данных (например, строки или одного поля одной записи)

function WriteDataEx (name: PChar;
                      data: Pointer;
                      datatype,
                      level: Cardinal;
                      format: PChar;
                      fontstyle: Cardinal): Bool; stdcall;
external 'reportfl.dll' name 'WriteDataEx';
// запись блока данных (например, строки или одного поля одной записи)

function StoreMode (value: Cardinal): Cardinal; stdcall;
external 'reportfl.dll' name 'StoreMode';
// задаем режим записи: все или только разные строки

function PrintMode (value: Cardinal): Cardinal; stdcall;
external 'reportfl.dll' name 'PrintMode';
// задаем режим печати: сначала смотреть или сразу печать

function SetNull (Id: Cardinal; NewValue: PChar): PChar; stdcall;
external 'reportfl.dll' name 'SetNull';
// как выглядят "пустые" поля (NULL)

function WriteFooter (F: TColumnFooterEh): Boolean;

const
// режим записи
  SM_ALL       = $01; // store all
  SM_DISTINCT  = $02; // store distinct rows only

// режим печати
  PM_VIEW      = $00; // view
  PM_PRINT     = $01; // print

// типы данных
  DT_INTEGER   = $00; // integer
  DT_STRING    = $01; // string
  DT_REAL      = $02; // double / float / real
  DT_DATE      = $03; // tdatetime  |  вообще-то, это одно и то же, но в отчете
  DT_TIME      = $04; // tdatetime  }  будет по-разному отформатировано, если
  DT_DATETIME  = $05; // tdatetime  |  не задан формат (т. е. по умолчанию)
  DT_CURRENCY  = $06; // currency

// стиль шрифта (можно комбинировать с использованием 'OR' или '+'):
  FS_DEFAULT   = $00; // по умолчанию
  FS_PLAIN     = $01; // обычный
  FS_BOLD      = $02; // полужирный
  FS_ITALIC    = $04; // курсив
  FS_UNDERLINE = $08; // подчеркнутый
  FS_STRIKEOUT = $10; // зачеркнутый
  FS_DBLUNDER  = $20; // двойное подчеркивание
  FS_SMALLCAPS = $40; // малые прописные

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
