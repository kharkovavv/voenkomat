Unit sprav_dm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables,DBIProcs, DBITypes, IBDatabase, IBCustomDataSet, IBQuery,Registry,
  IBSQL, IBEvents, reportfl,quickrpt, Qrctrls,Variants, IBStoredProc;

type
  TdmSprav = class(TDataModule)
    qUser: TIBQuery;
    quTypeEduc: TIBDataSet;
    dsTypeEduc: TDataSource;
    quTypeEducID: TIntegerField;
    quTypeEducNAME: TIBStringField;
    quResidenc: TIBQuery;
    dsResidenc: TDataSource;
    quResidencNAME: TIBStringField;
    dsVoenSpec: TDataSource;
    dsEmployers: TDataSource;
    quEmployers: TIBDataSet;
    quResidencID: TSmallintField;
    quDopContract: TIBDataSet;
    dsDopContract: TDataSource;
    quDopContractID: TIntegerField;
    quDopContractNUMBER_DOP_CONTRACT: TIBStringField;
    quDopContractDATE_DOP_CONTRACT: TDateField;
    quDopContractSUMM: TFloatField;
    quDopContractNUMBER_PAY: TIntegerField;
    quDopContractDATE_PAY: TDateField;
    quDopContractID_FACULTY_PAY: TIntegerField;
    quDopContractNAME_FACULTY: TIBStringField;
    quFacult: TIBQuery;
    dsFacult: TDataSource;
    quDopContractID_EMPLOYER: TIntegerField;
    quFacultID: TIntegerField;
    quFacultNAME: TIBStringField;
    quFacultLOGIN: TIBStringField;
    quFacultPWORD: TIBStringField;
    quFacultDEAN_FIO: TIBStringField;
    quFacultSTATUS: TSmallintField;
    quFacultDEAN_DUTY: TIBStringField;
    quFacultNAME_ROD: TIBStringField;
    quFacultPLAN_RECEPTION: TSmallintField;
    quFacultDEAN_FIO_ROD: TIBStringField;
    qUser_fac: TIBQuery;
    qUser_facID: TSmallintField;
    Ib_stud: TIBDatabase;
    trSprav: TIBTransaction;
    trnsMain: TIBTransaction;
    quPrint_Dop_Contract: TIBQuery;
    quPrint_order_2: TIBQuery;
    quPrint_order_2ID: TIntegerField;
    quPrint_order_2FIO: TIBStringField;
    quPrint_order_2KURS: TSmallintField;
    quPrint_order_2EDUC_LEVEL_CODE: TIBStringField;
    quPrint_order_2SPEC_NUM: TIBStringField;
    quPrint_order_2SPEC_NAME: TIBStringField;
    quPrint_order_2PROF_NAME: TIBStringField;
    quPrint_order_2IS_TOP_SOC_GRANT: TSmallintField;
    quPrint_order_2IS_CHARGE_PRIVILEGE: TSmallintField;
    quPrint_order_2DATE_GRANT_PRIVILEG: TDateField;
    quPrint_order_2PRIV: TIBStringField;
    quPrint_order_2IS_FEEL: TSmallintField;
    quPrint_order_2IS_STUD_COUNCIL: TSmallintField;
    quPrint_order_2IS_HEAD: TSmallintField;
    quPrint_order_2ID_EDUC_LEVEL: TSmallintField;
    quPrint_order_2DATE_ACADEM: TDateField;
    quPrint_order_2ID_OSO_GRANT: TIntegerField;
    quPrint_order_2IS_MN: TSmallintField;
    quPrint_order_2ID_SEX: TSmallintField;
    quPrint_order_2SPEC_NUM_2017: TIBStringField;
    quPrint_order_2IS_STANDART: TSmallintField;
    quPrint_order_2NUM_SPR: TIBStringField;
    quPrint_order_1: TIBQuery;
    quPrint_order_1ID: TIntegerField;
    quPrint_order_1FIO: TIBStringField;
    quPrint_order_1KURS: TSmallintField;
    quPrint_order_1EDUC_LEVEL_CODE: TIBStringField;
    quPrint_order_1SPEC_NUM: TIBStringField;
    quPrint_order_1SPEC_NAME: TIBStringField;
    quPrint_order_1PROF_NAME: TIBStringField;
    quPrint_order_1IS_GRANT_25: TSmallintField;
    quPrint_order_1IS_GRANT_50: TSmallintField;
    quPrint_order_1IS_CHARGE_PRIVILEGE: TSmallintField;
    quPrint_order_1DATE_GRANT_PRIVILEG: TDateField;
    quPrint_order_1PRIV: TIBStringField;
    quPrint_order_1IS_FEEL: TSmallintField;
    quPrint_order_1IS_STUD_COUNCIL: TSmallintField;
    quPrint_order_1IS_HEAD: TSmallintField;
    quPrint_order_1ID_EDUC_LEVEL: TSmallintField;
    quPrint_order_1GT_TYPE: TIBStringField;
    quPrint_order_1SUMM_GRANT: TIntegerField;
    quPrint_order_1IS_UCH: TSmallintField;
    quPrint_order_1ID_OSO_GRANT: TIntegerField;
    quPrint_order_1ID_TYPE: TIntegerField;
    quPrint_order_1SC_NAME: TIBStringField;
    quPrint_order_1IS_MN: TSmallintField;
    quPrint_order_1IS_MO: TSmallintField;
    quPrint_order_1ID_CITIZEN: TSmallintField;
    quPrint_order_1ID_TARGET_REGION: TSmallintField;
    quPrint_order_1ID_SEX: TSmallintField;
    quPrint_order_1SPEC_NUM_2017: TIBStringField;
    quPrint_order_1IS_STANDART: TSmallintField;
    quPrint_order_1NUM_SPR: TIBStringField;
    quParams: TIBDataSet;
    dsParams: TDataSource;
    quFine: TIBQuery;
    iqCheckLocked: TIBSQL;
    ibeCheckLocked: TIBEvents;
    quParamsPRORECTOR_FIO: TIBStringField;
    quPror: TIBQuery;
    quParamsPRIKAZ: TIBStringField;
    quPrint_Dop_ContractNUMBER_DOP_CONTRACT: TIBStringField;
    quPrint_Dop_ContractDATE_DOP_CONTRACT: TDateField;
    quPrint_Dop_ContractNUM_AGREEMENT: TIBStringField;
    quPrint_Dop_ContractDATE_AGREEMENT: TDateField;
    quPrint_Dop_ContractNAME: TIBStringField;
    quPrint_Dop_ContractFIO_DIRECTOR_ROD: TIBStringField;
    quPrint_Dop_ContractDOCUMENT: TIBStringField;
    quPrint_Dop_ContractPOST_DIRECTOR_ROD: TIBStringField;
    quProrFIO_R: TIBStringField;
    quProrID: TIntegerField;
    quProrFIO: TIBStringField;
    quPrint_Dop_ContractOKONH: TIBStringField;
    quPrint_Dop_ContractKPP: TIBStringField;
    quPrint_Dop_ContractINN: TIBStringField;
    quPrint_Dop_ContractBIK: TIBStringField;
    quPrint_Dop_ContractOKPO: TIBStringField;
    quPrint_Dop_ContractRS: TIBStringField;
    quPrint_Dop_ContractLS: TIBStringField;
    quPrint_Dop_ContractBANK: TIBStringField;
    quPrint_Dop_ContractOKTMO: TIBStringField;
    quPrint_Dop_ContractKBK: TIBStringField;
    quPrint_Dop_ContractKS: TIBStringField;
    quParamsGLAV_BUX_FIO: TIBStringField;
    quParamsFIOPFO: TIBStringField;
    quPrint_Dop_ContractFIO_DIRECTOR: TIBStringField;
    quPrint_Dop_ContractBANK_PREDL: TIBStringField;
    quPrint_Dop_ContractIS_BUDGET: TSmallintField;
    quPrint_Dop_ContractPOST_DIRECTOR: TIBStringField;
    quPrint_Dop_ContractADRESS: TIBStringField;
    quPrint_Dop_ContractPHONE: TIBStringField;
    quPrint_Dop_ContractEMAIL: TIBStringField;
    quDopContractDATE_END_DOP_CONTRACT: TDateField;
    quPrint_Dop_ContractDATE_END_DOP_CONTRACT: TDateField;
    quDopContractDATE_AKT: TDateField;
    quDopContractCOUNT_STUD: TIntegerField;
    quDopContractCOUNT_WEEKS: TIntegerField;
    quPrint_Dop_ContractCOUNT_STUD: TIntegerField;
    quPrint_Dop_ContractCOUNT_WEEKS: TIntegerField;
    quPrint_Akt: TIBQuery;
    quPrint_AktID: TIntegerField;
    quPrint_AktID_TYPE_INSTITUTION: TIntegerField;
    quPrint_AktNAME: TIBStringField;
    quPrint_AktTYPE_INST: TIBStringField;
    quPrint_AktTYPE_AGREE: TIBStringField;
    quPrint_AktID_RESIDENC: TIntegerField;
    quPrint_AktREZIDENC: TIBStringField;
    quPrint_AktADRESS: TIBStringField;
    quPrint_AktNUMBER: TIBStringField;
    quPrint_AktIS_DOP_CONTRACT: TIntegerField;
    quPrint_AktNUM_AGREEMENT: TIBStringField;
    quPrint_AktSMALL_NAME: TIBStringField;
    quPrint_AktDATE_AGREEMENT: TDateField;
    quPrint_AktCONTACT: TIBStringField;
    quPrint_AktPHONE: TIBStringField;
    quPrint_AktEMAIL: TIBStringField;
    quPrint_AktIS_DOP_CONTRACT1: TIntegerField;
    quPrint_AktID_TYPE_AGREEMENT: TIntegerField;
    quPrint_AktIS_PRINT: TIntegerField;
    quPrint_AktDATE_END: TDateField;
    quPrint_AktSTATUS_AGREEMENT: TIntegerField;
    quPrint_AktID_USER: TIntegerField;
    quPrint_AktIS_ACTUAL: TSmallintField;
    quPrint_AktDOCUMENT: TIBStringField;
    quPrint_AktFIO_DIRECTOR: TIBStringField;
    quPrint_AktFIO_DIRECTOR_ROD: TIBStringField;
    quPrint_AktPOST_DIRECTOR: TIBStringField;
    quPrint_AktPOST_DIRECTOR_ROD: TIBStringField;
    quPrint_AktIS_UNLIMITED: TSmallintField;
    quPrint_AktOKONH: TIBStringField;
    quPrint_AktKPP: TIBStringField;
    quPrint_AktINN: TIBStringField;
    quPrint_AktBIK: TIBStringField;
    quPrint_AktOKPO: TIBStringField;
    quPrint_AktRS: TIBStringField;
    quPrint_AktLS: TIBStringField;
    quPrint_AktBANK: TIBStringField;
    quPrint_AktOKTMO: TIBStringField;
    quPrint_AktKBK: TIBStringField;
    quPrint_AktKS: TIBStringField;
    quPrint_AktBANK_PREDL: TIBStringField;
    quPrint_AktIS_BUDGET: TSmallintField;
    quPrint_AktCONTACT_DUTY: TIBStringField;
    quPrint_AktIS_OSO: TSmallintField;
    quPrint_AktNUMBER_DOP_CONTRACT: TIBStringField;
    quPrint_AktDATE_DOP_CONTRACT: TDateField;
    quPrint_AktID_FACULTY: TIntegerField;
    quPrint_AktNAMEFAC: TIBStringField;
    quPrint_AktSTATUSFAC: TSmallintField;
    quPrint_AktNAME_DEPART: TIBStringField;
    quPrint_AktCOUNT_STUD: TIntegerField;
    quPrint_AktCOUNT_WEEKS: TIntegerField;
    quMonitoring: TIBQuery;
    quMonitoringCOUNT_NO_NUM: TIntegerField;
    dsUser: TDataSource;
    quEmployersID: TIntegerField;
    quEmployersFIO: TIBStringField;
    qUserID: TIntegerField;
    qUserLOGIN: TIBStringField;
    qUserPWORD: TIBStringField;
    qUserFIO: TIBStringField;
    quEmployersNUM_PASSPORT: TIBStringField;
    quEmployersDATE_PASSPORT: TDateField;
    quEmployersWHO_PASSPORT: TIBStringField;
    quEmployersNUM_PRIZYV_PASSPORT: TIBStringField;
    quEmployersDATE_PRIZYV_PASSPORT: TDateField;
    quEmployersPLACE_BIRTH: TIBStringField;
    quEmployersADRESS_REG: TIBStringField;
    quEmployersADRESS_FACT: TIBStringField;
    quEmployersPLACE_WORK: TIBStringField;
    quEmployersID_EDUC: TSmallintField;
    quEmployersNAME_EDUC: TIBStringField;
    quVoenSpec: TIBDataSet;
    IntegerField1: TIntegerField;
    IBStringField1: TIBStringField;
    quSverka: TIBDataSet;
    dsSverka: TDataSource;
    quSverkaID: TIntegerField;
    quSverkaRESULT: TIBStringField;
    quSverkaDATE_SVERKA: TDateField;
    quSverkaID_CONSCRIPT: TIntegerField;
    quRodstvo: TIBDataSet;
    dsRodstvo: TDataSource;
    quRodstvoFIO: TIBStringField;
    quRodstvoDATE_BIRTH: TDateField;
    quRodstvoADRESS: TIBStringField;
    quRodstvoPLACE_WORK: TIBStringField;
    quRodstvoID_RODSTVO: TSmallintField;
    quRodstvoNAME_RODSTVO: TIBStringField;
    quRodstvoIS_SOVM: TSmallintField;
    quEmployersIS_PRIZYV: TSmallintField;
    quEmployersZHIL_ORGAN: TIBStringField;
    quEmployersMVD_ORGAN: TIBStringField;
    quEmployersDATE_VOEN_SPEC: TDateField;
    quEmployersPLACE_VOEN_SPEC: TIBStringField;
    quEmployersIS_SUD: TSmallintField;
    quEmployersSUD_PRIM: TIBStringField;
    quEmployersDATE_SUD_BEGIN: TDateField;
    quEmployersDATE_SUD_END: TDateField;
    quEmployersID_VOEN_SPEC: TSmallintField;
    quEmployersNAME_VOENSPEC: TIBStringField;
    quEmployersIS_MARRIED: TSmallintField;
    quRodstvoID: TIntegerField;
    quSprRodstvo: TIBDataSet;
    dsSprRodstvo: TDataSource;
    quSprRodstvoID: TIntegerField;
    quSprRodstvoNAME: TIBStringField;
    quRodstvoID_CONSCRIPT: TSmallintField;
    quEmployersID_FLANGUAGE: TSmallintField;
    quEmployersFLANGUAGE: TIBStringField;
    quFlaguage: TIBDataSet;
    IntegerField2: TIntegerField;
    IBStringField2: TIBStringField;
    dsFlanguage: TDataSource;
    quEmployersSPORT: TIBStringField;
    quEmployersDECISION_VOINSK_UCHET: TIBStringField;
    quEmployersDATE_DECISION_VOINSK_UCHET: TDateField;
    quEmployersDATE_DECISION_PRIZYV_KOM: TDateField;
    quEmployersID_DECISION_PRIZYV_KOM: TSmallintField;
    quEmployersIS_VOEN_UCHET: TSmallintField;
    quEmployersDECISION_PRIZYV_KOM_NAME: TIBStringField;
    quReshenie_prizyv_kom: TIBDataSet;
    IntegerField3: TIntegerField;
    IBStringField3: TIBStringField;
    dsReshenie_prizyv_kom: TDataSource;
    quEmployersNATION: TIBStringField;
    quEmployersGRAZHD_SPEC: TIBStringField;
    quEmployersID_VOEN_ZVANIE: TSmallintField;
    quEmployersKAT_ZAPAS: TIBStringField;
    quEmployersGROUP_UCHET: TIBStringField;
    quEmployersSOSTAV: TIBStringField;
    quEmployersNUM_COMMAND_AND_LITER: TIBStringField;
    quEmployersVUS: TIBStringField;
    quEmployersDOLZNOST: TIBStringField;
    quEmployersVOEN_ZVAN_KOD: TIBStringField;
    quEmployersNUM_MARSHRUT: TIBStringField;
    quEmployersYAVKA: TIBStringField;
    quEmployersPUNKT_YAVKI: TIBStringField;
    quEmployersDATE_MOB_PREDPIS: TDateField;
    quEmployersNUM_DOPUSK: TIBStringField;
    quEmployersALTER_VOIN_CHAST: TIBStringField;
    quEmployersALTER_KOD_VUS: TIBStringField;
    quEmployersALTER_TYPE_VVT: TIBStringField;
    quEmployersALTER_DATE_BEGIN: TIBStringField;
    quEmployersALTER_DATE_END: TIBStringField;
    quEmployersALTER_DATE_UVOLEN: TDateField;
    quEmployersZAKL_KOMAND_VOEN_CHAST: TIBStringField;
    quEmployersZAKL_VOEN_KOMISSAR: TIBStringField;
    quEmployersDATE_UBYL_K_MESTY_SL: TDateField;
    quEmployersDATE_POSTYPIL_NA_SL: TDateField;
    quEmployersDATE_PRIZVAN_NAPRAVLEN_MOBILIZ: TDateField;
    quEmployersROST: TSmallintField;
    quEmployersSIZE_HAD: TSmallintField;
    quEmployersSIZE_PROTIVOGAZ: TSmallintField;
    quEmployersSIZE_MUNDIR: TSmallintField;
    quEmployersSIZE_FOOT: TSmallintField;
    quEmployersTAKE_PART_BOY_ACTION: TIBStringField;
    quEmployersPRISYAGA: TIBStringField;
    quEmployersGOS_NAGRADA: TIBStringField;
    quEmployersTRAVMA: TIBStringField;
    quEmployersMOB_RESERV_DATE_BEGIN: TDateField;
    quEmployersMOB_RESERV_DATE_END: TDateField;
    quEmployersDOP_SVED: TIBStringField;
    quEmployersGOS_DAKT_REG: TIBStringField;
    quEmployersIND_DOZ_OBLUCH: TIBStringField;
    quEmployersDATE_VYDAN_VOEN_BILET: TDateField;
    quEmployersPRIBYL: TIBStringField;
    quEmployersYBYL: TIBStringField;
    quEmployersNACHALNIK: TIBStringField;
    quEmployersMOB_RESERV_OSNOVANIE: TIBStringField;
    quEmployersPHONE: TIBStringField;
    quVoenZvanie: TIBDataSet;
    IntegerField4: TIntegerField;
    IBStringField4: TIBStringField;
    dsVoenZvanie: TDataSource;
    quEmployersDATE_DECISION_VOIN_UCHET_SNYAT: TDateField;
    quEmployersKAT_GODNOSTI: TIBStringField;
    quEmployersID_ANSWER_RAZRYAD: TSmallintField;
    quEmployersID_ANSWER_SOSTAV: TSmallintField;
    quSPR_ANSWER_RAZRYAD: TIBDataSet;
    dsSPR_ANSWER_RAZRYAD: TDataSource;
    quSPR_ANSWER_SOSTAV: TIBDataSet;
    dsSPR_ANSWER_SOSTAV: TDataSource;
    quSPR_ANSWER_SOSTAVID: TIntegerField;
    quSPR_ANSWER_SOSTAVNAME: TIBStringField;
    quSPR_ANSWER_RAZRYADID: TIntegerField;
    quSPR_ANSWER_RAZRYADNAME: TIBStringField;
    quEmployersIS_UCHET: TSmallintField;
    quEmployersIS_RA: TSmallintField;
    quEmployersIS_VMF: TSmallintField;
    quEmployersIS_FIRST_KAT_ZAPAS: TSmallintField;
    quEmployersIS_SEX: TSmallintField;
    procedure dmSpravCreate(Sender: TObject);
    procedure ibeCheckLockedEventAlert(Sender: TObject; EventName: String;
      EventCount: Integer; var CancelAlerts: Boolean);
    procedure quOrderNewRecord(DataSet: TDataSet);
    procedure quOrderBeforePost(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmSprav: TdmSprav;
  Id_Depart: Integer;

implementation

uses menu, Sprav, cipher;

{$R *.DFM}


procedure TdmSprav.dmSpravCreate(Sender: TObject);
var  sPath, bPath, pass, pols  : String;
begin
 { sPath:=ExtractFilePath(Application.ExeName);
    with TRegistry.Create do
    try
      RootKey := HKEY_LOCAL_MACHINE;
      if OpenKeyReadOnly('\Software\Mik-Demidov\ReportManager\settings\')
      then
      try
        try
          bPath := ReadString('database1');
          pols := ReadString('user_name');
          pass := DoCipher(ReadString('password1'));
          Id_Depart := ReadInteger('Id_Depart');
        except
          bPath := 'NONE';
          pols := '';
        end;
      finally
        CloseKey;
      end;
    finally
      FREE;
    end;

 IF bPath='NONE' then
 begin
   ShowMessage('Не определены параметры подключения! Приложение будет закрыто.');
   Application.Terminate;
   exit;
 end;

Ib_Stud.DatabaseName := bPath;

with Ib_Stud.Params do
begin
 clear;
 add('user_name='+pols);
 add('password='+pass);
 add('lc_ctype=WIN1251');
end;


try
  Ib_Stud.Connected := true;
 except on e: exception do
   begin
   ShowMessage('Ошибка подключения. Проверьте параметры. ' + e.Message);
   Application.Terminate;
   exit;
   end;
  end;
//Вставлено  для принятия сообщения о том, что работа невозможна!

  dmSprav.trnsMain.Active:=true;
  dmSprav.iqCheckLocked.ExecQuery;
  if dmSprav.iqCheckLocked.Fields [0].AsInteger = 1 then
  begin
    dmSprav.trnsMain.Active:=false;
    ShowMessage('На сервере УМУ в настоящее время проводятся технические работы. '+chr(13)+
                '     Это означает, что работа с базой данных сейчас невозможна.' +chr(13)+
                '          Приносим свои извинения за временные трудности.'+chr(13)+
                '           Попробуйте возобновить работу через 15-20 минут.');
    Ib_Stud.Connected := false;
    Application.Terminate;
    exit;
  end;
  //Обработка кода добавлена 13.01.2017 не проверяем наличие пользователей если запуск программы реализуется с факультетов
  if Id_Depart<>2 then
  begin
    dmSprav.qUser.Close;
    dmSprav.qUser.ParamByName('id_depart').asInteger := Id_Depart;
    dmSprav.qUser.Open;
    If dmSprav.qUser.RecordCount=0 then
    begin
      ShowMessage('Для данного подразделения нет списка пользователей!');
      Ib_Stud.Connected := false;
      Application.Terminate;
      exit;
    end;
  end;  }
end;

procedure TdmSprav.ibeCheckLockedEventAlert(Sender: TObject;
  EventName: String; EventCount: Integer; var CancelAlerts: Boolean);
begin
  CancelAlerts:=true;
  if EventName = 'LOCKED'
  then
    LockDB;  //Процедура закрытия базы
end;

procedure TdmSprav.quOrderNewRecord(DataSet: TDataSet);
begin
  {dmSprav.quOrderIS_OSO.AsInteger:=0;
  dmSprav.quOrderIS_BUDGET.AsInteger:=1;
  dmSprav.quOrderID_STUDY_FORM.AsInteger:=1;
  dmSprav.quOrderID_USER.AsInteger:=IdUser; }
end;

procedure TdmSprav.quOrderBeforePost(DataSet: TDataSet);
begin
{if quOrderCNT_STUD_GRANT.IsNull then  quOrderCNT_STUD_GRANT.AsInteger:=0;
if quOrderCNT_STUD_TOP_GRANT.IsNull then  quOrderCNT_STUD_TOP_GRANT.AsInteger:=0;
if quOrderCNT_STUD_TOP_EDUC.IsNull then  quOrderCNT_STUD_TOP_EDUC.AsInteger:=0;
if quOrderCNT_STUD_1_25.IsNull then  quOrderCNT_STUD_1_25.AsInteger:=0;
if quOrderCNT_STUD_1_50.IsNull then  quOrderCNT_STUD_1_50.AsInteger:=0;
if quOrderCNT_STUD_1_75.IsNull then  quOrderCNT_STUD_1_75.AsInteger:=0;
if quOrderCNT_BAK.IsNull then  quOrderCNT_BAK.AsInteger:=0;
if quOrderCNT_BAK_1_25.IsNull then  quOrderCNT_BAK_1_25.AsInteger:=0;
if quOrderCNT_BAK_1_50.IsNull then  quOrderCNT_BAK_1_50.AsInteger:=0;
if quOrderCNT_BAK_1_75.IsNull then  quOrderCNT_BAK_1_75.AsInteger:=0;
if quOrderCNT_MAG.IsNull then  quOrderCNT_MAG.AsInteger:=0;
if quOrderCNT_MAG_1_25.IsNull then  quOrderCNT_MAG_1_25.AsInteger:=0;
if quOrderCNT_MAG_1_50.IsNull then  quOrderCNT_MAG_1_50.AsInteger:=0;
if quOrderCNT_MAG_1_75.IsNull then  quOrderCNT_MAG_1_75.AsInteger:=0;
if quOrderCNT_SPEC.IsNull then  quOrderCNT_SPEC.AsInteger:=0;
if quOrderCNT_SPEC_1_25.IsNull then  quOrderCNT_SPEC_1_25.AsInteger:=0;
if quOrderCNT_SPEC_1_50.IsNull then  quOrderCNT_SPEC_1_50.AsInteger:=0;
if quOrderCNT_SPEC_1_75.IsNull then  quOrderCNT_SPEC_1_75.AsInteger:=0;  }
end;

end.
