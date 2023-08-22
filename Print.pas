unit Print;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, reportfl, DB, clipbrd;

type
  TfmPrint = class(TForm)
    Panel1: TPanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    rbDog: TRadioButton;
    rbCalendar: TRadioButton;
    procedure btnOkClick(Sender: TObject);
    procedure print_pract_agree;
    procedure print_calendar_plan;
    procedure print_akt;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPrint: TfmPrint;

implementation

uses spisok, sprav_dm, fullsum;

{$R *.dfm}

procedure TfmPrint.btnOkClick(Sender: TObject);
var id_order, button_selected:Integer; s,b:string;
begin
   if rbDog.Checked then
   button_selected:=MessageDlg('Печатать банковские реквизиты в договоре?',mtConfirmation,[mbYes, mbNo, mbCancel],0);
  //  if MessageDlg('Печатать банковские реквизиты в договоре?',mtConfirmation,[mbYes, mbNo, mbCancel],0)=mrYes then
  if button_selected=mrYes then
                        begin
                        fmSpisok.not_print:=1; // печатаем реквизиты
                         b:=fmSpisok.print_bank_info(s);
                          if b='' then  print_pract_agree   // осо
                          else
                          MessageDlg('Не введены следующие реквизиты: '+#13+b+#13+'Договор с банковскими реквизитами не может быть напечатан!', mtWarning,[mbOK],0)
                        end
                      else
                       if button_selected=mrNo then
                       begin
                        print_pract_agree;
                        fmSpisok.not_print:=0;// не надо печатать реквизиты
                       end
    else
      if rbCalendar.Checked then
        print_calendar_plan;
end;


procedure TfmPrint.print_calendar_plan; //печать календарного плана
var OldCursor:TCursor; value:string;
begin
 {if not BeginReport (Application.Handle,
                    PChar (ExtractFilePath (Application.ExeName) + 'kalendarniy_plan.dat'),
                    nil)
       then
       begin
         Abort;
         ShowMessage('Не найден файл "kalendarniy_plan.dat"');
         exit;
       end;
  if not dmSprav.quEmployers.IsEmpty then
   begin
       //dmSprav.quEmployers.DisableControls;
       OldCursor:=Screen.Cursor;
       Screen.Cursor:=crHourGlass;
       StoreMode (SM_DISTINCT);
       Application.ProcessMessages;

       // "к договору НОМЕР..."
       value:=dmSprav.quEmployersNUM_AGREEMENT.AsString;
       WriteData('number_dog', @value, DT_STRING, 0);
       //дата договора
       value:=DateToStr(dmSprav.quEmployersDATE_AGREEMENT.AsDateTime);
       WriteData('date_dog', @value, DT_STRING, 0);
       // бюджет\внебюджет
       if dmSprav.quEmployersIS_BUDGET.AsInteger=0 then
       begin
        value:=', обучающихся по договорам об образовании на обучение по образовательным программам высшего образования,';
        WriteData('vb', @value, DT_STRING, 0);
       end;


       // директор учреждения
        value:=dmSprav.quEmployersFIO_DIRECTOR.AsString;
        WriteData('fio_director2', @value, DT_STRING, 0);
    EndReport;
    Screen.Cursor:=OldCursor;
  end
 else
  ShowMessage('Нет данных для печати!'); }
end;

procedure TfmPrint.print_akt;
var OldCursor:TCursor; value,k:string; n:real;
begin
 {if not BeginReport (Application.Handle,
                    PChar (ExtractFilePath (Application.ExeName) + 'akt_vipolnennih_rabot.dat'),
                    nil)
       then
       begin
         Abort;
         ShowMessage('Не найден файл "akt_vipolnennih_rabot.dat"');
         exit;
       end;
  if not dmSprav.quEmployers.IsEmpty then
   begin
           //открытие запроса для печати акта
           dmSprav.quPrint_Akt.Close;
           dmSprav.quPrint_Akt.ParamByName('id_employer').AsInteger:=dmSprav.quEmployersID.AsInteger;
           //clipboard.asText:= dmSprav.quPrint_Akt.SQL.Text;
           dmSprav.quPrint_akt.Open;

       //dmSprav.quEmployers.DisableControls;
       OldCursor:=Screen.Cursor;
       Screen.Cursor:=crHourGlass;
       StoreMode (SM_DISTINCT);
       Application.ProcessMessages;

       // "к договору НОМЕР..."
       value:=dmSprav.quPrint_AktNUM_AGREEMENT.AsString;
       WriteData('number_dog', @value, DT_STRING, 0);
       //дата договора
       value:=DateToStr(dmSprav.quPrint_aktDATE_AGREEMENT.AsDateTime);
       WriteData('date_dog', @value, DT_STRING, 0);

       // "к доп. соглашению..."
       value:=dmSprav.quPrint_akt.fieldbyname('NUMBER_DOP_CONTRACT').asString;
       WriteData('number_dop', @value, DT_STRING, 0);
       //дата договора
       value:=DateToStr(dmSprav.quPrint_akt.fieldbyName('DATE_DOP_CONTRACT').AsDateTime);
       WriteData('date_dop', @value, DT_STRING, 0);

       // ==============================================================считаем сумму договора
       n:=dmSprav.quPrint_akt.fieldbyname('COUNT_STUD').AsInteger*dmSprav.quPrint_akt.fieldbyname('COUNT_WEEKS').AsInteger*2*190*1.302;
       k:=SumNumToFull(n);
       value:=floattostr(n);
       WriteData('sum_dog', @value, DT_STRING, 0);
       WriteData('sum_dog_string', @k, DT_STRING, 0);
       //===================================================================

       // бюджет\внебюджет
       if dmSprav.quPrint_aktIS_BUDGET.AsInteger=0 then
       begin
        value:=', обучающихся по договорам об образовании на обучение по образовательным программам высшего образования,';
        WriteData('vb', @value, DT_STRING, 0);
       end;

       //=====================//РЕКВИЗИТЫ=====================
       //адрес в реквизиты
       if dmSprav.quPrint_aktPHONE.IsNull then
       value:='|PAR:'+dmSprav.quEmployersADRESS.AsString else
       value:='|PAR:'+dmSprav.quEmployersADRESS.AsString+', тел. '+dmSprav.quPrint_aktPHONE.AsString;
       WriteData('adress_phone', @value, DT_STRING, 0);

       if fmSpisok.not_print=1 then //печатать с банковскими реквизитами
       BEGIN
             if not dmSprav.quPrint_aktOKONH.IsNull then
              begin
                value:='ОКОНХ '+dmSprav.quPrint_aktOKONH.AsString;
                WriteData('okonh', @value, DT_STRING, 0);
              end;
             if not dmSprav.quPrint_aktOKPO.IsNull then
              begin
                value:='ОКПО '+dmSprav.quPrint_aktOKPO.AsString;
                WriteData('okpo', @value, DT_STRING, 0);
              end;
             if not dmSprav.quPrint_aktINN.IsNull then
              begin
                value:='ИНН '+dmSprav.quPrint_aktINN.AsString;
                WriteData('inn', @value, DT_STRING, 0);
              end;
             if not dmSprav.quPrint_aktKPP.IsNull then
              begin
                value:='КПП '+dmSprav.quPrint_aktKPP.AsString+'|PAR:';
                WriteData('kpp', @value, DT_STRING, 0);
              end;
              if not dmSprav.quPrint_aktLS.IsNull then
              begin
                value:='л/сч. '+dmSprav.quPrint_aktLS.AsString;
                WriteData('ls', @value, DT_STRING, 0);
              end;
             if not dmSprav.quPrint_aktRS.IsNull then
              begin
                value:='р/сч. '+dmSprav.quPrint_aktRS.AsString+'|PAR:';
                WriteData('rs', @value, DT_STRING, 0);
              end;
             if not dmSprav.quPrint_aktBANK.IsNull then
              begin
                value:='в '+dmSprav.quPrint_aktBANK.AsString+'|PAR:';
                WriteData('bank', @value, DT_STRING, 0);
              end;
             if not dmSprav.quPrint_aktBIK.IsNull then
              begin
                value:='БИК '+dmSprav.quPrint_aktBIK.AsString;
                WriteData('bik', @value, DT_STRING, 0);
              end;
       END;
      // подписи
        value:=dmSprav.quPrint_aktFIO_DIRECTOR.AsString;
          WriteData('name_director2', @value, DT_STRING, 0);

          dmSprav.quPror.Close;
          dmSprav.quPror.Open;
        value:=dmSprav.quProrFIO.AsString;
          WriteData('prorector2', @value, DT_STRING, 0);
    EndReport;
    Screen.Cursor:=OldCursor;
  end
 else
  ShowMessage('Нет данных для печати!');}
end;

procedure TfmPrint.print_pract_agree;
var OldCursor:TCursor; value:string; id_order:Integer;
begin
 { if not BeginReport (Application.Handle,
                    PChar (ExtractFilePath (Application.ExeName) + 'Agreement_b.dat'),
                    nil)
       then
       begin
         Abort;
         ShowMessage('Не найден файл "Agreement_b.dat"');
         exit;
       end;
  if not dmSprav.quEmployers.IsEmpty then
   begin
       //dmSprav.quEmployers.DisableControls;
       OldCursor:=Screen.Cursor;
       Screen.Cursor:=crHourGlass;
       StoreMode (SM_DISTINCT);
       Application.ProcessMessages;

       // проректор
       dmSprav.quPror.Close;
       dmSprav.quPror.Open;
       value:=dmSprav.quProrFIO_R.AsString;
       WriteData('prorector', @value, DT_STRING, 0);
       //приказ по университету
       value:=dmSprav.quParamsPRIKAZ.AsString;
       WriteData('prikaz', @value, DT_STRING, 0);
       //учреждение-работодатель
       value:=dmSprav.quEmployersNAME.AsString;
       WriteData('name_employer', @value, DT_STRING, 0);
       // директор учреждения(ФИО+ДОЛЖНОСТЬ)
       value:=dmSprav.quEmployersPOST_DIRECTOR_ROD.AsString;
       WriteData('post_director', @value, DT_STRING, 0);
       value:=dmSprav.quEmployersFIO_DIRECTOR_ROD.AsString;
       WriteData('name_director', @value, DT_STRING, 0);
       //документ о полномочиях учреждения
       value:=dmSprav.quEmployersDOCUMENT.AsString;
       WriteData('document', @value, DT_STRING, 0);

       // бюджет\внебюдж
       if dmSprav.quEmployersIS_BUDGET.AsInteger=0 then
        begin
         value:=', обучающихся по договорам об образовании на обучение по образовательным программам высшего образования, ';
         WriteData('vb', @value, DT_STRING, 0);
        end;
       //дата окончания договора
       if dmSprav.quEmployersIS_UNLIMITED.AsInteger=0 then
       value:='по '+dmSprav.quEmployersDATE_END.AsString+'г.' else
       value:='бессрочно.';
       WriteData('date', @value, DT_STRING, 0);
       //=====================//РЕКВИЗИТЫ=====================
       //адрес в реквизиты
       if dmSprav.quEmployersPHONE.IsNull then
       value:='|PAR:'+dmSprav.quEmployersADRESS.AsString else
       value:='|PAR:'+dmSprav.quEmployersADRESS.AsString+', тел. '+dmSprav.quEmployersPHONE.AsString;
       WriteData('adress_phone', @value, DT_STRING, 0);

       if fmSpisok.not_print=1 then
       begin
             if not dmSprav.quEmployersOKONH.IsNull then
              begin
                value:='ОКОНХ '+dmSprav.quEmployersOKONH.AsString;
                WriteData('okonh', @value, DT_STRING, 0);
              end;
             if not dmSprav.quEmployersOKPO.IsNull then
              begin
                value:='ОКПО '+dmSprav.quEmployersOKPO.AsString;
                WriteData('okpo', @value, DT_STRING, 0);
              end;
             if not dmSprav.quEmployersINN.IsNull then
              begin
                value:='ИНН '+dmSprav.quEmployersINN.AsString;
                WriteData('inn', @value, DT_STRING, 0);
              end;
             if not dmSprav.quEmployersKPP.IsNull then
              begin
                value:='КПП '+dmSprav.quEmployersKPP.AsString+'|PAR:';
                WriteData('kpp', @value, DT_STRING, 0);
              end;
              if not dmSprav.quEmployersLS.IsNull then
              begin
                value:='л/сч. '+dmSprav.quEmployersLS.AsString;
                WriteData('ls', @value, DT_STRING, 0);
              end;
             if not dmSprav.quEmployersRS.IsNull then
              begin
                value:='р/сч. '+dmSprav.quEmployersRS.AsString+'|PAR:';
                WriteData('rs', @value, DT_STRING, 0);
              end;
             if not dmSprav.quEmployersBANK.IsNull then
              begin
                value:='в '+dmSprav.quEmployersBANK.AsString+'|PAR:';
                WriteData('bank', @value, DT_STRING, 0);
              end;
             if not dmSprav.quEmployersBIK.IsNull then
              begin
                value:='БИК '+dmSprav.quEmployersBIK.AsString;
                WriteData('bik', @value, DT_STRING, 0);
              end;
       end;
      // подписи
        value:=dmSprav.quEmployersFIO_DIRECTOR.AsString;
          WriteData('name_director2', @value, DT_STRING, 0);
        value:=dmSprav.quProrFIO.AsString;
          WriteData('prorector2', @value, DT_STRING, 0);


    //dmSprav.quEmployers.First;
    //dmSprav.quEmployers.EnableControls;
    EndReport;
    Screen.Cursor:=OldCursor;

   if dmSprav.quEmployersIS_PRINT.AsInteger=0 then
     begin
     //сохраняем изменения (договор напечатан)
      try
       //id_order:=dmSprav.quEmployersID.AsInteger;
       dmSprav.quEmployers.Edit;
       dmSprav.quEmployersIS_PRINT.AsInteger:=1;
       if dmSprav.quEmployers.State in [dsEdit, dsInsert]
        then dmSprav.quEmployers.post;
       if not dmSprav.trSprav.Active
        then dmSprav.trSprav.StartTransaction;
       dmSprav.trSprav.Commit;
      except
       dmSprav.trSprav.Rollback;
       ShowMessage('Произошла ошибка при сохранении информации.');
      end;
    //close;
    //переоткрываем запросы согласно установленным фильтрам

  end
  //else
   //ShowMessage('Договор уже напечатан!');
  end
 else
  ShowMessage('Нет данных для печати!');    }
end;                           


end.
