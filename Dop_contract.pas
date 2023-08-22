unit Dop_contract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  GridsEh, DBAxisGridsEh, DBGridEh, StdCtrls, Mask, DBCtrls, ExtCtrls, Clipbrd,
  ComCtrls, ToolWin,reportfl;

type
  TfmDop_contract = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    Label3: TLabel;
    Label1: TLabel;
    DBMemo1: TDBMemo;
    CoolBar2: TCoolBar;
    ToolBar1: TToolBar;
    tbAdd: TToolButton;
    tbEdit: TToolButton;
    tbDelete: TToolButton;
    DBNavigator1: TDBNavigator;
    ToolButton5: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure print_dop_contract_all;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmDop_contract: TfmDop_contract;

implementation

uses sprav_dm, spisok, AddDopContract, menu, Registr, AddOrder, DB,
  Print_Dop_Contract;

{$R *.dfm}

procedure TfmDop_contract.FormShow(Sender: TObject);
begin
   dmSprav.quDopContract.DisableControls;
   dmSprav.quDopContract.Close;
   dmSprav.quDopContract.ParamByName('par1').AsInteger:=dmSprav.quEmployersID.AsInteger;;
   clipboard.asText:= dmSprav.quDopContract.SelectSQL.Text;
   dmSprav.quDopContract.Open;
   dmSprav.quDopContract.EnableControls;


end;

procedure TfmDop_contract.btnNewClick(Sender: TObject);
begin
    {  if not dmSprav.quEmployers.Active then
          fmSpisok.btnFilterClick(Sender);
         dmSprav.quDopContract.Insert;
       If fmMenu.ReadNameForm(fmAddDopContract)=false then
          fmAddDopContract:=TfmAddDopContract.Create(Self);
          fmAddDopContract.Caption:='Добавление информации о работодателе';
          if (IdUser=dmSprav.quEmployersID_USER.AsInteger) or (fmRegistr.is_bud=0) then
             fmAddDopContract.Show
            else ShowMessage('Вы не можете добавлять данные!');  }

end;


procedure TfmDop_contract.btnEditClick(Sender: TObject);
begin
{ if  dmSprav.quDopContract.Active  then
   begin
      if not dmSprav.quDopContract.IsEmpty  then
        begin
          dmSprav.quDopContract.edit;
            If fmMenu.ReadNameForm(fmAddDopContract)=false
             then fmAddDopContract:=TfmAddDopContract.Create(Self);
              fmAddDopContract.Caption:='Редактирование дополнительного соглашения';
            if (IdUser=dmSprav.quEmployersID_USER.AsInteger) or (fmRegistr.is_bud=0) then
             fmAddDopContract.Show
            else ShowMessage('Вы не можете редактировать данные!');
        end
      else ShowMessage('Нет данных для редактирования.');
   end
   else ShowMessage('запрос не активен');    }
end;

