unit _fmMod_Spr_rodstvo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, ExtCtrls;

type
  TfmMod_Spr_Rodstvo = class(TForm)
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
  fmMod_Spr_Rodstvo: TfmMod_Spr_Rodstvo;

implementation

{$R *.dfm}
uses sprav_dm;
end.
