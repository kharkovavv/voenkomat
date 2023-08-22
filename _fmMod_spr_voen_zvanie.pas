unit _fmMod_spr_voen_zvanie;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, ExtCtrls;

type
  TfmMod_spr_voen_zvanie = class(TForm)
    pnl1: TPanel;
    Label1: TLabel;
    DBMemo1: TDBMemo;
    pnl2: TPanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMod_spr_voen_zvanie: TfmMod_spr_voen_zvanie;

implementation

{$R *.dfm}
uses sprav_dm;
end.
