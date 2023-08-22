unit cipher;

interface

function DoCipher(S: string): string;

implementation

function DoCipher(S: string): string;
const
  MagicSize = 10;
  Magic1: array [0..MagicSize-1] of Integer = (-$3F, -$04, $28, -$38, -$04, $18,
    $02, -$01, $37, $74);
  Magic2: array [0..MagicSize-1] of Byte = ($41, $04, $68, $48, $04, $28, $0E,
    $01, $C8, $8B);
var
  I: Integer;
begin
{$WARNINGS OFF}
  Result := S;
  for I := 0 to MagicSize - 1 do
    case Random(2) of
      0: if I < Length(Result) then
           Result[I + 1] := Chr(Ord(Result[I + 1]) + Magic1[I])
         else
           Result := Result + Chr(Magic1[I]);
      1: if I < Length(Result) then
           Result[I + 1] := Chr(Ord(Result[I + 1]) xor Magic2[I])
         else
           Result := Result + Chr($FF xor Magic2[I]);
    end;
{$WARNINGS ON}
end;

initialization
  Randomize;
end.

