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
      if not ((dmSprav.quEmployersID_TYPE_AGREEMENT.AsInteger=4) and (dmSprav.quEmployersID_TYPE_AGREEMENT.AsInteger=5)) // у договора о провелении олимпиад - свое доп соглашение
      then
       begin
        //if dmSprav.quEmployersSTATUS_AGREEMENT.AsInteger=1 then //доп. соглашение могут печататьс€ только после присвоени€ статуса "ѕроверен ќ—ќ"
         // begin
          button_selected:=MessageDlg('ѕечатать банковские реквизиты в доп. соглашении?',mtConfirmation,[mbYes, mbNo,mbCancel],0);
          if button_selected=mrYes then
          //if MessageDlg('ѕечатать банковские реквизиты в доп. соглашении?',mtConfirmation,[mbYes, mbNo],0)=mrYES then
                              begin
                                fmSpisok.not_print:=1;
                                b:=fmSpisok.print_bank_info(s);
                                if b='' then
                                  fmDop_contract.print_dop_contract_all // у остальных дог-в один шаблон дл€ доп. соглашений
                                  else
                                MessageDlg('Ќа форме редактировани€ данных о договоре не введены следующие реквизиты: '+#13+b+#13+'ƒоп. соглашение с банковскими реквизитами не может быть напечатано!', mtWarning,[mbOK],0)
                               end
                            else
                            if button_selected=mrNo then
                              begin
                                fmSpisok.not_print:=0;
                                fmDop_contract.print_dop_contract_all   // осо
                              end
        end
        // end
       // else ShowMessage('ƒоговор не проверен ќ—ќ. ƒополнительное соглашение не может быть напечатано!')
      else
      ShowMessage('ƒл€ данного типа договора нет доп. соглашени€!');
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
            ShowMessage('Ќет дополнительного соглашени€ дл€ печати акта выполненных работ!') else
           begin
             button_selected:=MessageDlg('ѕечатать банковские реквизиты в акте выполненных работ?',mtConfirmation,[mbYes, mbNo,mbCancel],0);
             if button_selected=mrYes then
            //if MessageDlg('ѕечатать банковские реквизиты в акте выполненных работ?',mtConfirmation,[mbYes, mbNo],0)=mrYES then
              begin
              fmSpisok.not_print:=1;
              b:=fmSpisok.print_bank_info(s);
              if b='' then  fmPrint.print_akt
              else
              MessageDlg('Ќе введены следующие реквизиты: '+#13+b+#13+'јкт выполненных работ с банковскими реквизитами не может быть напечатан!', mtWarning,[mbOK],0)
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
