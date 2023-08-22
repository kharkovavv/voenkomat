unit AddOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, DBGridEh, DBCtrlsEh, DBLookupEh,
  ExtCtrls, Buttons, DB, jpeg, ComCtrls, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, GridsEh, DBAxisGridsEh, ToolWin, clipbrd;

type
  TfmAddEmployer = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    tsPrizyv: TTabSheet;
    pnl1: TPanel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    mmAdress: TDBMemo;
    tsZapas: TTabSheet;
    GroupBox4: TGroupBox;
    Label9: TLabel;
    Label13: TLabel;
    DBEdit2: TDBEdit;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    Label12: TLabel;
    DBDateTimeEditEh3: TDBDateTimeEditEh;
    DBMemo2: TDBMemo;
    Label2: TLabel;
    Label14: TLabel;
    DBMemo3: TDBMemo;
    Label4: TLabel;
    DBMemo4: TDBMemo;
    Label15: TLabel;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    tsRodstvo: TTabSheet;
    DBGridEh2: TDBGridEh;
    rbMArried: TRadioGroup;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    DBMemo1: TDBMemo;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    GroupBox6: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBMemo5: TDBMemo;
    Label19: TLabel;
    DBDateTimeEditEh4: TDBDateTimeEditEh;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    Label20: TLabel;
    DBDateTimeEditEh5: TDBDateTimeEditEh;
    tsSverka: TTabSheet;
    DBGridEh1: TDBGridEh;
    ToolBar2: TToolBar;
    btnNew: TToolButton;
    btnEdit: TToolButton;
    btnDel: TToolButton;
    DBNavigator1: TDBNavigator;
    pnl2: TPanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    DBLookupComboboxEh3: TDBLookupComboboxEh;
    Label6: TLabel;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    GroupBox1: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox7: TGroupBox;
    Label11: TLabel;
    DBDateTimeEditEh6: TDBDateTimeEditEh;
    Label21: TLabel;
    DBDateTimeEditEh7: TDBDateTimeEditEh;
    DBEdit6: TDBEdit;
    Label23: TLabel;
    Label24: TLabel;
    DBLookupComboboxEh4: TDBLookupComboboxEh;
    DBCheckBox2: TDBCheckBox;
    GroupBox8: TGroupBox;
    Label22: TLabel;
    Label25: TLabel;
    DBEdit7: TDBEdit;
    DBDateTimeEditEh8: TDBDateTimeEditEh;
    GroupBox9: TGroupBox;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    DBMemo6: TDBMemo;
    DBDateTimeEditEh9: TDBDateTimeEditEh;
    DBMemo7: TDBMemo;
    DBMemo8: TDBMemo;
    DBMemo9: TDBMemo;
    DBLookupComboboxEh5: TDBLookupComboboxEh;
    GroupBox10: TGroupBox;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    DBEdit8: TDBEdit;
    DBMemo10: TDBMemo;
    DBDateTimeEditEh10: TDBDateTimeEditEh;
    RadioGroup1: TRadioGroup;
    GroupBox11: TGroupBox;
    Label35: TLabel;
    Label36: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBCheckBox3: TDBCheckBox;
    DBMemo11: TDBMemo;
    DBDateTimeEditEh11: TDBDateTimeEditEh;
    DBDateTimeEditEh12: TDBDateTimeEditEh;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox12: TGroupBox;
    DBCheckBox4: TDBCheckBox;
    Label42: TLabel;
    DBEdit12: TDBEdit;
    Label43: TLabel;
    DBEdit13: TDBEdit;
    Label44: TLabel;
    DBEdit14: TDBEdit;
    GroupBox13: TGroupBox;
    Label49: TLabel;
    Label50: TLabel;
    DBEdit18: TDBEdit;
    DBDateTimeEditEh13: TDBDateTimeEditEh;
    Label51: TLabel;
    DBEdit19: TDBEdit;
    Label52: TLabel;
    DBEdit20: TDBEdit;
    Label53: TLabel;
    DBEdit21: TDBEdit;
    Label54: TLabel;
    DBEdit22: TDBEdit;
    Label55: TLabel;
    DBEdit23: TDBEdit;
    Label56: TLabel;
    DBEdit24: TDBEdit;
    Label57: TLabel;
    DBEdit25: TDBEdit;
    GroupBox14: TGroupBox;
    Label58: TLabel;
    DBEdit26: TDBEdit;
    Label59: TLabel;
    DBEdit27: TDBEdit;
    Label60: TLabel;
    DBEdit28: TDBEdit;
    Label61: TLabel;
    DBEdit29: TDBEdit;
    Label62: TLabel;
    DBEdit30: TDBEdit;
    DBDateTimeEditEh14: TDBDateTimeEditEh;
    Label64: TLabel;
    Label63: TLabel;
    DBEdit31: TDBEdit;
    Label65: TLabel;
    DBEdit32: TDBEdit;
    GroupBox15: TGroupBox;
    Label68: TLabel;
    DBEdit35: TDBEdit;
    Label66: TLabel;
    DBEdit33: TDBEdit;
    Label67: TLabel;
    DBEdit34: TDBEdit;
    Label69: TLabel;
    DBEdit36: TDBEdit;
    Label70: TLabel;
    DBEdit37: TDBEdit;
    GroupBox16: TGroupBox;
    Label75: TLabel;
    Label76: TLabel;
    DBEdit42: TDBEdit;
    DBDateTimeEditEh15: TDBDateTimeEditEh;
    Label77: TLabel;
    DBDateTimeEditEh16: TDBDateTimeEditEh;
    Label41: TLabel;
    DBEdit11: TDBEdit;
    Label40: TLabel;
    DBLookupComboboxEh7: TDBLookupComboboxEh;
    DBDateTimeEditEh17: TDBDateTimeEditEh;
    DBDateTimeEditEh18: TDBDateTimeEditEh;
    Label79: TLabel;
    Label80: TLabel;
    DBEdit43: TDBEdit;
    DBEdit44: TDBEdit;
    Label81: TLabel;
    Label82: TLabel;
    DBEdit45: TDBEdit;
    DBEdit46: TDBEdit;
    Label37: TLabel;
    Label83: TLabel;
    DBEdit47: TDBEdit;
    Label7: TLabel;
    edFIO: TDBEdit;
    GroupBox17: TGroupBox;
    Label46: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label45: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label73: TLabel;
    DBEdit15: TDBEdit;
    DBEdit38: TDBEdit;
    DBEdit39: TDBEdit;
    DBLookupComboboxEh8: TDBLookupComboboxEh;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit40: TDBEdit;
    Label78: TLabel;
    DBLookupComboboxEh9: TDBLookupComboboxEh;
    Label74: TLabel;
    DBEdit41: TDBEdit;
    Label84: TLabel;
    Label88: TLabel;
    DBEdit48: TDBEdit;
    GroupBox18: TGroupBox;
    Label85: TLabel;
    dbRazryad: TDBLookupComboboxEh;
    Label86: TLabel;
    dbSostav: TDBLookupComboboxEh;
    Label87: TLabel;
    cmb: TDBComboBoxEh;
    gbRA_VMF: TGroupBox;
    DBCheckBoxEh1: TDBCheckBoxEh;
    Label89: TLabel;
    DBCheckBox5: TDBCheckBox;
    Label90: TLabel;
    DBCheckBox6: TDBCheckBox;
    rbRA: TDBCheckBox;
    rbVMF: TDBCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure eCnt_allKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure btnNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
    id_order:integer;
  end;

