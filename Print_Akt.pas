unit Print_Akt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls;

type
  TfmPrint_dop_contract = class(TForm)
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    rbDog: TRadioButton;
    rbAkt: TRadioButton;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPrint_dop_contract: TfmPrint_dop_contract;

implementation

uses spisok, dop_contract;

{$R *.dfm}

end.
