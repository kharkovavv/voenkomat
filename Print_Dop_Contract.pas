unit Print_Dop_Contract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls,clipbrd;

type
  TfmPrint_dop_contract = class(TForm)
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    rbDop: TRadioButton;
    rbAkt: TRadioButton;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPrint_dop_contract: TfmPrint_dop_contract;

implementation

uses spisok, dop_contract, sprav_dm,print, IBQuery, DB;

{$R *.dfm}

procedure TfmPrint_dop_contract.btnOkClick(Sender: TObject);
var s,b:string;  button_selected:integer;
begin
 { if rbDop.Checked then
    begin
      if not ((dmSprav.quEmployersID_TYPE_AGREEMENT.AsInteger=4) and (dmSprav.quEmployersID_TYPE_AGREEMENT.AsInteger=5)) // � �������� � ���������� �������� - ���� ��� ����������
      then
       begin
        //if dmSprav.quEmployersSTATUS_AGREEMENT.AsInteger=1 then //���. ���������� ����� ���������� ������ ����� ���������� ������� "�������� ���"
         // begin
          button_selected:=MessageDlg('�������� ���������� ��������� � ���. ����������?',mtConfirmation,[mbYes, mbNo,mbCancel],0);
          if button_selected=mrYes then
          //if MessageDlg('�������� ���������� ��������� � ���. ����������?',mtConfirmation,[mbYes, mbNo],0)=mrYES then
                              begin
                                fmSpisok.not_print:=1;
                                b:=fmSpisok.print_bank_info(s);
                                if b='' then
                                  fmDop_contract.print_dop_contract_all // � ��������� ���-� ���� ������ ��� ���. ����������
                                  else
                                MessageDlg('�� ����� �������������� ������ � �������� �� ������� ��������� ���������: '+#13+b+#13+'���. ���������� � ����������� ����������� �� ����� ���� ����������!', mtWarning,[mbOK],0)
                               end
                            else
                            if button_selected=mrNo then
                              begin
                                fmSpisok.not_print:=0;
                                fmDop_contract.print_dop_contract_all   // ���
                              end
        end
        // end
       // else ShowMessage('������� �� �������� ���. �������������� ���������� �� ����� ���� ����������!')
      else
      ShowMessage('��� ������� ���� �������� ��� ���. ����������!');
    end
  else
  if rbAkt.Checked then
    begin
      dmSprav.quPrint_Akt.Close;
          dmSprav.quPrint_Akt.ParamByName('id_employer').AsInteger:=dmSprav.quEmployersid.AsInteger;
          dmSprav.quPrint_Akt.ParamByName('id_dop_contract').AsInteger:=dmSprav.quDopContractID.AsInteger;
         // ClipBoard.AsText:=dmSprav.quPrint_Akt.SQL.Text;
           dmSprav.quPrint_Akt.Open;
           if dmSprav.quPrint_AktNUMBER_DOP_CONTRACT.IsNull then
            ShowMessage('��� ��������������� ���������� ��� ������ ���� ����������� �����!') else
           begin
             button_selected:=MessageDlg('�������� ���������� ��������� � ���� ����������� �����?',mtConfirmation,[mbYes, mbNo,mbCancel],0);
             if button_selected=mrYes then
            //if MessageDlg('�������� ���������� ��������� � ���� ����������� �����?',mtConfirmation,[mbYes, mbNo],0)=mrYES then
              begin
              fmSpisok.not_print:=1;
              b:=fmSpisok.print_bank_info(s);
              if b='' then  fmPrint.print_akt
              else
              MessageDlg('�� ������� ��������� ���������: '+#13+b+#13+'��� ����������� ����� � ����������� ����������� �� ����� ���� ���������!', mtWarning,[mbOK],0)
              end
           else
           if button_selected=mrNo then
           begin
             fmSpisok.not_print:=0;
             fmPrint.print_akt;
           end;
           end; 
    end;  }

end;

end.
