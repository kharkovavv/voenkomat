unit Mod_sverka;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrlsEh, StdCtrls, Buttons, DBCtrls, ExtCtrls;

type
  TfmMod_Sverka = class(TForm)
    pnl1: TPanel;
    Label1: TLabel;
    DBMemo1: TDBMemo;
    pnl2: TPanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Label13: TLabel;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMod_Sverka: TfmMod_Sverka;

implementation
uses Sprav_dm, spisok;
{$R *.dfm}

procedure TfmMod_Sverka.btnOkClick(Sender: TObject);
begin
dmSprav.quSverkaID_CONSCRIPT.ASinteger:=dmSprav.quEmployersID.AsInteger;
fmSpisok.btnFilterClick(Sender);

end;

end.
