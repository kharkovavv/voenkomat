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
   button_selected:=MessageDlg('�������� ���������� ��������� � ��������?',mtConfirmation,[mbYes, mbNo, mbCancel],0);
  //  if MessageDlg('�������� ���������� ��������� � ��������?',mtConfirmation,[mbYes, mbNo, mbCancel],0)=mrYes then
  if button_selected=mrYes then
                        begin
                        fmSpisok.not_print:=1; // �������� ���������
                         b:=fmSpisok.print_bank_info(s);
                          if b='' then  print_pract_agree   // ���
                          else
                          MessageDlg('�� ������� ��������� ���������: '+#13+b+#13+'������� � ����������� ����������� �� ����� ���� ���������!', mtWarning,[mbOK],0)
                        end
                      else
                       if button_selected=mrNo then
                       begin
                        print_pract_agree;
                        fmSpisok.not_print:=0;// �� ���� �������� ���������
                       end
    else
      if rbCalendar.Checked then
        print_calendar_plan;
end;


procedure TfmPrint.print_calendar_plan; //������ ������������ �����
var OldCursor:TCursor; value:string;
begin
 {if not BeginReport (Application.Handle,
                    PChar (ExtractFilePath (Application.ExeName) + 'kalendarniy_plan.dat'),
                    nil)
       then
       begin
         Abort;
         ShowMessage('�� ������ ���� "kalendarniy_plan.dat"');
         exit;
       end;
  if not dmSprav.quEmployers.IsEmpty then
   begin
       //dmSprav.quEmployers.DisableControls;
       OldCursor:=Screen.Cursor;
       Screen.Cursor:=crHourGlass;
       StoreMode (SM_DISTINCT);
       Application.ProcessMessages;

       // "� �������� �����..."
       value:=dmSprav.quEmployersNUM_AGREEMENT.AsString;
       WriteData('number_dog', @value, DT_STRING, 0);
       //���� ��������
       value:=DateToStr(dmSprav.quEmployersDATE_AGREEMENT.AsDateTime);
       WriteData('date_dog', @value, DT_STRING, 0);
       // ������\���������
       if dmSprav.quEmployersIS_BUDGET.AsInteger=0 then
       begin
        value:=', ����������� �� ��������� �� ����������� �� �������� �� ��������������� ���������� ������� �����������,';
        WriteData('vb', @value, DT_STRING, 0);
       end;


       // �������� ����������
        value:=dmSprav.quEmployersFIO_DIRECTOR.AsString;
        WriteData('fio_director2', @value, DT_STRING, 0);
    EndReport;
    Screen.Cursor:=OldCursor;
  end
 else
  ShowMessage('��� ������ ��� ������!'); }
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
         ShowMessage('�� ������ ���� "akt_vipolnennih_rabot.dat"');
         exit;
       end;
  if not dmSprav.quEmployers.IsEmpty then
   begin
           //�������� ������� ��� ������ ����
           dmSprav.quPrint_Akt.Close;
           dmSprav.quPrint_Akt.ParamByName('id_employer').AsInteger:=dmSprav.quEmployersID.AsInteger;
           //clipboard.asText:= dmSprav.quPrint_Akt.SQL.Text;
           dmSprav.quPrint_akt.Open;

       //dmSprav.quEmployers.DisableControls;
       OldCursor:=Screen.Cursor;
       Screen.Cursor:=crHourGlass;
       StoreMode (SM_DISTINCT);
       Application.ProcessMessages;

       // "� �������� �����..."
       value:=dmSprav.quPrint_AktNUM_AGREEMENT.AsString;
       WriteData('number_dog', @value, DT_STRING, 0);
       //���� ��������
       value:=DateToStr(dmSprav.quPrint_aktDATE_AGREEMENT.AsDateTime);
       WriteData('date_dog', @value, DT_STRING, 0);

       // "� ���. ����������..."
       value:=dmSprav.quPrint_akt.fieldbyname('NUMBER_DOP_CONTRACT').asString;
       WriteData('number_dop', @value, DT_STRING, 0);
       //���� ��������
       value:=DateToStr(dmSprav.quPrint_akt.fieldbyName('DATE_DOP_CONTRACT').AsDateTime);
       WriteData('date_dop', @value, DT_STRING, 0);

       // ==============================================================������� ����� ��������
       n:=dmSprav.quPrint_akt.fieldbyname('COUNT_STUD').AsInteger*dmSprav.quPrint_akt.fieldbyname('COUNT_WEEKS').AsInteger*2*190*1.302;
       k:=SumNumToFull(n);
       value:=floattostr(n);
       WriteData('sum_dog', @value, DT_STRING, 0);
       WriteData('sum_dog_string', @k, DT_STRING, 0);
       //===================================================================

       // ������\���������
       if dmSprav.quPrint_aktIS_BUDGET.AsInteger=0 then
       begin
        value:=', ����������� �� ��������� �� ����������� �� �������� �� ��������������� ���������� ������� �����������,';
        WriteData('vb', @value, DT_STRING, 0);
       end;

       //=====================//���������=====================
       //����� � ���������
       if dmSprav.quPrint_aktPHONE.IsNull then
       value:='|PAR:'+dmSprav.quEmployersADRESS.AsString else
       value:='|PAR:'+dmSprav.quEmployersADRESS.AsString+', ���. '+dmSprav.quPrint_aktPHONE.AsString;
       WriteData('adress_phone', @value, DT_STRING, 0);

       if fmSpisok.not_print=1 then //�������� � ����������� �����������
       BEGIN
             if not dmSprav.quPrint_aktOKONH.IsNull then
              begin
                value:='����� '+dmSprav.quPrint_aktOKONH.AsString;
                WriteData('okonh', @value, DT_STRING, 0);
              end;
             if not dmSprav.quPrint_aktOKPO.IsNull then
              begin
                value:='���� '+dmSprav.quPrint_aktOKPO.AsString;
                WriteData('okpo', @value, DT_STRING, 0);
              end;
             if not dmSprav.quPrint_aktINN.IsNull then
              begin
                value:='��� '+dmSprav.quPrint_aktINN.AsString;
                WriteData('inn', @value, DT_STRING, 0);
              end;
             if not dmSprav.quPrint_aktKPP.IsNull then
              begin
                value:='��� '+dmSprav.quPrint_aktKPP.AsString+'|PAR:';
                WriteData('kpp', @value, DT_STRING, 0);
              end;
              if not dmSprav.quPrint_aktLS.IsNull then
              begin
                value:='�/��. '+dmSprav.quPrint_aktLS.AsString;
                WriteData('ls', @value, DT_STRING, 0);
              end;
             if not dmSprav.quPrint_aktRS.IsNull then
              begin
                value:='�/��. '+dmSprav.quPrint_aktRS.AsString+'|PAR:';
                WriteData('rs', @value, DT_STRING, 0);
              end;
             if not dmSprav.quPrint_aktBANK.IsNull then
              begin
                value:='� '+dmSprav.quPrint_aktBANK.AsString+'|PAR:';
                WriteData('bank', @value, DT_STRING, 0);
              end;
             if not dmSprav.quPrint_aktBIK.IsNull then
              begin
                value:='��� '+dmSprav.quPrint_aktBIK.AsString;
                WriteData('bik', @value, DT_STRING, 0);
              end;
       END;
      // �������
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
  ShowMessage('��� ������ ��� ������!');}
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
         ShowMessage('�� ������ ���� "Agreement_b.dat"');
         exit;
       end;
  if not dmSprav.quEmployers.IsEmpty then
   begin
       //dmSprav.quEmployers.DisableControls;
       OldCursor:=Screen.Cursor;
       Screen.Cursor:=crHourGlass;
       StoreMode (SM_DISTINCT);
       Application.ProcessMessages;

       // ���������
       dmSprav.quPror.Close;
       dmSprav.quPror.Open;
       value:=dmSprav.quProrFIO_R.AsString;
       WriteData('prorector', @value, DT_STRING, 0);
       //������ �� ������������
       value:=dmSprav.quParamsPRIKAZ.AsString;
       WriteData('prikaz', @value, DT_STRING, 0);
       //����������-������������
       value:=dmSprav.quEmployersNAME.AsString;
       WriteData('name_employer', @value, DT_STRING, 0);
       // �������� ����������(���+���������)
       value:=dmSprav.quEmployersPOST_DIRECTOR_ROD.AsString;
       WriteData('post_director', @value, DT_STRING, 0);
       value:=dmSprav.quEmployersFIO_DIRECTOR_ROD.AsString;
       WriteData('name_director', @value, DT_STRING, 0);
       //�������� � ����������� ����������
       value:=dmSprav.quEmployersDOCUMENT.AsString;
       WriteData('document', @value, DT_STRING, 0);

       // ������\�������
       if dmSprav.quEmployersIS_BUDGET.AsInteger=0 then
        begin
         value:=', ����������� �� ��������� �� ����������� �� �������� �� ��������������� ���������� ������� �����������, ';
         WriteData('vb', @value, DT_STRING, 0);
        end;
       //���� ��������� ��������
       if dmSprav.quEmployersIS_UNLIMITED.AsInteger=0 then
       value:='�� '+dmSprav.quEmployersDATE_END.AsString+'�.' else
       value:='���������.';
       WriteData('date', @value, DT_STRING, 0);
       //=====================//���������=====================
       //����� � ���������
       if dmSprav.quEmployersPHONE.IsNull then
       value:='|PAR:'+dmSprav.quEmployersADRESS.AsString else
       value:='|PAR:'+dmSprav.quEmployersADRESS.AsString+', ���. '+dmSprav.quEmployersPHONE.AsString;
       WriteData('adress_phone', @value, DT_STRING, 0);

       if fmSpisok.not_print=1 then
       begin
             if not dmSprav.quEmployersOKONH.IsNull then
              begin
                value:='����� '+dmSprav.quEmployersOKONH.AsString;
                WriteData('okonh', @value, DT_STRING, 0);
              end;
             if not dmSprav.quEmployersOKPO.IsNull then
              begin
                value:='���� '+dmSprav.quEmployersOKPO.AsString;
                WriteData('okpo', @value, DT_STRING, 0);
              end;
             if not dmSprav.quEmployersINN.IsNull then
              begin
                value:='��� '+dmSprav.quEmployersINN.AsString;
                WriteData('inn', @value, DT_STRING, 0);
              end;
             if not dmSprav.quEmployersKPP.IsNull then
              begin
                value:='��� '+dmSprav.quEmployersKPP.AsString+'|PAR:';
                WriteData('kpp', @value, DT_STRING, 0);
              end;
              if not dmSprav.quEmployersLS.IsNull then
              begin
                value:='�/��. '+dmSprav.quEmployersLS.AsString;
                WriteData('ls', @value, DT_STRING, 0);
              end;
             if not dmSprav.quEmployersRS.IsNull then
              begin
                value:='�/��. '+dmSprav.quEmployersRS.AsString+'|PAR:';
                WriteData('rs', @value, DT_STRING, 0);
              end;
             if not dmSprav.quEmployersBANK.IsNull then
              begin
                value:='� '+dmSprav.quEmployersBANK.AsString+'|PAR:';
                WriteData('bank', @value, DT_STRING, 0);
              end;
             if not dmSprav.quEmployersBIK.IsNull then
              begin
                value:='��� '+dmSprav.quEmployersBIK.AsString;
                WriteData('bik', @value, DT_STRING, 0);
              end;
       end;
      // �������
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
     //��������� ��������� (������� ���������)
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
       ShowMessage('��������� ������ ��� ���������� ����������.');
      end;
    //close;
    //������������� ������� �������� ������������� ��������

  end
  //else
   //ShowMessage('������� ��� ���������!');
  end
 else
  ShowMessage('��� ������ ��� ������!');    }
end;                           


end.
