unit AddRod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrlsEh, DBCtrls, ExtCtrls, DBGridEh,
  DBLookupEh, db, clipbrd;

type
  TfmAddRod = class(TForm)
    pnl1: TPanel;
    Label1: TLabel;
    Label13: TLabel;
    DBMemo1: TDBMemo;
    pnl2: TPanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    DBDateTimeEditEh3: TDBDateTimeEditEh;
    Label12: TLabel;
    Label9: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    procedure btnOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAddRod: TfmAddRod;

implementation
uses sprav_dm, spisok, AddOrder;
{$R *.dfm}

procedure TfmAddRod.btnOkClick(Sender: TObject);
var id_order,i: integer;
begin
   dmSprav.quRodstvoID_CONSCRIPT.asInteger:=dmSprav.quEmployersID.AsInteger;
try
  id_order:=dmSprav.quEmployersID.AsInteger;
//==========================================================================================================
   if dmSprav.quRodstvo.State in [dsEdit, dsInsert]
    then dmSprav.quRodstvo.post;
   if not dmSprav.trSprav.Active
    then dmSprav.trSprav.StartTransaction;
   dmSprav.trSprav.Commit;
  except
   dmSprav.trSprav.Rollback;
   ShowMessage('Произошла ошибка при сохранении информации.');
  end;
  close;

  //переоткрываем запросы согласно установленным фильтрам
  fmSpisok.btnFilterClick(Sender);
  dmSprav.quEmployers.Locate('ID',id_order,[]);
    if not  dmSprav.quRodstvo.Active then
    begin
      dmSprav.quRodstvo.Close;
      dmSprav.quRodstvo.ParamByName('ID_CONSCRIPT').AsInteger:=id_order;
      //Clipboard.AsText:=dmSprav.quRodstvo.SelectSQL.Text;
      dmSprav.quRodstvo.Open;
    end;
    if not  dmSprav.quSverka.Active then
    begin
      dmSprav.quSverka.Close;
      dmSprav.quSverka.ParamByName('ID_CONSCRIPT').AsInteger:=id_order;
      //Clipboard.AsText:=dmSprav.quRodstvo.SelectSQL.Text;
      dmSprav.quSverka.Open;
    end;
  dmSprav.quRodstvo.Locate('ID',id_order,[]);
  dmSprav.quEmployers.Locate('ID',id_order,[]);

end;

procedure TfmAddRod.FormActivate(Sender: TObject);
begin
dmSprav.quSprRodstvo.Close;
      //Clipboard.AsText:=dmSprav.quSprRodstvo.SelectSQL.Text;
      dmSprav.quSprRodstvo.Open;
end;

end.
