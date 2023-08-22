unit AddDopContract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEh, StdCtrls, Buttons, DBCtrls, DBCtrlsEh, DBLookupEh,
  ComCtrls, Mask, ExtCtrls, DB, Clipbrd;

type
  TfmAddDopContract = class(TForm)
    pnl1: TPanel;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    lbl4: TLabel;
    edNum_Agreement: TDBEdit;
    pnl2: TPanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    edSumm: TDBEdit;
    Label1: TLabel;
    EdNum_pay: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    cbFacultyPay: TDBLookupComboboxEh;
    Label4: TLabel;
    dtpDate1: TDBDateTimeEditEh;
    dtpDate2: TDBDateTimeEditEh;
    Label5: TLabel;
    dtpDate_akt: TDBDateTimeEditEh;
    Label7: TLabel;
    dtpDate3: TDBDateTimeEditEh;
    Label8: TLabel;
    edCount_Stud: TDBEdit;
    Label9: TLabel;
    edCount_Weeks: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAddDopContract: TfmAddDopContract;

implementation
uses  sprav_dm, spisok, Registr, menu, Dop_contract;
{$R *.dfm}

procedure TfmAddDopContract.FormCreate(Sender: TObject);
begin
//dtpDate1.Date:=Date;
//dtpDate2.Date:=Date;
end;

procedure TfmAddDopContract.btnOkClick(Sender: TObject);
var id_dop_contract,id_employer:Integer;
begin
 { //проверяем заполнены ли все поля
  if (edNum_Agreement.Text='') then begin ShowMessage('Введите номер дополнительного соглашения!'); edNum_Agreement.SetFocus; Exit; end;
  if (edSumm.Text='') then begin ShowMessage('Введите сумму оплаты!'); edSumm.SetFocus;Exit; end;
  if (EdNum_pay.Text='')  then begin ShowMessage('Введите номер платежного поручения!'); EdNum_pay.SetFocus;Exit; end;
  if (dtpDate1.Text)='  .  .    ' then begin ShowMessage('Введите дату доп.соглашения!'); Exit; end;
  if (dtpDate2.Text)='  .  .    ' then begin ShowMessage('Введите дату платежного поручения!'); Exit; end;
  if (edCount_Stud.Text='') then  begin ShowMessage('Введите количество студентов!'); Exit; end;
  if (edCount_Weeks.Text='') then begin ShowMessage('Введите количество недель!'); Exit; end;

  //сохраняем изменения
  try
   id_dop_contract:=dmSprav.quDopContractID.AsInteger;
   id_employer:=dmSprav.quEmployersID.AsInteger;
   dmSprav.quDopContractID_EMPLOYER.AsInteger:=dmSprav.quEmployersID.AsInteger;
   if dtpDate1.Text<>'' then
     dmSprav.quDopContractDATE_DOP_CONTRACT.AsDateTime:=StrToDate(dtpDate1.Text)
   else ShowMessage('Введите дату соглашения!');
   if dtpDate2.Text<>'' then
     dmSprav.quDopContractDATE_PAY.AsDateTime:=StrToDate(dtpDate2.Text)
   else ShowMessage('Введите дату платежного поручения!');

   dmSprav.quEmployers.locate('ID',dmSprav.quDopContractID_EMPLOYER.asInteger,[]);
   dmSprav.quEmployers.Edit;
   dmSprav.quEmployersIS_DOP_CONTRACT.AsInteger:=1;
   dmSprav.quEmployers.Post;

   if dmSprav.quDopContract.State in [dsEdit, dsInsert]
    then dmSprav.quDopContract.post;
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

     dmSprav.quEmployers.Locate('ID',id_employer,[]);

     dmSprav.quDopContract.ParamByName('par1').AsInteger:=dmSprav.quEmployersID.AsInteger;
     dmSprav.quDopContract.Open;

     dmSprav.quDopContract.Locate('ID',id_dop_contract,[]);  }
end;

procedure TfmAddDopContract.btnCancelClick(Sender: TObject);
var id_employer,id_dop_contract:Integer;
begin
  id_employer:=dmSprav.quEmployersID.AsInteger;
  id_dop_contract:=dmSprav.quDopContractID.AsInteger;
  dmSprav.trSprav.Rollback;
  close;
       //переоткрываем запросы согласно установленным фильтрам
     fmSpisok.btnFilterClick(Sender);
     dmSprav.quEmployers.Locate('ID',id_employer,[]);
     dmSprav.quDopContract.ParamByName('par1').AsInteger:=dmSprav.quEmployersID.AsInteger;
     dmSprav.quDopContract.Open;
    // dmSprav.quDopContract.Locate('ID',id_dop_contract,[]);
end;

procedure TfmAddDopContract.FormActivate(Sender: TObject);
begin
if not dmSprav.quFacult.Active then
 dmSprav.quFacult.Open;
 edNum_Agreement.SetFocus;
end;

end.