procedure TfmDop_contract.btnDelClick(Sender: TObject);
var id_dop_contract, id_employer:Integer;
begin
 {  id_dop_contract:=dmSprav.quDopContractID.AsInteger;
   id_employer:=dmSprav.quEmployersID.AsInteger;
  if  not dmSprav.quDopContract.IsEmpty then
     if (IdUser=dmSprav.quEmployersID_USER.AsInteger) or (fmRegistr.is_bud=0) then
      begin

          If MessageDlg('Удалить информациою о соглашении?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
             begin
              //удаляем проект
                 dmSprav.quFine.Close;
                 dmSprav.quFine.SQL.Clear;
                 dmSprav.quFine.SQL.Add('delete from emp_dop_contracts d');
                 dmSprav.quFine.SQL.Add('where d.id='+dmSprav.quDopContractID.AsString);
                 dmSprav.quFine.Open;
                 dmSprav.quFine.Close;

              //если больше нет доп соглашений ставим признак is_dop_contract в таблице работодатлей = 0
              if dmSprav.quDopContract.RecordCount=1 then
                begin
                 dmSprav.quEmployers.locate('ID',dmSprav.quDopContractID_EMPLOYER.asInteger,[]);
                 dmSprav.quEmployers.Edit;
                 dmSprav.quEmployersIS_DOP_CONTRACT.AsInteger:=0;
                 dmSprav.quEmployers.Post;
                end;

             //подтверждаем транзакцию
              try
               if not dmSprav.quDopContract.Transaction.Active
                then  dmSprav.quDopContract.Transaction.StartTransaction;
                 dmSprav.quDopContract.Transaction.Commit;
              except
                 dmSprav.quDopContract.Transaction.Rollback;
                 ShowMessage('Ошибка сохранения проекта приказа');
                 exit;
              end;
        //if not dmSprav.quSForm.Active then
          // dmSprav.quSForm.Open;



                     //переоткрываем запросы, согласно установленным фильтрам
            fmSpisok.btnFilterClick(Sender);
            dmSprav.quEmployers.Locate('ID',id_employer,[]);
            dmSprav.quDopContract.ParamByName('par1').AsInteger:=dmSprav.quEmployersID.AsInteger;
            dmSprav.quDopContract.Open;
            dmSprav.quDopContract.Locate('ID',id_dop_contract,[]);

       end;
       end
      else ShowMessage('Вы не можете удалять данные!')
     else
      ShowMessage('Нет данных для удаления!')      }

end;

procedure TfmDop_contract.print_dop_contract_all;
var OldCursor:TCursor; value:string;n,n2:real;
begin
 if not BeginReport (Application.Handle,
                    PChar (ExtractFilePath (Application.ExeName) + 'Dop_contract_b.dat'),
                    nil)
       then
       begin
         Abort;
         ShowMessage('Не найден файл "Dop_contract_b.dat"');
         exit;
       end;
  if not dmSprav.quDopContract.IsEmpty then
   begin
        //открытие запроса для печати доп соглашения
           dmSprav.quPrint_Dop_contract.Close;
           dmSprav.quPrint_Dop_contract.ParamByName('id_dop_contract').AsInteger:=dmSprav.quDopContractID.AsInteger;;
           //clipboard.asText:= dmSprav.quDopContract.SelectSQL.Text;
           dmSprav.quPrint_Dop_contract.Open;


       //dmSprav.quEmployers.DisableControls;
       OldCursor:=Screen.Cursor;
       Screen.Cursor:=crHourGlass;
       StoreMode (SM_DISTINCT);
       Application.ProcessMessages;
       //номер соглашения
       value:=dmSprav.quPrint_Dop_contractNUMBER_DOP_CONTRACT.asString;
       WriteData('number_dop', @value, DT_STRING, 0);
       //дата соглашения
       value:=DateToStr(dmSprav.quPrint_Dop_contractDATE_DOP_CONTRACT.AsDateTime);
       WriteData('date_dop', @value, DT_STRING, 0);
       // "к договору НОМЕР..."
       value:=dmSprav.quPrint_Dop_contractNUM_AGREEMENT.AsString;
       WriteData('number_dog', @value, DT_STRING, 0);
       //дата договора
       value:=DateToStr(dmSprav.quPrint_Dop_contractDATE_AGREEMENT.AsDateTime);
       WriteData('date_dog', @value, DT_STRING, 0);
       // проректор
       dmSprav.quPror.Close;
       dmSprav.quPror.Open;
       value:=dmSprav.quProrFIO_R.AsString;
       WriteData('prorector', @value, DT_STRING, 0);
       // Приказ по университету
       value:=dmSprav.quParamsPRIKAZ.AsString;
       WriteData('prikaz', @value, DT_STRING, 0);
       // образовательный партнер (работодатель)
       value:=dmSprav.quPrint_Dop_contractNAME.AsString; //работодатель
       WriteData('name_employer', @value, DT_STRING, 0);
       // директор учреждения(ФИО+ДОЛЖНОСТЬ)
       value:=dmSprav.quPrint_Dop_contractPOST_DIRECTOR_ROD.AsString;
       WriteData('post_director', @value, DT_STRING, 0);
       value:=dmSprav.quPrint_Dop_contractFIO_DIRECTOR_ROD.AsString;
       WriteData('name_director', @value, DT_STRING, 0);
       //документ о полномочиях учреждения
       value:=dmSprav.quPrint_Dop_contractDOCUMENT.AsString;
       WriteData('document', @value, DT_STRING, 0);
       // бюджет\внебюджет
       if dmSprav.quPrint_Dop_ContractIS_BUDGET.AsInteger=0 then
       begin
        value:=', обучающихся по договорам об образовании на обучение по образовательным программам высшего образования,';
        WriteData('vb', @value, DT_STRING, 0);
       end;
       //количество студентов
       value:=dmSprav.quPrint_Dop_ContractCOUNT_STUD.AsString;
       WriteData('count_stud', @value, DT_STRING, 0);
  // ==============================================================считаем сумму договора и страховых взносов
       //сумма договора
       n:=dmSprav.quPrint_Dop_ContractCOUNT_STUD.AsInteger*dmSprav.quPrint_Dop_ContractCOUNT_WEEKS.AsInteger*2*190*1.302;
       value:=floattostr(n);
       WriteData('sum_dog', @value, DT_STRING, 0);
       //страховые взносы
       n2:=n*0.302/1.302;
       value:=floattostr(n2);
       WriteData('sum_strah', @value, DT_STRING, 0);
  // ================================================================считаем сумму договора и страховых взносов

  //=================================== реквизиты учреждения
    if fmSpisok.not_print=1 then
     BEGIN
       value:='Код по ОКТМО '+dmSprav.quPrint_Dop_ContractOKTMO.AsString;
       WriteData('oktmo', @value, DT_STRING, 0);
       value:='Код по ОКПО '+dmSprav.quPrint_Dop_ContractOKPO.AsString;
       WriteData('okpo', @value, DT_STRING, 0);
       value:='р/с '+dmSprav.quPrint_Dop_ContractRS.AsString;
       WriteData('rs', @value, DT_STRING, 0);
       value:='Банк '+dmSprav.quPrint_Dop_ContractBANK.AsString;
       WriteData('bank', @value, DT_STRING, 0);
       value:='к/с '+dmSprav.quPrint_Dop_ContractKS.AsString;
       WriteData('ks', @value, DT_STRING, 0);
       value:='БИК '+dmSprav.quPrint_Dop_ContractBIK.AsString;
       WriteData('bik', @value, DT_STRING, 0);
       value:='ИНН '+dmSprav.quPrint_Dop_ContractINN.AsString;
       WriteData('inn', @value, DT_STRING, 0);
       value:='КПП '+dmSprav.quPrint_Dop_ContractKPP.AsString;
       WriteData('kpp', @value, DT_STRING, 0);
       if not dmSprav.quPrint_Dop_ContractKBK.IsNull then
        begin
        value:='КБК '+dmSprav.quPrint_Dop_ContractKBK.AsString;
        WriteData('kbk', @value, DT_STRING, 0);
        value:='л/с'+dmSprav.quPrint_Dop_ContractLS.AsString;
        WriteData('ls', @value, DT_STRING, 0);
        end;
     END;
        // подпись прроректора
        value:=dmSprav.quProrFIO.AsString;
        WriteData('prorector2', @value, DT_STRING, 0);
       // подпись глав.бух.
        value:=dmSprav.quParamsGLAV_BUX_FIO.AsString;
        WriteData('glav_bux_fio', @value, DT_STRING, 0);
       // подпись нач. ПФУ
        value:=dmSprav.quParamsFIOPFO.AsString;
        WriteData('fiopfo', @value, DT_STRING, 0);
       // директор учреждения
        value:=dmSprav.quPrint_Dop_ContractFIO_DIRECTOR.AsString;
        WriteData('fio_director2', @value, DT_STRING, 0);


      { itog:=0;
       while not dmAnswer.quReestrRes.Eof do
         begin
           //=============тип учреждения
           value:=dmAnswer.quReestrResNAME.asString;
           WriteData('NAME', @value, DT_STRING, 1);
           //============= количество
           value:=dmAnswer.quReestrResCOUNT.asString;
           WriteData('COUNT', @value, DT_STRING, 1);

           WriteEndOfRecord;
           itog:=itog+dmAnswer.quReestrResCOUNT.AsInteger;
           dmAnswer.quReestrRes.Next;
        end;
    WriteData('itog',@itog,DT_INTEGER, 0);  }

    //dmSprav.quEmployers.First;
    //dmSprav.quEmployers.EnableControls;
    EndReport;
    Screen.Cursor:=OldCursor;
  end
 else
  ShowMessage('Нет данных для печати!');
end;


procedure TfmDop_contract.ToolButton5Click(Sender: TObject);
var b,s:string;
begin
{if not dmSprav.quDopContract.IsEmpty then
      if dmSprav.quEmployersSTATUS_AGREEMENT.AsInteger=1 then
        begin
            If fmMenu.ReadNameForm(fmPrint_dop_contract)=false then
                               fmPrint_dop_contract:=TfmPrint_dop_contract.Create(Self);
                               fmPrint_dop_contract.Caption:='Печать';
                               fmPrint_dop_contract.ShowModal;
        END
      else
      ShowMessage('Договор не проверен ОСО. Печать невозможна.')
  else
  ShowMessage('Нет данных для печати!');  }
end;

procedure TfmDop_contract.FormActivate(Sender: TObject);
begin
if not dmSprav.quPror.Active then
   dmSprav.quPror.Open;
if not dmSprav.quParams.Active then
   dmSprav.quParams.Open;
end;

end.