var
  fmAddEmployer: TfmAddEmployer;

implementation

uses sprav_dm, spisok, Registr, menu, Sprav, Mod_sverka, IBCustomDataSet,
  AddRod, AddSverka;

{$R *.dfm}

procedure TfmAddEmployer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 // Action:=caFree;
end;

procedure TfmAddEmployer.btnOkClick(Sender: TObject);
var id_order,i: integer;
begin
   //проверяем заполнены ли все поля
  if (edFIO.Text='') then begin ShowMessage('Введите ФИО!'); edFIO.SetFocus; Exit; end;
  if ((cmb.Text<>'---') or (dbRazryad.Text<>'---') or (dbSostav.Text<>'---') or (rbRA.checked) or (rbVMF.checked)) then // если какое то из полей для отчета
  // заполнено, то должны быть заполнены все поля для отчета
   if  not ((cmb.Text<>'---') and (dbRazryad.Text<>'---') and (dbSostav.Text<>'---') and ((rbRA.checked) or (rbVMF.checked))) then
     begin
      ShowMessage('Введите все данные из поля "Для отчета"!'); Exit; end;
  if PageControl1.ActivePage=tsPrizyv then   //карточка призывника
    begin
      dmSprav.quEmployersIS_PRIZYV.AsInteger:=1;
      if rbMArried.ItemIndex=0 then dmSprav.quEmployersIS_MARRIED.AsInteger:=0
        else
         if rbMArried.ItemIndex=1 then dmSprav.quEmployersIS_MARRIED.AsInteger:=1 else
          if rbMArried.ItemIndex=2 then dmSprav.quEmployersIS_MARRIED.AsInteger:=2;
  end
  else
  if PageControl1.ActivePage=tsZapas then  //карточка запасника
    begin
      dmSprav.quEmployersIS_PRIZYV.AsInteger:=0;
      if RadioGroup1.ItemIndex=0 then dmSprav.quEmployersIS_MARRIED.AsInteger:=0 else
      if RadioGroup1.ItemIndex=1 then dmSprav.quEmployersIS_MARRIED.AsInteger:=1 else
      if RadioGroup1.ItemIndex=2 then dmSprav.quEmployersIS_MARRIED.AsInteger:=2 else
      dmSprav.quEmployersIS_MARRIED.AsInteger:=-1;
    end;

  if rbRa.Checked then
     dmSprav.quEmployersIS_RA.asInteger:=1 else
  if rbVMF.checked then
     dmSprav.quEmployersIS_VMF.asInteger:=1;
  //сохраняем изменения
 try
   id_order:=dmSprav.quEmployersID.AsInteger;
