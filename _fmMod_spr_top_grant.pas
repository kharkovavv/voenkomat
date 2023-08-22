unit _fmMod_spr_top_grant;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEh, StdCtrls, Buttons, DBCtrlsEh, Mask, DBLookupEh,
  ExtCtrls, DBCtrls, DB;

type
  TfmMod_spr_type_inst = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    Label1: TLabel;
    DBMemo1: TDBMemo;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure lcVidChange(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMod_spr_type_inst: TfmMod_spr_type_inst;

implementation
uses sprav_dm;
{$R *.dfm}

procedure TfmMod_spr_type_inst.lcVidChange(Sender: TObject);
begin
 { if lcVid.Text<>''
   then  edNum.Text:=dmSprav.quGrant_vidNUM.AsString;     }
end;

procedure TfmMod_spr_type_inst.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action:=caFree;
end;

end.
