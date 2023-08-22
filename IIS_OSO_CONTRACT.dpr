program IIS_OSO_CONTRACT;

uses
  Forms,
  menu in 'menu.pas' {fmMenu},
  sprav_dm in 'sprav_dm.pas' {dmSprav: TDataModule},
  reportfl in 'reportfl.pas',
  Sprav in 'Sprav.pas' {fmSprav},
  Registr in 'Registr.pas' {fmRegistr},
  spisok in 'spisok.pas' {fmSpisok},
  AddOrder in 'AddOrder.pas' {fmAddEmployer},
  _fmMod_spr_top_grant in '_fmMod_spr_top_grant.pas' {fmMod_spr_type_inst},
  rml in 'rml.pas',
  cipher in '..\..\cipher.pas',
  Dop_contract in 'Dop_contract.pas' {fmDop_contract},
  Answer in 'Answer.pas' {fmAnswer},
  answer_dm in 'answer_dm.pas' {dmAnswer: TDataModule},
  AddDopContract in 'AddDopContract.pas' {fmAddDopContract},
  Print in 'Print.pas' {fmPrint},
  FullSum in 'FullSum.pas',
  Print_Dop_Contract in 'Print_Dop_Contract.pas' {fmPrint_dop_contract},
  Mod_sverka in 'Mod_sverka.pas' {fmMod_Sverka},
  AddRod in 'AddRod.pas' {fmAddRod},
  AddSverka in 'AddSverka.pas' {fmAddSverka},
  _fmMod_spr_voen_zvanie in '_fmMod_spr_voen_zvanie.pas' {fmMod_spr_voen_zvanie},
  _fmMod_Spr_rodstvo in '_fmMod_Spr_rodstvo.pas' {fmMod_Spr_Rodstvo};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Военкомат';
  Application.CreateForm(TdmSprav, dmSprav);
  Application.CreateForm(TfmMenu, fmMenu);
  Application.CreateForm(TfmRegistr, fmRegistr);
  Application.CreateForm(TdmAnswer, dmAnswer);
  Application.CreateForm(TfmPrint_dop_contract, fmPrint_dop_contract);
  Application.CreateForm(TfmMod_Sverka, fmMod_Sverka);
  Application.CreateForm(TfmAddRod, fmAddRod);
  Application.CreateForm(TfmAddSverka, fmAddSverka);
  Application.CreateForm(TfmMod_spr_voen_zvanie, fmMod_spr_voen_zvanie);
  Application.CreateForm(TfmMod_Spr_Rodstvo, fmMod_Spr_Rodstvo);
  fmRegistr.ShowModal;
     Application.Run;
end.
