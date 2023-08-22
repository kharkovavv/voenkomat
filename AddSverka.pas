unit AddSverka;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrlsEh, DBCtrls, ExtCtrls, db;

type
  TfmAddSverka = class(TForm)
    pnl1: TPanel;
    Label1: TLabel;
    Label12: TLabel;
    DBMemo1: TDBMemo;
    DBDateTimeEditEh3: TDBDateTimeEditEh;
    pnl2: TPanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAddSverka: TfmAddSverka;

implementation
uses sprav_dm, spisok;
{$R *.dfm}

procedure TfmAddSverka.btnOkClick(Sender: TObject);
var id_order: integer;
begin
 dmSprav.quSverkaID_CONSCRIPT.asInteger:=dmSprav.quEmployersID.AsInteger;
try
  id_order:=dmSprav.quEmployersID.AsInteger;
//==========================================================================================================
   if dmSprav.quSverka.State in [dsEdit, dsInsert]
    then dmSprav.quSverka.post;
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
    if not  dmSprav.quSverka.Active then
    begin
      dmSprav.quSverka.Close;
      dmSprav.quSverka.ParamByName('ID_CONSCRIPT').AsInteger:=id_order;
      //Clipboard.AsText:=dmSprav.quRodstvo.SelectSQL.Text;
      dmSprav.quSverka.Open;
    end;
    if not  dmSprav.quRodstvo.Active then
    begin
      dmSprav.quRodstvo.Close;
      dmSprav.quRodstvo.ParamByName('ID_CONSCRIPT').AsInteger:=id_order;
      //Clipboard.AsText:=dmSprav.quRodstvo.SelectSQL.Text;
      dmSprav.quRodstvo.Open;
    end;
  dmSprav.quSverka.Locate('ID',id_order,[]);
  dmSprav.quEmployers.Locate('ID',id_order,[]);

end;

end.
