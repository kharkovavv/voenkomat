unit answer_dm;

interface

uses
  SysUtils, Classes, IBDatabase, sprav_dm, DB, IBCustomDataSet, IBQuery;

type
  TdmAnswer = class(TDataModule)
    trAnswer: TIBTransaction;
    quReestrInst: TIBQuery;
    dsReestrInst: TDataSource;
    quReestrInstID: TIntegerField;
    quReestrInstSMALL_NAME: TIBStringField;
    quReestrInstNUM_AGREEMENT: TIBStringField;
    quReestrInstDATE_AGREEMENT: TDateField;
    quReestrInstCONTACT: TIBStringField;
    quReestrInstPHONE: TIBStringField;
    quReestrInstEMAIL: TIBStringField;
    quReestrInstIS_DOP_CONTRACT: TIntegerField;
    quReestrInstTYPE_INST: TIBStringField;
    quReestrInstDATE_END: TDateField;
    quReestrInstNAME: TIBStringField;
    quOtchet: TIBQuery;
    dsOtchet: TDataSource;
    quOtchetRAZRYAD: TIBStringField;
    quOtchetSOSTAV: TIBStringField;
    quOtchetKOL_RA_ALL: TIntegerField;
    quOtchetKOL_VMF_ALL: TIntegerField;
    quOtchetKOL_ALL: TIntegerField;
    quOtchetKOL_RA_O: TIntegerField;
    quOtchetKOL_VMF_O: TIntegerField;
    quOtchetKOL_ALL_O: TIntegerField;
    quOtchetKOL_RA_S: TIntegerField;
    quOtchetKOL_VMF_S: TIntegerField;
    quOtchetKOL_ALL_S: TIntegerField;
    quFirst_kat_zapas: TIBQuery;
    dsFirst_kat_zapas: TDataSource;
    quFirst_kat_zapasFIO: TIBStringField;
    quFirst_kat_zapasNAME_RAZRYAD: TIBStringField;
    quFirst_kat_zapasNAME_SOSTAV: TIBStringField;
    quFirst_kat_zapasUCHET: TIBStringField;
    quFirst_kat_zapasVMF: TIBStringField;
    quFirst_kat_zapasRA: TIBStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmAnswer: TdmAnswer;

implementation

{$R *.dfm}

end.