//==========================================================================================================
   if dmSprav.quEmployers.State in [dsEdit, dsInsert]
    then dmSprav.quEmployers.post;
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
 end;
//end;


procedure TfmAddEmployer.btnCancelClick(Sender: TObject);
var id_order:Integer;
begin
  id_order:=dmSprav.quEmployersID.AsInteger;
  //dmSprav.trSprav.Rollback;
  close;
  //переоткрываем запросы согласно установленным фильтрам
  fmSpisok.btnFilterClick(Sender);
  dmSprav.quEmployers.Locate('ID',id_order,[]);
end;

procedure TfmAddEmployer.eCnt_allKeyPress(Sender: TObject; var Key: Char);
begin
 if not ((Key in ['0'..'9']) or (Key=#8))  then Key:=#0;
  
end;


procedure TfmAddEmployer.FormActivate(Sender: TObject);
begin
id_order:=dmSprav.quEmployersid.AsInteger;
if not dmSprav.quTypeEduc.Active then
      dmSprav.quTypeEduc.Open;
if not dmSprav.quVoenSpec.Active then
      dmSprav.quVoenSpec.Open;
if not dmSprav.quFlaguage.Active then
      dmSprav.quFlaguage.Open;
if not dmSprav.quReshenie_prizyv_kom.Active then
      dmSprav.quReshenie_prizyv_kom.Open;
if not dmSprav.quVoenZvanie.Active then
      dmSprav.quVoenZvanie.Open;

if not dmSprav.quSPR_ANSWER_RAZRYAD .Active then
      dmSprav.quSPR_ANSWER_RAZRYAD.Open;
if not dmSprav.quSPR_ANSWER_SOSTAV .Active then
      dmSprav.quSPR_ANSWER_SOSTAV.Open;

      dmSprav.quSverka.Close;
      dmSprav.quSverka.ParamByName('ID_CONSCRIPT').AsInteger:=id_order;
      //Clipboard.AsT 1ext:=dmSprav.quSverka.SelectSQL.Text;
      dmSprav.quSverka.Open;


      dmSprav.quRodstvo.Close;
      dmSprav.quRodstvo.ParamByName('ID_CONSCRIPT').AsInteger:=id_order;
      //Clipboard.AsText:=dmSprav.quRodstvo.SelectSQL.Text;
      dmSprav.quRodstvo.Open;

if (fmSpisok.read_only=0) then
begin
  edFIO.ReadOnly:=true;
  if (dmSprav.quEmployersIS_PRIZYV.AsInteger=1)  then
     begin
       tsPrizyv.TabVisible:=true;
       tsRodstvo.TabVisible:=true;
       tsZapas.TabVisible:=false;
       tsSverka.TabVisible:=true;
     end
  else
   if (dmSprav.quEmployersIS_PRIZYV.AsInteger=0)  then
     begin
       tsPrizyv.TabVisible:=false;
       tsRodstvo.TabVisible:=true;
       tsZapas.TabVisible:=true;
     end;

  if dmSprav.quEmployersIS_PRIZYV.AsInteger=1 then //карточка призывника
    begin
       if dmSprav.quEmployersIS_MARRIED.AsInteger=0 then
         rbMArried.ItemIndex:=0 else
       if dmSprav.quEmployersIS_MARRIED.AsInteger=1 then
         rbMArried.ItemIndex:=1 else
       if dmSprav.quEmployersIS_MARRIED.AsInteger=2 then
            rbMArried.ItemIndex:=2
       else
          rbMArried.ItemIndex:=-1;
    end
 else
  if dmSprav.quEmployersIS_PRIZYV.AsInteger=0 then //карточка запасника
    begin
      if dmSprav.quEmployersIS_MARRIED.AsInteger=0 then RadioGroup1.ItemIndex:=0 else
      if dmSprav.quEmployersIS_MARRIED.AsInteger=1 then RadioGroup1.ItemIndex:=1  else
      if dmSprav.quEmployersIS_MARRIED.AsInteger=2 then RadioGroup1.ItemIndex:=2  else
      if dmSprav.quEmployersIS_MARRIED.AsInteger=-1 then RadioGroup1.ItemIndex:=-1;
    end;
end
else
    begin
     edFIO.ReadOnly:=false;
     if MessageDlg('Введение данных призывника? (да- призывник, нет - в запасе)', mtInformation,[mbYes, mbNo], 0)=mrYes
     then
       begin
           tsPrizyv.TabVisible:=true;
           tsZapas.TabVisible:=false;
       end
     else
       begin
           tsPrizyv.TabVisible:=false;
           tsZapas.TabVisible:=true;
       end;
           // при добавление человека - не нужнодобавлять его данные родства или сверок.
           //только при редактировании
           tsRodstvo.TabVisible:=false;
           tsSverka.TabVisible:=false;
     end;
if dmSprav.quEmployersIS_RA.AsInteger=1 then
   rbRA.Checked:=true else
if dmSprav.quEmployersIS_VMF.AsInteger=1 then
   rbVMF.Checked:=true;
edFIO.SetFocus;


end ;

procedure TfmAddEmployer.FormCreate(Sender: TObject);
begin
if not dmSprav.quTypeEduc.Active then
      dmSprav.quTypeEduc.Open;
end;

procedure TfmAddEmployer.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  fmAddEmployer.FormActivate(Sender);
end;

procedure TfmAddEmployer.btnNewClick(Sender: TObject);
var id_order:integer;
begin
  id_order:=dmSprav.quEmployersid.AsInteger;
  if PageControl1.ActivePage=tsRodstvo then
  begin
    if not dmSprav.quRodstvo.Active then
      begin
       dmSprav.quRodstvo.Close;
       dmSprav.quRodstvo.ParamByName('ID_CONSCRIPT').AsInteger:=id_order;
       //Clipboard.AsText:=dmSprav.quRodstvo.SelectSQL.Text;
       dmSprav.quRodstvo.Open;
      end;
       dmSprav.quRodstvo.Insert;
       If fmMenu.ReadNameForm(fmAddRod)=false then
          fmAddRod:=TfmAddRod.Create(Self);
          fmAddRod.Caption:='Добавление информации о родственнике';
            fmSpisok.read_only_rod:=1; // нажата кнопка "Добавить"
          fmAddRod.ShowModal;
  end
   else
   if PageControl1.ActivePage=tsSverka then
  begin
    if not dmSprav.quSverka.Active then
    begin
      dmSprav.quSverka.Close;
      dmSprav.quSverka.ParamByName('ID_CONSCRIPT').AsInteger:=id_order;
      //Clipboard.AsT 1ext:=dmSprav.quSverka.SelectSQL.Text;
      dmSprav.quSverka.Open;
    end;
    dmSprav.quSverka.Insert;
       If fmMenu.ReadNameForm(fmAddSverka)=false then
          fmAddSverka:=TfmAddSverka.Create(Self);
          fmAddSverka.Caption:='Добавление информации о родственнике';
            fmSpisok.read_only_rod:=1; // нажата кнопка "Добавить"
          fmAddSverka.ShowModal;
  end;


end;

procedure TfmAddEmployer.btnEditClick(Sender: TObject);
begin
   if PageControl1.ActivePage=tsRodstvo then
   begin
  if  dmSprav.quRodstvo.Active then
   begin
       dmSprav.quRodstvo.edit;
       If fmMenu.ReadNameForm(fmAddRod)=false
        then fmAddRod:=TfmAddRod.Create(Self);
       fmAddRod.Caption:='Редактирование проекта/приказа';
                  fmSpisok.read_only_rod:=0; //нажата кнопка "Редактировать"
                fmAddRod.ShowModal;
   end
  else ShowMessage('Нет данных для редактирования. Сформируйте список.');
  end
else
  if PageControl1.ActivePage=tsSverka
  then
   begin
    if  dmSprav.quSverka.Active then
   begin
       dmSprav.quSverka.edit;
       If fmMenu.ReadNameForm(fmAddSverka)=false
        then fmAddSverka:=TfmAddSverka.Create(Self);
       fmAddSverka.Caption:='Редактирование проекта/приказа';
                  fmSpisok.read_only_rod:=0; //нажата кнопка "Редактировать"
                fmAddSverka.ShowModal;
   end;
end;
end;
procedure TfmAddEmployer.btnDelClick(Sender: TObject);
var id_order:integer;
begin
id_order:=dmSprav.quEmployersid.AsInteger;

if PageControl1.ActivePage=tsRodstvo then
begin
 If MessageDlg('Удалить информацию о родственнике '+dmSprav.quRodstvoFIO.asString+'?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
             begin
                //удаляем проект
                    dmSprav.quFine.Close;
                    dmSprav.quFine.SQL.Clear;
                    dmSprav.quFine.SQL.Add('delete from c_rodstvo c');
                    dmSprav.quFine.SQL.Add('where c.id='+dmSprav.quRodstvoID.AsString);
                    dmSprav.quFine.Open;
                    dmSprav.quFine.Close;
                //подтверждаем транзакцию
                 try
                   if not dmSprav.quRodstvo.Transaction.Active
                     then  dmSprav.quRodstvo.Transaction.StartTransaction;
                   dmSprav.quRodstvo.Transaction.Commit;
                 except
                   dmSprav.quRodstvo.Transaction.Rollback;
                   ShowMessage('Ошибка сохранения');
                   exit;
                 end;

              end;
 end
 else
  if PageControl1.ActivePage=tsSverka then
   begin
     If MessageDlg('Удалить информацию о сверке от '+dmSprav.quSverkaDATE_SVERKA.asString+'?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
             begin
                //удаляем проект
                    dmSprav.quFine.Close;
                    dmSprav.quFine.SQL.Clear;
                    dmSprav.quFine.SQL.Add('delete from C_SVERKA_VOENKOM c');
                    dmSprav.quFine.SQL.Add('where c.id='+dmSprav.quSverkaID.AsString);
                    dmSprav.quFine.Open;
                    dmSprav.quFine.Close;
                //подтверждаем транзакцию
                 try
                   if not dmSprav.quSverka.Transaction.Active
                     then  dmSprav.quSverka.Transaction.StartTransaction;
                   dmSprav.quSverka.Transaction.Commit;
                 except
                   dmSprav.quSverka.Transaction.Rollback;
                   ShowMessage('Ошибка сохранения');
                   exit;
                 end;
              end;
   end;

 //переоткрываем запросы согласно установленным фильтрам
              fmSpisok.btnFilterClick(Sender);

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
dmSprav.quEmployers.Locate('ID',id_order,[]);
end;

end.
