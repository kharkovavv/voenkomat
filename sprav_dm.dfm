object dmSprav: TdmSprav
  OldCreateOrder = True
  OnCreate = dmSpravCreate
  Left = 576
  Top = 76
  Height = 701
  Width = 633
  object qUser: TIBQuery
    Database = Ib_stud
    Transaction = trSprav
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select '
      '      s.id, '
      '      s.Login, '
      '      s.pword,'
      '      s.fio'
      'from users s')
    Left = 135
    Top = 292
    object qUserID: TIntegerField
      FieldName = 'ID'
      Origin = 'USERS.ID'
      Required = True
    end
    object qUserLOGIN: TIBStringField
      FieldName = 'LOGIN'
      Origin = 'USERS.LOGIN'
      Size = 10
    end
    object qUserPWORD: TIBStringField
      FieldName = 'PWORD'
      Origin = 'USERS.PWORD'
      Size = 10
    end
    object qUserFIO: TIBStringField
      FieldName = 'FIO'
      Origin = 'USERS.FIO'
      Size = 120
    end
  end
  object quTypeEduc: TIBDataSet
    Database = Ib_stud
    Transaction = trSprav
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from spr_education'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into spr_education'
      '  (ID, NAME)'
      'values'
      '  (:ID, :NAME)')
    SelectSQL.Strings = (
      'select id, name'
      'from spr_education'
      'order by name')
    ModifySQL.Strings = (
      'update spr_education'
      'set'
      '  NAME = :NAME'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_SPR_EDUCATION_ID'
    Left = 135
    Top = 16
    object quTypeEducID: TIntegerField
      FieldName = 'ID'
      Origin = 'EMP_TYPE_INSTITUTION.ID'
      Required = True
    end
    object quTypeEducNAME: TIBStringField
      DisplayWidth = 50
      FieldName = 'NAME'
      Origin = 'EMP_TYPE_INSTITUTION.NAME'
      Size = 120
    end
  end
  object dsTypeEduc: TDataSource
    DataSet = quTypeEduc
    Left = 263
    Top = 17
  end
  object quResidenc: TIBQuery
    Database = Ib_stud
    Transaction = trSprav
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select s.id,s.name'
      'from SC_RESIDENC s'
      'where s.id<>0')
    Left = 134
    Top = 72
    object quResidencNAME: TIBStringField
      FieldName = 'NAME'
      Origin = 'SC_RESIDENC.NAME'
      Required = True
      Size = 40
    end
    object quResidencID: TSmallintField
      FieldName = 'ID'
      Origin = 'SC_RESIDENC.ID'
      Required = True
    end
  end
  object dsResidenc: TDataSource
    DataSet = quResidenc
    Left = 264
    Top = 72
  end
  object dsVoenSpec: TDataSource
    DataSet = quVoenSpec
    Left = 265
    Top = 129
  end
  object dsEmployers: TDataSource
    DataSet = quEmployers
    Left = 265
    Top = 183
  end
  object quEmployers: TIBDataSet
    Database = Ib_stud
    Transaction = trSprav
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from conscripts'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into conscripts'
      
        '  (ID, fio, num_passport, date_passport, who_passport, NUM_PRIZY' +
        'V_PASSPORT, DATE_PRIZYV_PASSPORT,PLACE_BIRTH, '
      
        'ADRESS_REG,  ADRESS_FACT, place_work, id_educ,is_prizyv,ZHIL_ORG' +
        'AN,MVD_ORGAN, DATE_VOEN_SPEC, PLACE_VOEN_SPEC,'
      
        'IS_SUD,SUD_PRIM,DATE_SUD_BEGIN,DATE_SUD_END, ID_VOEN_SPEC, is_ma' +
        'rried, id_flanguage, sport,'
      'DECISION_VOINSK_UCHET,'
      'DATE_DECISION_VOINSK_UCHET,'
      'DATE_DECISION_PRIZYV_KOM,'
      'ID_DECISION_PRIZYV_KOM,'
      'IS_VOEN_UCHET,'
      'NATION,'
      'GRAZHD_SPEC,'
      'ID_VOEN_ZVANIE,'
      'KAT_ZAPAS,'
      'GROUP_UCHET,'
      'SOSTAV,'
      'NUM_COMMAND_AND_LITER,'
      'VUS,'
      'DOLZNOST,'
      'VOEN_ZVAN_KOD,'
      'NUM_MARSHRUT,'
      'YAVKA,'
      'PUNKT_YAVKI,'
      'DATE_MOB_PREDPIS,'
      'NUM_DOPUSK,'
      'ALTER_VOIN_CHAST,'
      'ALTER_KOD_VUS,'
      'ALTER_TYPE_VVT,'
      'ALTER_DATE_BEGIN,'
      'ALTER_DATE_END,'
      'ALTER_DATE_UVOLEN,'
      'ZAKL_KOMAND_VOEN_CHAST,'
      'ZAKL_VOEN_KOMISSAR,'
      'DATE_UBYL_K_MESTY_SL,'
      'DATE_POSTYPIL_NA_SL,'
      'DATE_PRIZVAN_NAPRAVLEN_MOBILIZ,'
      'ROST,'
      'SIZE_HAD,'
      'SIZE_PROTIVOGAZ,'
      'SIZE_MUNDIR,'
      'SIZE_FOOT,'
      'TAKE_PART_BOY_ACTION,'
      'PRISYAGA,'
      'GOS_NAGRADA,'
      'TRAVMA,'
      'MOB_RESERV_DATE_BEGIN,'
      'MOB_RESERV_DATE_END,'
      'MOB_RESERV_OSNOVANIE,'
      'DOP_SVED,'
      'GOS_DAKT_REG,'
      'IND_DOZ_OBLUCH,'
      'DATE_VYDAN_VOEN_BILET,'
      'PRIBYL,'
      'YBYL,'
      'NACHALNIK,'
      'PHONE,'
      'DATE_DECISION_VOIN_UCHET_SNYAT,'
      'KAT_GODNOSTI,'
      'ID_ANSWER_SOSTAV,'
      'ID_ANSWER_RAZRYAD,'
      'IS_UCHET,'
      'IS_RA,'
      'IS_VMF,'
      'IS_FIRST_KAT_ZAPAS,'
      'IS_SEX)'
      'values'
      
        '  (:ID, :fio, :num_passport, :date_passport, :who_passport, :NUM' +
        '_PRIZYV_PASSPORT, :DATE_PRIZYV_PASSPORT, :PLACE_BIRTH, '
      
        ':ADRESS_REG, :ADRESS_FACT, :place_work, :id_educ,:is_prizyv,:ZHI' +
        'L_ORGAN,:MVD_ORGAN,:DATE_VOEN_SPEC,:PLACE_VOEN_SPEC,'
      
        ':IS_SUD,:SUD_PRIM,:DATE_SUD_BEGIN,:DATE_SUD_END, :ID_VOEN_SPEC, ' +
        ':is_married,:id_flanguage, :sport,'
      ':DECISION_VOINSK_UCHET,'
      ':DATE_DECISION_VOINSK_UCHET,'
      ':DATE_DECISION_PRIZYV_KOM,'
      ':ID_DECISION_PRIZYV_KOM,'
      ':IS_VOEN_UCHET,'
      ':NATION,'
      ':GRAZHD_SPEC,'
      ':ID_VOEN_ZVANIE,'
      ':KAT_ZAPAS,'
      ':GROUP_UCHET,'
      ':SOSTAV,'
      ':NUM_COMMAND_AND_LITER,'
      ':VUS,'
      ':DOLZNOST,'
      ':VOEN_ZVAN_KOD,'
      ':NUM_MARSHRUT,'
      ':YAVKA,'
      ':PUNKT_YAVKI,'
      ':DATE_MOB_PREDPIS,'
      ':NUM_DOPUSK,'
      ':ALTER_VOIN_CHAST,'
      ':ALTER_KOD_VUS,'
      ':ALTER_TYPE_VVT,'
      ':ALTER_DATE_BEGIN,'
      ':ALTER_DATE_END,'
      ':ALTER_DATE_UVOLEN,'
      ':ZAKL_KOMAND_VOEN_CHAST,'
      ':ZAKL_VOEN_KOMISSAR,'
      ':DATE_UBYL_K_MESTY_SL,'
      ':DATE_POSTYPIL_NA_SL,'
      ':DATE_PRIZVAN_NAPRAVLEN_MOBILIZ,'
      ':ROST,'
      ':SIZE_HAD,'
      ':SIZE_PROTIVOGAZ,'
      ':SIZE_MUNDIR,'
      ':SIZE_FOOT,'
      ':TAKE_PART_BOY_ACTION,'
      ':PRISYAGA,'
      ':GOS_NAGRADA,'
      ':TRAVMA,'
      ':MOB_RESERV_DATE_BEGIN,'
      ':MOB_RESERV_DATE_END,'
      ':MOB_RESERV_OSNOVANIE,'
      ':DOP_SVED,'
      ':GOS_DAKT_REG,'
      ':IND_DOZ_OBLUCH,'
      ':DATE_VYDAN_VOEN_BILET,'
      ':PRIBYL,'
      ':YBYL,'
      ':NACHALNIK,'
      ':PHONE,'
      ':DATE_DECISION_VOIN_UCHET_SNYAT,'
      ':KAT_GODNOSTI,'
      ':ID_ANSWER_SOSTAV,'
      ':ID_ANSWER_RAZRYAD,'
      ':IS_UCHET,'
      ':IS_RA,'
      ':IS_VMF,'
      ':IS_FIRST_KAT_ZAPAS,'
      ':IS_SEX)')
    SelectSQL.Strings = (
      
        'select distinct c.id, c.fio, c.num_passport, c.date_passport, c.' +
        'who_passport, c.NUM_PRIZYV_PASSPORT, c.DATE_PRIZYV_PASSPORT, c. ' +
        'PLACE_BIRTH, c.ADRESS_REG, c.ADRESS_FACT, c.place_work, c.id_edu' +
        'c, se.name as name_educ, c.is_prizyv, c.ZHIL_ORGAN, c.MVD_ORGAN,' +
        ' c.DATE_VOEN_SPEC, c.PLACE_VOEN_SPEC, c.IS_SUD, c.SUD_PRIM, c.DA' +
        'TE_SUD_BEGIN, c.DATE_SUD_END, c.id_voen_spec, vs.name as name_vo' +
        'enspec, c.is_married, c.id_flanguage, f.name as flanguage, c.spo' +
        'rt, c.DECISION_VOINSK_UCHET, c.DATE_DECISION_VOINSK_UCHET, c. DA' +
        'TE_DECISION_PRIZYV_KOM, c. ID_DECISION_PRIZYV_KOM, c.IS_VOEN_UCH' +
        'ET, d.name as DECISION_PRIZYV_KOM_name,'
      'NATION,'
      'GRAZHD_SPEC,'
      'ID_VOEN_ZVANIE,'
      'KAT_ZAPAS,'
      'GROUP_UCHET,'
      'SOSTAV,'
      'NUM_COMMAND_AND_LITER,'
      'VUS,'
      'DOLZNOST,'
      'VOEN_ZVAN_KOD,'
      'NUM_MARSHRUT,'
      'YAVKA,'
      'PUNKT_YAVKI,'
      'DATE_MOB_PREDPIS,'
      'NUM_DOPUSK,'
      'ALTER_VOIN_CHAST,'
      'ALTER_KOD_VUS,'
      'ALTER_TYPE_VVT,'
      'ALTER_DATE_BEGIN,'
      'ALTER_DATE_END,'
      'ALTER_DATE_UVOLEN,'
      'ZAKL_KOMAND_VOEN_CHAST,'
      'ZAKL_VOEN_KOMISSAR,'
      'DATE_UBYL_K_MESTY_SL,'
      'DATE_POSTYPIL_NA_SL,'
      'DATE_PRIZVAN_NAPRAVLEN_MOBILIZ,'
      'ROST,'
      'SIZE_HAD,'
      'SIZE_PROTIVOGAZ,'
      'SIZE_MUNDIR,'
      'SIZE_FOOT,'
      'TAKE_PART_BOY_ACTION,'
      'PRISYAGA,'
      'GOS_NAGRADA,'
      'TRAVMA,'
      'MOB_RESERV_DATE_BEGIN,'
      'MOB_RESERV_DATE_END,'
      'MOB_RESERV_OSNOVANIE,'
      'DOP_SVED,'
      'GOS_DAKT_REG,'
      'IND_DOZ_OBLUCH,'
      'DATE_VYDAN_VOEN_BILET,'
      'PRIBYL,'
      'YBYL,'
      'NACHALNIK,'
      'PHONE,'
      'DATE_DECISION_VOIN_UCHET_SNYAT,'
      'KAT_GODNOSTI,'
      'ID_ANSWER_RAZRYAD,'
      'ID_ANSWER_SOSTAV,'
      'IS_UCHET,'
      'IS_RA,'
      'IS_VMF,'
      'IS_FIRST_KAT_ZAPAS,'
      'IS_SEX'
      'from conscripts c'
      'left join spr_education se on se.id=c.id_educ'
      'left join voen_spec vs on vs.id=c.id_voen_spec'
      'left join flanguage f on f.id=c.id_flanguage'
      'left join DECISION_PRIZYV_KOM d on d.id=c.id_DECISION_PRIZYV_KOM'
      'left join SPR_ANWER_RAZRYAD sr on sr.id=c.ID_ANSWER_RAZRYAD'
      'left join SPR_ANSWER_SOSTAV ss on ss.id=c.ID_ANSWER_SOSTAV'
      'where c.id<>0'
      'order by c.fio ')
    ModifySQL.Strings = (
      'update conscripts'
      'set'
      ' FIO= :FIO,'
      ' num_passport=:num_passport,'
      ' date_passport=:date_passport,'
      ' who_passport=:who_passport,'
      ' NUM_PRIZYV_PASSPORT=:NUM_PRIZYV_PASSPORT,'
      ' DATE_PRIZYV_PASSPORT=:DATE_PRIZYV_PASSPORT,'
      ' PLACE_BIRTH=:PLACE_BIRTH,'
      ' ADRESS_REG=:ADRESS_REG,'
      ' ADRESS_FACT=:ADRESS_FACT, '
      ' place_work=:place_work, '
      ' id_educ=:id_educ,'
      ' is_prizyv=:is_prizyv,'
      ' ZHIL_ORGAN=:ZHIL_ORGAN,'
      ' MVD_ORGAN=:MVD_ORGAN,'
      ' DATE_VOEN_SPEC=:DATE_VOEN_SPEC,'
      ' PLACE_VOEN_SPEC=:PLACE_VOEN_SPEC,'
      ' IS_SUD=:IS_SUD,'
      ' SUD_PRIM=:SUD_PRIM,'
      ' DATE_SUD_BEGIN=:DATE_SUD_BEGIN,'
      ' DATE_SUD_END=:DATE_SUD_END,'
      ' is_married=:is_married,'
      ' id_voen_spec=:id_voen_spec,'
      'id_flanguage=:id_flanguage,'
      'sport=:sport,'
      'DECISION_VOINSK_UCHET=:DECISION_VOINSK_UCHET,'
      'DATE_DECISION_VOINSK_UCHET=:DATE_DECISION_VOINSK_UCHET,'
      'DATE_DECISION_PRIZYV_KOM=:DATE_DECISION_PRIZYV_KOM,'
      'ID_DECISION_PRIZYV_KOM=:ID_DECISION_PRIZYV_KOM,'
      'IS_VOEN_UCHET=:IS_VOEN_UCHET,'
      'NATION=:NATION,'
      'GRAZHD_SPEC=:GRAZHD_SPEC,'
      'ID_VOEN_ZVANIE=:ID_VOEN_ZVANIE,'
      'KAT_ZAPAS=:KAT_ZAPAS,'
      'GROUP_UCHET=:GROUP_UCHET,'
      'SOSTAV=:SOSTAV,'
      'NUM_COMMAND_AND_LITER=:NUM_COMMAND_AND_LITER,'
      'VUS=:VUS,'
      'DOLZNOST=:DOLZNOST,'
      'VOEN_ZVAN_KOD=:VOEN_ZVAN_KOD,'
      'NUM_MARSHRUT=:NUM_MARSHRUT,'
      'YAVKA=:YAVKA,'
      'PUNKT_YAVKI=:PUNKT_YAVKI,'
      'DATE_MOB_PREDPIS=:DATE_MOB_PREDPIS,'
      'NUM_DOPUSK=:NUM_DOPUSK,'
      'ALTER_VOIN_CHAST=:ALTER_VOIN_CHAST,'
      'ALTER_KOD_VUS=:ALTER_KOD_VUS,'
      'ALTER_TYPE_VVT=:ALTER_TYPE_VVT,'
      'ALTER_DATE_BEGIN=:ALTER_DATE_BEGIN,'
      'ALTER_DATE_END=:ALTER_DATE_END,'
      'ALTER_DATE_UVOLEN=:ALTER_DATE_UVOLEN,'
      'ZAKL_KOMAND_VOEN_CHAST=:ZAKL_KOMAND_VOEN_CHAST,'
      'ZAKL_VOEN_KOMISSAR=:ZAKL_VOEN_KOMISSAR,'
      'DATE_UBYL_K_MESTY_SL=:DATE_UBYL_K_MESTY_SL,'
      'DATE_POSTYPIL_NA_SL=:DATE_POSTYPIL_NA_SL,'
      'DATE_PRIZVAN_NAPRAVLEN_MOBILIZ=:DATE_PRIZVAN_NAPRAVLEN_MOBILIZ,'
      'ROST=:ROST,'
      'SIZE_HAD=:SIZE_HAD,'
      'SIZE_PROTIVOGAZ=:SIZE_PROTIVOGAZ,'
      'SIZE_MUNDIR=:SIZE_MUNDIR,'
      'SIZE_FOOT=:SIZE_FOOT,'
      'TAKE_PART_BOY_ACTION=:TAKE_PART_BOY_ACTION,'
      'PRISYAGA=:PRISYAGA,'
      'GOS_NAGRADA=:GOS_NAGRADA,'
      'TRAVMA=:TRAVMA,'
      'MOB_RESERV_DATE_BEGIN=:MOB_RESERV_DATE_BEGIN,'
      'MOB_RESERV_DATE_END=:MOB_RESERV_DATE_END,'
      'MOB_RESERV_OSNOVANIE=:MOB_RESERV_OSNOVANIE,'
      'DOP_SVED=:DOP_SVED,'
      'GOS_DAKT_REG=:GOS_DAKT_REG,'
      'IND_DOZ_OBLUCH=:IND_DOZ_OBLUCH,'
      'DATE_VYDAN_VOEN_BILET=:DATE_VYDAN_VOEN_BILET,'
      'PRIBYL=:PRIBYL,'
      'YBYL=:YBYL,'
      'NACHALNIK=:NACHALNIK,'
      'PHONE=:PHONE,'
      'DATE_DECISION_VOIN_UCHET_SNYAT=:DATE_DECISION_VOIN_UCHET_SNYAT,'
      'KAT_GODNOSTI=:KAT_GODNOSTI,'
      'ID_ANSWER_RAZRYAD=:ID_ANSWER_RAZRYAD,'
      'ID_ANSWER_SOSTAV=:ID_ANSWER_SOSTAV,'
      'IS_UCHET=:IS_UCHET,'
      'IS_RA=:IS_RA,'
      'IS_VMF=:IS_VMF,'
      'IS_FIRST_KAT_ZAPAS=:IS_FIRST_KAT_ZAPAS,'
      'IS_SEX=:IS_SEX'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_CONSCRIPTS_ID'
    Left = 136
    Top = 184
    object quEmployersID: TIntegerField
      FieldName = 'ID'
      Origin = 'CONSCRIPTS.ID'
      Required = True
    end
    object quEmployersFIO: TIBStringField
      FieldName = 'FIO'
      Origin = 'CONSCRIPTS.FIO'
      Size = 120
    end
    object quEmployersNUM_PASSPORT: TIBStringField
      FieldName = 'NUM_PASSPORT'
      Origin = 'CONSCRIPTS.NUM_PASSPORT'
      Size = 14
    end
    object quEmployersDATE_PASSPORT: TDateField
      FieldName = 'DATE_PASSPORT'
      Origin = 'CONSCRIPTS.DATE_PASSPORT'
    end
    object quEmployersWHO_PASSPORT: TIBStringField
      FieldName = 'WHO_PASSPORT'
      Origin = 'CONSCRIPTS.WHO_PASSPORT'
      Size = 120
    end
    object quEmployersNUM_PRIZYV_PASSPORT: TIBStringField
      FieldName = 'NUM_PRIZYV_PASSPORT'
      Origin = 'CONSCRIPTS.NUM_PRIZYV_PASSPORT'
      Size = 15
    end
    object quEmployersDATE_PRIZYV_PASSPORT: TDateField
      FieldName = 'DATE_PRIZYV_PASSPORT'
      Origin = 'CONSCRIPTS.DATE_PRIZYV_PASSPORT'
    end
    object quEmployersPLACE_BIRTH: TIBStringField
      FieldName = 'PLACE_BIRTH'
      Origin = 'CONSCRIPTS.PLACE_BIRTH'
      Size = 120
    end
    object quEmployersADRESS_REG: TIBStringField
      FieldName = 'ADRESS_REG'
      Origin = 'CONSCRIPTS.ADRESS_REG'
      Size = 120
    end
    object quEmployersADRESS_FACT: TIBStringField
      FieldName = 'ADRESS_FACT'
      Origin = 'CONSCRIPTS.ADRESS_FACT'
      Size = 120
    end
    object quEmployersPLACE_WORK: TIBStringField
      FieldName = 'PLACE_WORK'
      Origin = 'CONSCRIPTS.PLACE_WORK'
      Size = 120
    end
    object quEmployersID_EDUC: TSmallintField
      FieldName = 'ID_EDUC'
      Origin = 'CONSCRIPTS.ID_EDUC'
    end
    object quEmployersNAME_EDUC: TIBStringField
      FieldName = 'NAME_EDUC'
      Origin = 'SPR_EDUCATION.NAME'
      Size = 120
    end
    object quEmployersIS_PRIZYV: TSmallintField
      FieldName = 'IS_PRIZYV'
      Origin = 'CONSCRIPTS.IS_PRIZYV'
      Required = True
    end
    object quEmployersZHIL_ORGAN: TIBStringField
      FieldName = 'ZHIL_ORGAN'
      Origin = 'CONSCRIPTS.ZHIL_ORGAN'
      Size = 120
    end
    object quEmployersMVD_ORGAN: TIBStringField
      FieldName = 'MVD_ORGAN'
      Origin = 'CONSCRIPTS.MVD_ORGAN'
      Size = 120
    end
    object quEmployersDATE_VOEN_SPEC: TDateField
      FieldName = 'DATE_VOEN_SPEC'
      Origin = 'CONSCRIPTS.DATE_VOEN_SPEC'
    end
    object quEmployersPLACE_VOEN_SPEC: TIBStringField
      FieldName = 'PLACE_VOEN_SPEC'
      Origin = 'CONSCRIPTS.PLACE_VOEN_SPEC'
      Size = 120
    end
    object quEmployersIS_SUD: TSmallintField
      FieldName = 'IS_SUD'
      Origin = 'CONSCRIPTS.IS_SUD'
    end
    object quEmployersSUD_PRIM: TIBStringField
      FieldName = 'SUD_PRIM'
      Origin = 'CONSCRIPTS.SUD_PRIM'
      Size = 120
    end
    object quEmployersDATE_SUD_BEGIN: TDateField
      FieldName = 'DATE_SUD_BEGIN'
      Origin = 'CONSCRIPTS.DATE_SUD_BEGIN'
    end
    object quEmployersDATE_SUD_END: TDateField
      FieldName = 'DATE_SUD_END'
      Origin = 'CONSCRIPTS.DATE_SUD_END'
    end
    object quEmployersID_VOEN_SPEC: TSmallintField
      FieldName = 'ID_VOEN_SPEC'
      Origin = 'CONSCRIPTS.ID_VOEN_SPEC'
    end
    object quEmployersNAME_VOENSPEC: TIBStringField
      FieldName = 'NAME_VOENSPEC'
      Origin = 'VOEN_SPEC.NAME'
      Size = 120
    end
    object quEmployersIS_MARRIED: TSmallintField
      FieldName = 'IS_MARRIED'
      Origin = 'CONSCRIPTS.IS_MARRIED'
    end
    object quEmployersID_FLANGUAGE: TSmallintField
      FieldName = 'ID_FLANGUAGE'
      Origin = 'CONSCRIPTS.ID_FLANGUAGE'
    end
    object quEmployersFLANGUAGE: TIBStringField
      FieldName = 'FLANGUAGE'
      Origin = 'FLANGUAGE.NAME'
      Size = 120
    end
    object quEmployersSPORT: TIBStringField
      FieldName = 'SPORT'
      Origin = 'CONSCRIPTS.SPORT'
      Size = 130
    end
    object quEmployersDECISION_VOINSK_UCHET: TIBStringField
      FieldName = 'DECISION_VOINSK_UCHET'
      Origin = 'CONSCRIPTS.DECISION_VOINSK_UCHET'
      Size = 120
    end
    object quEmployersDATE_DECISION_VOINSK_UCHET: TDateField
      FieldName = 'DATE_DECISION_VOINSK_UCHET'
      Origin = 'CONSCRIPTS.DATE_DECISION_VOINSK_UCHET'
    end
    object quEmployersDATE_DECISION_PRIZYV_KOM: TDateField
      FieldName = 'DATE_DECISION_PRIZYV_KOM'
      Origin = 'CONSCRIPTS.DATE_DECISION_PRIZYV_KOM'
    end
    object quEmployersID_DECISION_PRIZYV_KOM: TSmallintField
      FieldName = 'ID_DECISION_PRIZYV_KOM'
      Origin = 'CONSCRIPTS.ID_DECISION_PRIZYV_KOM'
    end
    object quEmployersIS_VOEN_UCHET: TSmallintField
      FieldName = 'IS_VOEN_UCHET'
      Origin = 'CONSCRIPTS.IS_VOEN_UCHET'
    end
    object quEmployersDECISION_PRIZYV_KOM_NAME: TIBStringField
      FieldName = 'DECISION_PRIZYV_KOM_NAME'
      Origin = 'DECISION_PRIZYV_KOM.NAME'
      Size = 120
    end
    object quEmployersNATION: TIBStringField
      FieldName = 'NATION'
      Origin = 'CONSCRIPTS.NATION'
      Size = 120
    end
    object quEmployersGRAZHD_SPEC: TIBStringField
      FieldName = 'GRAZHD_SPEC'
      Origin = 'CONSCRIPTS.GRAZHD_SPEC'
      Size = 200
    end
    object quEmployersID_VOEN_ZVANIE: TSmallintField
      FieldName = 'ID_VOEN_ZVANIE'
      Origin = 'CONSCRIPTS.ID_VOEN_ZVANIE'
    end
    object quEmployersKAT_ZAPAS: TIBStringField
      FieldName = 'KAT_ZAPAS'
      Origin = 'CONSCRIPTS.KAT_ZAPAS'
      Size = 120
    end
    object quEmployersGROUP_UCHET: TIBStringField
      FieldName = 'GROUP_UCHET'
      Origin = 'CONSCRIPTS.GROUP_UCHET'
      Size = 120
    end
    object quEmployersSOSTAV: TIBStringField
      FieldName = 'SOSTAV'
      Origin = 'CONSCRIPTS.SOSTAV'
      Size = 120
    end
    object quEmployersNUM_COMMAND_AND_LITER: TIBStringField
      FieldName = 'NUM_COMMAND_AND_LITER'
      Origin = 'CONSCRIPTS.NUM_COMMAND_AND_LITER'
      Size = 120
    end
    object quEmployersVUS: TIBStringField
      FieldName = 'VUS'
      Origin = 'CONSCRIPTS.VUS'
      Size = 120
    end
    object quEmployersDOLZNOST: TIBStringField
      FieldName = 'DOLZNOST'
      Origin = 'CONSCRIPTS.DOLZNOST'
      Size = 120
    end
    object quEmployersVOEN_ZVAN_KOD: TIBStringField
      FieldName = 'VOEN_ZVAN_KOD'
      Origin = 'CONSCRIPTS.VOEN_ZVAN_KOD'
      Size = 10
    end
    object quEmployersNUM_MARSHRUT: TIBStringField
      FieldName = 'NUM_MARSHRUT'
      Origin = 'CONSCRIPTS.NUM_MARSHRUT'
      Size = 120
    end
    object quEmployersYAVKA: TIBStringField
      FieldName = 'YAVKA'
      Origin = 'CONSCRIPTS.YAVKA'
      Size = 120
    end
    object quEmployersPUNKT_YAVKI: TIBStringField
      FieldName = 'PUNKT_YAVKI'
      Origin = 'CONSCRIPTS.PUNKT_YAVKI'
      Size = 120
    end
    object quEmployersDATE_MOB_PREDPIS: TDateField
      FieldName = 'DATE_MOB_PREDPIS'
      Origin = 'CONSCRIPTS.DATE_MOB_PREDPIS'
    end
    object quEmployersNUM_DOPUSK: TIBStringField
      FieldName = 'NUM_DOPUSK'
      Origin = 'CONSCRIPTS.NUM_DOPUSK'
      Size = 120
    end
    object quEmployersALTER_VOIN_CHAST: TIBStringField
      FieldName = 'ALTER_VOIN_CHAST'
      Origin = 'CONSCRIPTS.ALTER_VOIN_CHAST'
      Size = 120
    end
    object quEmployersALTER_KOD_VUS: TIBStringField
      FieldName = 'ALTER_KOD_VUS'
      Origin = 'CONSCRIPTS.ALTER_KOD_VUS'
      Size = 120
    end
    object quEmployersALTER_TYPE_VVT: TIBStringField
      FieldName = 'ALTER_TYPE_VVT'
      Origin = 'CONSCRIPTS.ALTER_TYPE_VVT'
      Size = 120
    end
    object quEmployersALTER_DATE_BEGIN: TIBStringField
      FieldName = 'ALTER_DATE_BEGIN'
      Origin = 'CONSCRIPTS.ALTER_DATE_BEGIN'
      Size = 120
    end
    object quEmployersALTER_DATE_END: TIBStringField
      FieldName = 'ALTER_DATE_END'
      Origin = 'CONSCRIPTS.ALTER_DATE_END'
      Size = 120
    end
    object quEmployersALTER_DATE_UVOLEN: TDateField
      FieldName = 'ALTER_DATE_UVOLEN'
      Origin = 'CONSCRIPTS.ALTER_DATE_UVOLEN'
    end
    object quEmployersZAKL_KOMAND_VOEN_CHAST: TIBStringField
      FieldName = 'ZAKL_KOMAND_VOEN_CHAST'
      Origin = 'CONSCRIPTS.ZAKL_KOMAND_VOEN_CHAST'
      Size = 120
    end
    object quEmployersZAKL_VOEN_KOMISSAR: TIBStringField
      FieldName = 'ZAKL_VOEN_KOMISSAR'
      Origin = 'CONSCRIPTS.ZAKL_VOEN_KOMISSAR'
      Size = 120
    end
    object quEmployersDATE_UBYL_K_MESTY_SL: TDateField
      FieldName = 'DATE_UBYL_K_MESTY_SL'
      Origin = 'CONSCRIPTS.DATE_UBYL_K_MESTY_SL'
    end
    object quEmployersDATE_POSTYPIL_NA_SL: TDateField
      FieldName = 'DATE_POSTYPIL_NA_SL'
      Origin = 'CONSCRIPTS.DATE_POSTYPIL_NA_SL'
    end
    object quEmployersDATE_PRIZVAN_NAPRAVLEN_MOBILIZ: TDateField
      FieldName = 'DATE_PRIZVAN_NAPRAVLEN_MOBILIZ'
      Origin = 'CONSCRIPTS.DATE_PRIZVAN_NAPRAVLEN_MOBILIZ'
    end
    object quEmployersROST: TSmallintField
      FieldName = 'ROST'
      Origin = 'CONSCRIPTS.ROST'
    end
    object quEmployersSIZE_HAD: TSmallintField
      FieldName = 'SIZE_HAD'
      Origin = 'CONSCRIPTS.SIZE_HAD'
    end
    object quEmployersSIZE_PROTIVOGAZ: TSmallintField
      FieldName = 'SIZE_PROTIVOGAZ'
      Origin = 'CONSCRIPTS.SIZE_PROTIVOGAZ'
    end
    object quEmployersSIZE_MUNDIR: TSmallintField
      FieldName = 'SIZE_MUNDIR'
      Origin = 'CONSCRIPTS.SIZE_MUNDIR'
    end
    object quEmployersSIZE_FOOT: TSmallintField
      FieldName = 'SIZE_FOOT'
      Origin = 'CONSCRIPTS.SIZE_FOOT'
    end
    object quEmployersTAKE_PART_BOY_ACTION: TIBStringField
      FieldName = 'TAKE_PART_BOY_ACTION'
      Origin = 'CONSCRIPTS.TAKE_PART_BOY_ACTION'
      Size = 200
    end
    object quEmployersPRISYAGA: TIBStringField
      FieldName = 'PRISYAGA'
      Origin = 'CONSCRIPTS.PRISYAGA'
      Size = 120
    end
    object quEmployersGOS_NAGRADA: TIBStringField
      FieldName = 'GOS_NAGRADA'
      Origin = 'CONSCRIPTS.GOS_NAGRADA'
      Size = 120
    end
    object quEmployersTRAVMA: TIBStringField
      FieldName = 'TRAVMA'
      Origin = 'CONSCRIPTS.TRAVMA'
      Size = 120
    end
    object quEmployersMOB_RESERV_DATE_BEGIN: TDateField
      FieldName = 'MOB_RESERV_DATE_BEGIN'
      Origin = 'CONSCRIPTS.MOB_RESERV_DATE_BEGIN'
    end
    object quEmployersMOB_RESERV_DATE_END: TDateField
      FieldName = 'MOB_RESERV_DATE_END'
      Origin = 'CONSCRIPTS.MOB_RESERV_DATE_END'
    end
    object quEmployersDOP_SVED: TIBStringField
      FieldName = 'DOP_SVED'
      Origin = 'CONSCRIPTS.MOB_RESERV_OSNOVANIE'
      Size = 120
    end
    object quEmployersGOS_DAKT_REG: TIBStringField
      FieldName = 'GOS_DAKT_REG'
      Origin = 'CONSCRIPTS.GOS_DAKT_REG'
      Size = 120
    end
    object quEmployersIND_DOZ_OBLUCH: TIBStringField
      FieldName = 'IND_DOZ_OBLUCH'
      Origin = 'CONSCRIPTS.IND_DOZ_OBLUCH'
      Size = 120
    end
    object quEmployersDATE_VYDAN_VOEN_BILET: TDateField
      FieldName = 'DATE_VYDAN_VOEN_BILET'
      Origin = 'CONSCRIPTS.DATE_VYDAN_VOEN_BILET'
    end
    object quEmployersPRIBYL: TIBStringField
      FieldName = 'PRIBYL'
      Origin = 'CONSCRIPTS.PRIBYL'
      Size = 120
    end
    object quEmployersYBYL: TIBStringField
      FieldName = 'YBYL'
      Origin = 'CONSCRIPTS.YBYL'
      Size = 120
    end
    object quEmployersNACHALNIK: TIBStringField
      FieldName = 'NACHALNIK'
      Origin = 'CONSCRIPTS.NACHALNIK'
      Size = 120
    end
    object quEmployersMOB_RESERV_OSNOVANIE: TIBStringField
      FieldName = 'MOB_RESERV_OSNOVANIE'
      Origin = 'CONSCRIPTS.MOB_RESERV_OSNOVANIE'
      Size = 120
    end
    object quEmployersPHONE: TIBStringField
      FieldName = 'PHONE'
      Origin = 'CONSCRIPTS.PHONE'
    end
    object quEmployersDATE_DECISION_VOIN_UCHET_SNYAT: TDateField
      FieldName = 'DATE_DECISION_VOIN_UCHET_SNYAT'
      Origin = 'CONSCRIPTS.DATE_DECISION_VOIN_UCHET_SNYAT'
    end
    object quEmployersKAT_GODNOSTI: TIBStringField
      FieldName = 'KAT_GODNOSTI'
      Origin = 'CONSCRIPTS.KAT_GODNOSTI'
      Size = 120
    end
    object quEmployersID_ANSWER_RAZRYAD: TSmallintField
      FieldName = 'ID_ANSWER_RAZRYAD'
      Origin = 'CONSCRIPTS.ID_ANSWER_RAZRYAD'
    end
    object quEmployersID_ANSWER_SOSTAV: TSmallintField
      FieldName = 'ID_ANSWER_SOSTAV'
      Origin = 'CONSCRIPTS.ID_ANSWER_SOSTAV'
    end
    object quEmployersIS_UCHET: TSmallintField
      FieldName = 'IS_UCHET'
      Origin = 'CONSCRIPTS.IS_UCHET'
    end
    object quEmployersIS_RA: TSmallintField
      FieldName = 'IS_RA'
      Origin = 'CONSCRIPTS.IS_RA'
    end
    object quEmployersIS_VMF: TSmallintField
      FieldName = 'IS_VMF'
      Origin = 'CONSCRIPTS.IS_VMF'
    end
    object quEmployersIS_FIRST_KAT_ZAPAS: TSmallintField
      FieldName = 'IS_FIRST_KAT_ZAPAS'
      Origin = 'CONSCRIPTS.IS_FIRST_KAT_ZAPAS'
    end
    object quEmployersIS_SEX: TSmallintField
      FieldName = 'IS_SEX'
      Origin = 'CONSCRIPTS.IS_SEX'
    end
  end
  object quDopContract: TIBDataSet
    Database = Ib_stud
    Transaction = trSprav
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from emp_dop_contracts'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into emp_dop_contracts'
      
        '(id,Number_dop_contract,  date_dop_contract,summ,number_pay,date' +
        '_pay,id_faculty_pay,id_employer,date_end_dop_contract, date_akt,' +
        'count_stud,count_weeks)'
      'values'
      
        '(:id, :Number_dop_contract, :date_dop_contract,:summ,:number_pay' +
        ',:date_pay,:id_faculty_pay,:id_employer,:date_end_dop_contract,:' +
        'date_akt,:count_stud,:count_weeks)')
    SelectSQL.Strings = (
      
        ' select d.id, d.number_dop_contract, d.date_dop_contract,d.summ,' +
        ' d.number_pay,d.date_pay, d.id_faculty_pay, f.name as name_facul' +
        'ty, d.id_employer, d.date_end_dop_contract, d.date_akt, d.count_' +
        'stud, d.count_weeks'
      ' from emp_dop_contracts d'
      '   left join employers e on e.id=d.id_employer'
      '   left join faculty f on f.id=d.id_faculty_pay'
      ' where d.id_employer=:par1'
      ' order by d.number_dop_contract')
    ModifySQL.Strings = (
      'update emp_dop_contracts'
      'set'
      'NUMBER_DOP_CONTRACT=:NUMBER_DOP_CONTRACT,'
      'DATE_DOP_CONTRACT=:DATE_DOP_CONTRACT,'
      'SUMM=:SUMM,'
      'NUMBER_PAY=:NUMBER_PAY,'
      'DATE_PAY=:DATE_PAY,'
      'ID_FACULTY_PAY=:ID_FACULTY_PAY,'
      'ID_EMPLOYER=:ID_EMPLOYER,'
      'DATE_END_DOP_CONTRACT=:DATE_END_DOP_CONTRACT,'
      'DATE_AKT=:DATE_AKT,'
      'COUNT_STUD=:count_STUD,'
      'COUNT_WEEKS=:COUNT_WEEKS'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_EMP_DOP_CONTRACTS_ID'
    Left = 135
    Top = 241
    object quDopContractID: TIntegerField
      FieldName = 'ID'
      Origin = 'EMP_DOP_CONTRACTS.ID'
      Required = True
    end
    object quDopContractNUMBER_DOP_CONTRACT: TIBStringField
      FieldName = 'NUMBER_DOP_CONTRACT'
      Origin = 'EMP_DOP_CONTRACTS.NUMBER_DOP_CONTRACT'
      Size = 100
    end
    object quDopContractDATE_DOP_CONTRACT: TDateField
      FieldName = 'DATE_DOP_CONTRACT'
      Origin = 'EMP_DOP_CONTRACTS.DATE_DOP_CONTRACT'
    end
    object quDopContractSUMM: TFloatField
      FieldName = 'SUMM'
      Origin = 'EMP_DOP_CONTRACTS.SUMM'
    end
    object quDopContractNUMBER_PAY: TIntegerField
      FieldName = 'NUMBER_PAY'
      Origin = 'EMP_DOP_CONTRACTS.NUMBER_PAY'
    end
    object quDopContractDATE_PAY: TDateField
      FieldName = 'DATE_PAY'
      Origin = 'EMP_DOP_CONTRACTS.DATE_PAY'
    end
    object quDopContractID_FACULTY_PAY: TIntegerField
      FieldName = 'ID_FACULTY_PAY'
      Origin = 'EMP_DOP_CONTRACTS.ID_FACULTY_PAY'
    end
    object quDopContractNAME_FACULTY: TIBStringField
      FieldName = 'NAME_FACULTY'
      Origin = 'FACULTY.NAME'
      Size = 82
    end
    object quDopContractID_EMPLOYER: TIntegerField
      FieldName = 'ID_EMPLOYER'
      Origin = 'EMP_DOP_CONTRACTS.ID_EMPLOYER'
    end
    object quDopContractDATE_END_DOP_CONTRACT: TDateField
      FieldName = 'DATE_END_DOP_CONTRACT'
      Origin = 'EMP_DOP_CONTRACTS.DATE_END_DOP_CONTRACT'
    end
    object quDopContractDATE_AKT: TDateField
      FieldName = 'DATE_AKT'
      Origin = 'EMP_DOP_CONTRACTS.DATE_AKT'
    end
    object quDopContractCOUNT_STUD: TIntegerField
      FieldName = 'COUNT_STUD'
      Origin = 'EMP_DOP_CONTRACTS.COUNT_STUD'
    end
    object quDopContractCOUNT_WEEKS: TIntegerField
      FieldName = 'COUNT_WEEKS'
      Origin = 'EMP_DOP_CONTRACTS.COUNT_WEEKS'
    end
  end
  object dsDopContract: TDataSource
    DataSet = quDopContract
    Left = 265
    Top = 243
  end
  object quFacult: TIBQuery
    Database = Ib_stud
    Transaction = trSprav
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select f.id,f.name,f.login,f.pword , f.DEAN_FIO,f.STATUS, f.DEAN' +
        '_DUTY, f.NAME_ROD, f.plan_reception, f.DEAN_FIO_ROD'
      'from Faculty f'
      
        'Where (f.status<4) and (f.login is not null) and (f.pword is not' +
        ' null) and (f.is_active=1) and f.date_closed is null'
      'order by f.Name')
    Left = 135
    Top = 345
    object quFacultID: TIntegerField
      FieldName = 'ID'
      Origin = 'FACULTY.ID'
      Required = True
    end
    object quFacultNAME: TIBStringField
      DisplayWidth = 60
      FieldName = 'NAME'
      Origin = 'FACULTY.NAME'
      Required = True
      Size = 82
    end
    object quFacultLOGIN: TIBStringField
      FieldName = 'LOGIN'
      Origin = 'FACULTY.LOGIN'
      Size = 32
    end
    object quFacultPWORD: TIBStringField
      FieldName = 'PWORD'
      Origin = 'FACULTY.PWORD'
      Size = 32
    end
    object quFacultDEAN_FIO: TIBStringField
      FieldName = 'DEAN_FIO'
      Origin = 'FACULTY.DEAN_FIO'
      Size = 50
    end
    object quFacultSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'FACULTY.STATUS'
    end
    object quFacultDEAN_DUTY: TIBStringField
      FieldName = 'DEAN_DUTY'
      Origin = 'FACULTY.DEAN_DUTY'
    end
    object quFacultNAME_ROD: TIBStringField
      FieldName = 'NAME_ROD'
      Origin = 'FACULTY.NAME_ROD'
      Size = 80
    end
    object quFacultPLAN_RECEPTION: TSmallintField
      FieldName = 'PLAN_RECEPTION'
      Origin = 'FACULTY.PLAN_RECEPTION'
    end
    object quFacultDEAN_FIO_ROD: TIBStringField
      FieldName = 'DEAN_FIO_ROD'
      Origin = 'FACULTY.DEAN_FIO_ROD'
    end
  end
  object dsFacult: TDataSource
    DataSet = quFacult
    Left = 267
    Top = 347
  end
  object qUser_fac: TIBQuery
    Database = Ib_stud
    Transaction = trSprav
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select d.id'
      'from s_depart d'
      'where d.id_faculty=:FID')
    Left = 266
    Top = 294
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FID'
        ParamType = ptUnknown
      end>
    object qUser_facID: TSmallintField
      FieldName = 'ID'
      Origin = 'S_DEPART.ID'
      Required = True
    end
  end
  object Ib_stud: TIBDatabase
    DatabaseName = 'D:\VOENKOM.FDB'
    Params.Strings = (
      'user_name=sysdba'
      'lc_ctype=WIN1251'
      'password=masterkey')
    LoginPrompt = False
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    AllowStreamedConnected = False
    Left = 18
    Top = 24
  end
  object trSprav: TIBTransaction
    Active = False
    DefaultDatabase = Ib_stud
    Params.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    AutoStopAction = saNone
    Left = 20
    Top = 77
  end
  object trnsMain: TIBTransaction
    Active = False
    DefaultDatabase = Ib_stud
    Params.Strings = (
      'write'
      'rec_version'
      'read_committed')
    AutoStopAction = saNone
    Left = 23
    Top = 235
  end
  object quPrint_Dop_Contract: TIBQuery
    Database = Ib_stud
    Transaction = trSprav
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select d.number_dop_contract, d.date_dop_contract,e.num_agreemen' +
        't, e.date_agreement, e.name, e.FIO_DIRECTOR_ROD,e.fio_director, ' +
        'e.post_director_rod,e.post_director, e.document, e.okonh, e.kpp,' +
        'e.inn,e.bik,e.okpo,e.rs,e.ls,e.bank, e.oktmo,e.kbk, e.ks,e.bank_' +
        'predl, e.is_budget, e.adress,e.phone, e.email,d.date_end_dop_con' +
        'tract,d.date_akt, d.count_stud,d.count_weeks'
      'from emp_dop_contracts d'
      'left join employers e on (e.id=d.id_employer)'
      'where d.id=:id_dop_contract')
    Left = 135
    Top = 560
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_dop_contract'
        ParamType = ptUnknown
      end>
    object quPrint_Dop_ContractNUMBER_DOP_CONTRACT: TIBStringField
      FieldName = 'NUMBER_DOP_CONTRACT'
      Origin = 'EMP_DOP_CONTRACTS.NUMBER_DOP_CONTRACT'
      Size = 100
    end
    object quPrint_Dop_ContractDATE_DOP_CONTRACT: TDateField
      FieldName = 'DATE_DOP_CONTRACT'
      Origin = 'EMP_DOP_CONTRACTS.DATE_DOP_CONTRACT'
    end
    object quPrint_Dop_ContractNUM_AGREEMENT: TIBStringField
      FieldName = 'NUM_AGREEMENT'
      Origin = 'EMPLOYERS.NUM_AGREEMENT'
      Size = 100
    end
    object quPrint_Dop_ContractDATE_AGREEMENT: TDateField
      FieldName = 'DATE_AGREEMENT'
      Origin = 'EMPLOYERS.DATE_AGREEMENT'
    end
    object quPrint_Dop_ContractNAME: TIBStringField
      FieldName = 'NAME'
      Origin = 'EMPLOYERS.NAME'
      Size = 400
    end
    object quPrint_Dop_ContractFIO_DIRECTOR_ROD: TIBStringField
      FieldName = 'FIO_DIRECTOR_ROD'
      Origin = 'EMPLOYERS.FIO_DIRECTOR_ROD'
      Size = 225
    end
    object quPrint_Dop_ContractDOCUMENT: TIBStringField
      FieldName = 'DOCUMENT'
      Origin = 'EMPLOYERS.DOCUMENT'
      Size = 225
    end
    object quPrint_Dop_ContractPOST_DIRECTOR_ROD: TIBStringField
      FieldName = 'POST_DIRECTOR_ROD'
      Origin = 'EMPLOYERS.POST_DIRECTOR_ROD'
      Size = 225
    end
    object quPrint_Dop_ContractOKONH: TIBStringField
      FieldName = 'OKONH'
      Origin = 'EMPLOYERS.OKONH'
    end
    object quPrint_Dop_ContractKPP: TIBStringField
      FieldName = 'KPP'
      Origin = 'EMPLOYERS.KPP'
    end
    object quPrint_Dop_ContractINN: TIBStringField
      FieldName = 'INN'
      Origin = 'EMPLOYERS.INN'
    end
    object quPrint_Dop_ContractBIK: TIBStringField
      FieldName = 'BIK'
      Origin = 'EMPLOYERS.BIK'
    end
    object quPrint_Dop_ContractOKPO: TIBStringField
      FieldName = 'OKPO'
      Origin = 'EMPLOYERS.OKPO'
    end
    object quPrint_Dop_ContractRS: TIBStringField
      FieldName = 'RS'
      Origin = 'EMPLOYERS.RS'
      Size = 100
    end
    object quPrint_Dop_ContractLS: TIBStringField
      FieldName = 'LS'
      Origin = 'EMPLOYERS.LS'
      Size = 100
    end
    object quPrint_Dop_ContractBANK: TIBStringField
      FieldName = 'BANK'
      Origin = 'EMPLOYERS.BANK'
      Size = 225
    end
    object quPrint_Dop_ContractOKTMO: TIBStringField
      FieldName = 'OKTMO'
      Origin = 'EMPLOYERS.OKTMO'
      Size = 100
    end
    object quPrint_Dop_ContractKBK: TIBStringField
      FieldName = 'KBK'
      Origin = 'EMPLOYERS.KBK'
    end
    object quPrint_Dop_ContractKS: TIBStringField
      FieldName = 'KS'
      Origin = 'EMPLOYERS.KS'
      Size = 100
    end
    object quPrint_Dop_ContractFIO_DIRECTOR: TIBStringField
      FieldName = 'FIO_DIRECTOR'
      Origin = 'EMPLOYERS.FIO_DIRECTOR'
      Size = 225
    end
    object quPrint_Dop_ContractBANK_PREDL: TIBStringField
      FieldName = 'BANK_PREDL'
      Origin = 'EMPLOYERS.BANK_PREDL'
      Size = 225
    end
    object quPrint_Dop_ContractIS_BUDGET: TSmallintField
      FieldName = 'IS_BUDGET'
      Origin = 'EMPLOYERS.IS_BUDGET'
    end
    object quPrint_Dop_ContractPOST_DIRECTOR: TIBStringField
      FieldName = 'POST_DIRECTOR'
      Origin = 'EMPLOYERS.POST_DIRECTOR'
      Size = 225
    end
    object quPrint_Dop_ContractADRESS: TIBStringField
      FieldName = 'ADRESS'
      Origin = 'EMPLOYERS.ADRESS'
      Size = 400
    end
    object quPrint_Dop_ContractPHONE: TIBStringField
      FieldName = 'PHONE'
      Origin = 'EMPLOYERS.PHONE'
      Size = 300
    end
    object quPrint_Dop_ContractEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'EMPLOYERS.EMAIL'
      Size = 120
    end
    object quPrint_Dop_ContractDATE_END_DOP_CONTRACT: TDateField
      FieldName = 'DATE_END_DOP_CONTRACT'
      Origin = 'EMP_DOP_CONTRACTS.DATE_END_DOP_CONTRACT'
    end
    object quPrint_Dop_ContractCOUNT_STUD: TIntegerField
      FieldName = 'COUNT_STUD'
    end
    object quPrint_Dop_ContractCOUNT_WEEKS: TIntegerField
      FieldName = 'COUNT_WEEKS'
    end
  end
  object quPrint_order_2: TIBQuery
    Database = Ib_stud
    Transaction = trSprav
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select distinct s.id, s.fio,s.kurs, el.educ_level_code, p.spec_n' +
        'um,'
      
        'p.name as spec_name, p.spec_num_2017, p.is_standart, pr.name as ' +
        'prof_name, d.is_top_soc_grant, d.is_charge_privilege,'
      
        'DATEADD(year,1,s.DATE_GRANT_PRIVILEG) as DATE_GRANT_PRIVILEG, sp' +
        '.name_grant as priv, d.is_feel, ds.num_spr,'
      
        'd.is_stud_council, d.is_head, s.id_educ_level, s.DATE_ACADEM, d.' +
        'ID_OSO_GRANT, d.IS_MN, s.is_mo, s.id_citizen, s.id_target_region' +
        ', s.id_sex'
      'from stud s'
      'inner join d_stud d on (s.id=d.id_stud)'
      'left join group_type g on (g.id=s.id_group_type)'
      'left join d_ucheb_plan u on (u.id=g.id_d_ucheb_plan)'
      'left join ucheb_plan up on (u.id_ucheb_plan=up.id)'
      'left join specialty p on (p.id=up.id_specialty)'
      'left join profile   pr on (pr.id=up.id_profile)'
      'left join s_educ_level el on (el.id=s.id_educ_level)'
      'left join s_privileg sp on (sp.id=s.id_privileg and sp.id>0)'
      'left join s_citizen sc on (s.id_citizen=sc.id)'
      'left join l_date_spr_soc ds on (ds.id_stud=s.id)')
    Left = 460
    Top = 592
    object quPrint_order_2ID: TIntegerField
      FieldName = 'ID'
      Origin = 'STUD.ID'
      Required = True
    end
    object quPrint_order_2FIO: TIBStringField
      FieldName = 'FIO'
      Origin = 'STUD.FIO'
      Required = True
      Size = 60
    end
    object quPrint_order_2KURS: TSmallintField
      FieldName = 'KURS'
      Origin = 'STUD.KURS'
      Required = True
    end
    object quPrint_order_2EDUC_LEVEL_CODE: TIBStringField
      FieldName = 'EDUC_LEVEL_CODE'
      Origin = 'S_EDUC_LEVEL.EDUC_LEVEL_CODE'
      FixedChar = True
      Size = 3
    end
    object quPrint_order_2SPEC_NUM: TIBStringField
      FieldName = 'SPEC_NUM'
      Origin = 'SPECIALTY.SPEC_NUM'
      Size = 6
    end
    object quPrint_order_2SPEC_NAME: TIBStringField
      FieldName = 'SPEC_NAME'
      Origin = 'SPECIALTY.NAME'
      Size = 120
    end
    object quPrint_order_2PROF_NAME: TIBStringField
      FieldName = 'PROF_NAME'
      Origin = 'PROFILE.NAME'
      Size = 150
    end
    object quPrint_order_2IS_TOP_SOC_GRANT: TSmallintField
      FieldName = 'IS_TOP_SOC_GRANT'
      Origin = 'D_STUD.IS_TOP_SOC_GRANT'
      Required = True
    end
    object quPrint_order_2IS_CHARGE_PRIVILEGE: TSmallintField
      FieldName = 'IS_CHARGE_PRIVILEGE'
      Origin = 'D_STUD.IS_CHARGE_PRIVILEGE'
      Required = True
    end
    object quPrint_order_2DATE_GRANT_PRIVILEG: TDateField
      FieldName = 'DATE_GRANT_PRIVILEG'
    end
    object quPrint_order_2PRIV: TIBStringField
      FieldName = 'PRIV'
      Origin = 'S_PRIVILEG.NAME_GRANT'
      Size = 50
    end
    object quPrint_order_2IS_FEEL: TSmallintField
      FieldName = 'IS_FEEL'
      Origin = 'D_STUD.IS_FEEL'
      Required = True
    end
    object quPrint_order_2IS_STUD_COUNCIL: TSmallintField
      FieldName = 'IS_STUD_COUNCIL'
      Origin = 'D_STUD.IS_STUD_COUNCIL'
    end
    object quPrint_order_2IS_HEAD: TSmallintField
      FieldName = 'IS_HEAD'
      Origin = 'D_STUD.IS_HEAD'
      Required = True
    end
    object quPrint_order_2ID_EDUC_LEVEL: TSmallintField
      FieldName = 'ID_EDUC_LEVEL'
      Origin = 'STUD.ID_EDUC_LEVEL'
      Required = True
    end
    object quPrint_order_2DATE_ACADEM: TDateField
      FieldName = 'DATE_ACADEM'
      Origin = 'STUD.DATE_ACADEM'
    end
    object quPrint_order_2ID_OSO_GRANT: TIntegerField
      FieldName = 'ID_OSO_GRANT'
      Origin = 'D_STUD.ID_OSO_GRANT'
    end
    object quPrint_order_2IS_MN: TSmallintField
      FieldName = 'IS_MN'
      Origin = 'D_STUD.IS_MN'
      Required = True
    end
    object quPrint_order_2ID_SEX: TSmallintField
      FieldName = 'ID_SEX'
      Origin = 'STUD.ID_SEX'
    end
    object quPrint_order_2SPEC_NUM_2017: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'SPEC_NUM_2017'
      Origin = 'SPECIALTY.SPEC_NUM_2017'
      ReadOnly = True
      Size = 10
    end
    object quPrint_order_2IS_STANDART: TSmallintField
      FieldName = 'IS_STANDART'
      Origin = 'SPECIALTY.IS_STANDART'
    end
    object quPrint_order_2NUM_SPR: TIBStringField
      FieldName = 'NUM_SPR'
      Origin = 'L_DATE_SPR_SOC.NUM_SPR'
      Size = 15
    end
  end
  object quPrint_order_1: TIBQuery
    Database = Ib_stud
    Transaction = trSprav
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select distinct s.id, s.fio,s.kurs, el.educ_level_code, p.spec_n' +
        'um, p.name as spec_name, p.spec_num_2017, p.is_standart,'
      
        ' pr.name as prof_name, d.is_grant_25, d.is_grant_50, d.is_charge' +
        '_privilege,'
      
        '  s.date_grant_privileg, sp.name as priv, d.is_feel, d.is_stud_c' +
        'ouncil,'
      
        '   d.is_head, s.id_educ_level, cast (gt.type_grant||gt.subtype a' +
        's varchar(6)) as gt_type,'
      
        '    d.summ_grant, gt.IS_UCH,d.ID_OSO_GRANT, gt.id as id_type, sc' +
        '.name as sc_name, d.IS_MN,s.is_mo, s.id_citizen, s.id_target_reg' +
        'ion, s.id_sex, ds.num_spr'
      '     from stud s'
      '      inner join d_stud d on (s.id=d.id_stud)'
      '       inner join sd_grant_type gt on (d.id_sd_grant_type=gt.id)'
      '        inner join group_type g on (g.id=s.id_group_type)'
      '         inner join d_ucheb_plan u on (u.id=g.id_d_ucheb_plan)'
      '          inner join ucheb_plan up on (u.id_ucheb_plan=up.id)'
      '          left join specialty p on (p.id=up.id_specialty)'
      '          left join profile   pr on (pr.id=up.id_profile)'
      '          left join s_educ_level el on (el.id=s.id_educ_level)'
      
        '          left join s_privileg sp on (sp.id=s.id_privileg and sp' +
        '.id>0)'
      'left join s_citizen sc on (s.id_citizen=sc.id)'
      'left join l_date_spr_soc ds on (ds.id_stud=s.id)')
    Left = 460
    Top = 536
    object quPrint_order_1ID: TIntegerField
      FieldName = 'ID'
      Origin = 'STUD.ID'
      Required = True
    end
    object quPrint_order_1FIO: TIBStringField
      FieldName = 'FIO'
      Origin = 'STUD.FIO'
      Required = True
      Size = 60
    end
    object quPrint_order_1KURS: TSmallintField
      FieldName = 'KURS'
      Origin = 'STUD.KURS'
      Required = True
    end
    object quPrint_order_1EDUC_LEVEL_CODE: TIBStringField
      FieldName = 'EDUC_LEVEL_CODE'
      Origin = 'S_EDUC_LEVEL.EDUC_LEVEL_CODE'
      FixedChar = True
      Size = 3
    end
    object quPrint_order_1SPEC_NUM: TIBStringField
      FieldName = 'SPEC_NUM'
      Origin = 'SPECIALTY.SPEC_NUM'
      Size = 6
    end
    object quPrint_order_1SPEC_NAME: TIBStringField
      FieldName = 'SPEC_NAME'
      Origin = 'SPECIALTY.NAME'
      Size = 120
    end
    object quPrint_order_1PROF_NAME: TIBStringField
      FieldName = 'PROF_NAME'
      Origin = 'PROFILE.NAME'
      Size = 150
    end
    object quPrint_order_1IS_GRANT_25: TSmallintField
      FieldName = 'IS_GRANT_25'
      Origin = 'D_STUD.IS_GRANT_25'
      Required = True
    end
    object quPrint_order_1IS_GRANT_50: TSmallintField
      FieldName = 'IS_GRANT_50'
      Origin = 'D_STUD.IS_GRANT_50'
      Required = True
    end
    object quPrint_order_1IS_CHARGE_PRIVILEGE: TSmallintField
      FieldName = 'IS_CHARGE_PRIVILEGE'
      Origin = 'D_STUD.IS_CHARGE_PRIVILEGE'
      Required = True
    end
    object quPrint_order_1DATE_GRANT_PRIVILEG: TDateField
      FieldName = 'DATE_GRANT_PRIVILEG'
      Origin = 'STUD.DATE_GRANT_PRIVILEG'
    end
    object quPrint_order_1PRIV: TIBStringField
      FieldName = 'PRIV'
      Origin = 'S_PRIVILEG.NAME'
      Size = 50
    end
    object quPrint_order_1IS_FEEL: TSmallintField
      FieldName = 'IS_FEEL'
      Origin = 'D_STUD.IS_FEEL'
      Required = True
    end
    object quPrint_order_1IS_STUD_COUNCIL: TSmallintField
      FieldName = 'IS_STUD_COUNCIL'
      Origin = 'D_STUD.IS_STUD_COUNCIL'
    end
    object quPrint_order_1IS_HEAD: TSmallintField
      FieldName = 'IS_HEAD'
      Origin = 'D_STUD.IS_HEAD'
      Required = True
    end
    object quPrint_order_1ID_EDUC_LEVEL: TSmallintField
      FieldName = 'ID_EDUC_LEVEL'
      Origin = 'STUD.ID_EDUC_LEVEL'
      Required = True
    end
    object quPrint_order_1GT_TYPE: TIBStringField
      FieldName = 'GT_TYPE'
      Size = 6
    end
    object quPrint_order_1SUMM_GRANT: TIntegerField
      FieldName = 'SUMM_GRANT'
      Origin = 'D_STUD.SUMM_GRANT'
    end
    object quPrint_order_1IS_UCH: TSmallintField
      FieldName = 'IS_UCH'
      Origin = 'SD_GRANT_TYPE.IS_UCH'
    end
    object quPrint_order_1ID_OSO_GRANT: TIntegerField
      FieldName = 'ID_OSO_GRANT'
      Origin = 'D_STUD.ID_OSO_GRANT'
    end
    object quPrint_order_1ID_TYPE: TIntegerField
      FieldName = 'ID_TYPE'
      Origin = 'SD_GRANT_TYPE.ID'
      Required = True
    end
    object quPrint_order_1SC_NAME: TIBStringField
      FieldName = 'SC_NAME'
      Origin = 'S_CITIZEN.NAME'
    end
    object quPrint_order_1IS_MN: TSmallintField
      FieldName = 'IS_MN'
      Origin = 'D_STUD.IS_MN'
      Required = True
    end
    object quPrint_order_1IS_MO: TSmallintField
      FieldName = 'IS_MO'
      Origin = 'STUD.IS_MO'
    end
    object quPrint_order_1ID_CITIZEN: TSmallintField
      FieldName = 'ID_CITIZEN'
      Origin = 'STUD.ID_CITIZEN'
    end
    object quPrint_order_1ID_TARGET_REGION: TSmallintField
      FieldName = 'ID_TARGET_REGION'
      Origin = 'STUD.ID_TARGET_REGION'
    end
    object quPrint_order_1ID_SEX: TSmallintField
      FieldName = 'ID_SEX'
      Origin = 'STUD.ID_SEX'
    end
    object quPrint_order_1SPEC_NUM_2017: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'SPEC_NUM_2017'
      Origin = 'SPECIALTY.SPEC_NUM_2017'
      ReadOnly = True
      Size = 10
    end
    object quPrint_order_1IS_STANDART: TSmallintField
      FieldName = 'IS_STANDART'
      Origin = 'SPECIALTY.IS_STANDART'
    end
    object quPrint_order_1NUM_SPR: TIBStringField
      FieldName = 'NUM_SPR'
      Origin = 'L_DATE_SPR_SOC.NUM_SPR'
      Size = 15
    end
  end
  object quParams: TIBDataSet
    Database = Ib_stud
    Transaction = trSprav
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'select m.prorector_fio,e.prikaz, e.glav_bux_fio, m.fiopfo'
      'from main_params m, e_param e'
      '')
    ModifySQL.Strings = (
      'update main_params'
      'set'
      ' oso_year=:oso_year,'
      ' sum_grant=:sum_grant,'
      ' sum_grant_privileg=:sum_grant_privileg,'
      ' sum_top_soc_grant=:sum_top_soc_grant,'
      ' sum_grant_hol=:sum_grant_hol,'
      ' sum_grant_priv_hol=:sum_grant_priv_hol,'
      ' sum_grant_bak_1kurs=:sum_grant_bak_1kurs, '
      ' sum_grant_priv_bak_1kurs=:sum_grant_priv_bak_1kurs,'
      ' sum_grant_mag_1kurs=:sum_grant_mag_1kurs, '
      ' sum_grant_priv_mag_1kurs=:sum_grant_priv_mag_1kurs'
      '')
    Left = 136
    Top = 452
    object quParamsPRORECTOR_FIO: TIBStringField
      FieldName = 'PRORECTOR_FIO'
      Origin = 'MAIN_PARAMS.PRORECTOR_FIO'
      Size = 80
    end
    object quParamsPRIKAZ: TIBStringField
      FieldName = 'PRIKAZ'
      Origin = 'E_PARAM.PRIKAZ'
      Size = 50
    end
    object quParamsGLAV_BUX_FIO: TIBStringField
      FieldName = 'GLAV_BUX_FIO'
      Origin = 'E_PARAM.GLAV_BUX_FIO'
      Size = 60
    end
    object quParamsFIOPFO: TIBStringField
      FieldName = 'FIOPFO'
      Origin = 'MAIN_PARAMS.FIOPFO'
      Size = 60
    end
  end
  object dsParams: TDataSource
    DataSet = quParams
    Left = 268
    Top = 456
  end
  object quFine: TIBQuery
    Database = Ib_stud
    Transaction = trSprav
    BufferChunks = 1000
    CachedUpdates = False
    Left = 136
    Top = 398
  end
  object iqCheckLocked: TIBSQL
    Database = Ib_stud
    ParamCheck = True
    SQL.Strings = (
      'select LOCKED'
      'from'
      '  MAIN_PARAMS')
    Transaction = trnsMain
    Left = 21
    Top = 131
  end
  object ibeCheckLocked: TIBEvents
    AutoRegister = True
    Database = Ib_stud
    Events.Strings = (
      'LOCKED')
    Registered = False
    Left = 21
    Top = 184
  end
  object quPror: TIBQuery
    Database = Ib_stud
    Transaction = trSprav
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select id,fio_r, fio'
      'from rector '
      'where id=3')
    Left = 135
    Top = 502
    object quProrFIO_R: TIBStringField
      FieldName = 'FIO_R'
      Origin = 'RECTOR.FIO_R'
      Size = 60
    end
    object quProrID: TIntegerField
      FieldName = 'ID'
      Origin = 'RECTOR.ID'
      Required = True
    end
    object quProrFIO: TIBStringField
      FieldName = 'FIO'
      Origin = 'RECTOR.FIO'
      Required = True
      Size = 60
    end
  end
  object quPrint_Akt: TIBQuery
    Database = Ib_stud
    Transaction = trSprav
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select e.id, '
      '          e.id_type_institution, '
      '          e.name, eti.name as type_inst, '
      '          eta.name as type_agree, '
      '          e.id_residenc,'
      '          rez.name as rezidenc, '
      '          e.adress, e.number, '
      '          e.is_dop_contract, '
      '          e.num_agreement, '
      '          e.small_name, '
      '          e.date_agreement, '
      '          e.contact, '
      '          e.phone, '
      '          e.email, '
      '          e.is_dop_contract, '
      '          e.id_type_agreement,'
      '          e.is_print, e.date_end, '
      '          e.status_agreement, '
      '          e.id_user,'
      '          e.is_actual,'
      '          e.document, '
      '          e. fio_director, '
      '          e.fio_director_rod, '
      '          e.post_director, '
      '          e.post_director_rod, '
      '          e.is_unlimited, '
      
        '          e.okonh, e.kpp,e.inn,e.bik,e.okpo,e.rs,e.ls,e.bank, e.' +
        'oktmo,e.kbk, e.ks,e.bank_predl, '
      '          e.is_budget, '
      '          e.contact_duty, '
      '          e.is_oso,'
      '          edc.number_dop_contract,'
      '          edc.date_dop_contract,'
      '          e.id_faculty,'
      '          f.name as nameFac,'
      '          f.status as statusFac,'
      
        '          decode(e.is_oso, 0, '#39#1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1086#1085#1085#1086'-'#1089#1090#1091#1076#1077#1085#1095#1077#1089#1082#1080#1081' '#1086#1090#1076#1077#1083 +
        #39', 1, '#39#1062#1077#1085#1090#1088' '#1087#1086' '#1088#1072#1073#1086#1090#1077' '#1089' '#1090#1072#1083#1072#1085#1090#1083#1080#1074#1086#1081' '#1084#1086#1083#1086#1076#1077#1078#1100#1102' '#1080' '#1072#1073#1080#1090#1091#1088#1080#1077#1085#1090#1072#1084#1080#39',' +
        ' f.full_name) as name_depart,'
      '         edc.count_stud,'
      '         edc.count_weeks'
      'from EMPLOYERS e'
      
        'left join EMP_TYPE_INSTITUTION eti on eti.id=e.id_type_instituti' +
        'on'
      'left join SC_RESIDENC rez on rez.id=e.id_residenc'
      'left join EMP_TYPE_AGREEMENTS eta on eta.id=e.id_type_agreement'
      'left join EMP_DOP_CONTRACTS edc on edc.id_employer=e.id'
      'left join FACULTY f on f.id=e.id_faculty'
      'where e.id<>0 and e.id=:id_employer and edc.id=:id_dop_contract')
    Left = 137
    Top = 606
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_employer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_dop_contract'
        ParamType = ptUnknown
      end>
    object quPrint_AktID: TIntegerField
      FieldName = 'ID'
      Origin = 'EMPLOYERS.ID'
      Required = True
    end
    object quPrint_AktID_TYPE_INSTITUTION: TIntegerField
      FieldName = 'ID_TYPE_INSTITUTION'
      Origin = 'EMPLOYERS.ID_TYPE_INSTITUTION'
    end
    object quPrint_AktNAME: TIBStringField
      FieldName = 'NAME'
      Origin = 'EMPLOYERS.NAME'
      Size = 400
    end
    object quPrint_AktTYPE_INST: TIBStringField
      FieldName = 'TYPE_INST'
      Origin = 'EMP_TYPE_INSTITUTION.NAME'
      Size = 120
    end
    object quPrint_AktTYPE_AGREE: TIBStringField
      FieldName = 'TYPE_AGREE'
      Origin = 'EMP_TYPE_AGREEMENTS.NAME'
      Size = 120
    end
    object quPrint_AktID_RESIDENC: TIntegerField
      FieldName = 'ID_RESIDENC'
      Origin = 'EMPLOYERS.ID_RESIDENC'
    end
    object quPrint_AktREZIDENC: TIBStringField
      FieldName = 'REZIDENC'
      Origin = 'SC_RESIDENC.NAME'
      Size = 40
    end
    object quPrint_AktADRESS: TIBStringField
      FieldName = 'ADRESS'
      Origin = 'EMPLOYERS.ADRESS'
      Size = 400
    end
    object quPrint_AktNUMBER: TIBStringField
      FieldName = 'NUMBER'
      Origin = 'EMPLOYERS.NUMBER'
    end
    object quPrint_AktIS_DOP_CONTRACT: TIntegerField
      FieldName = 'IS_DOP_CONTRACT'
      Origin = 'EMPLOYERS.IS_DOP_CONTRACT'
    end
    object quPrint_AktNUM_AGREEMENT: TIBStringField
      FieldName = 'NUM_AGREEMENT'
      Origin = 'EMPLOYERS.NUM_AGREEMENT'
      Size = 100
    end
    object quPrint_AktSMALL_NAME: TIBStringField
      FieldName = 'SMALL_NAME'
      Origin = 'EMPLOYERS.SMALL_NAME'
      Size = 300
    end
    object quPrint_AktDATE_AGREEMENT: TDateField
      FieldName = 'DATE_AGREEMENT'
      Origin = 'EMPLOYERS.DATE_AGREEMENT'
    end
    object quPrint_AktCONTACT: TIBStringField
      FieldName = 'CONTACT'
      Origin = 'EMPLOYERS.CONTACT'
      Size = 120
    end
    object quPrint_AktPHONE: TIBStringField
      FieldName = 'PHONE'
      Origin = 'EMPLOYERS.PHONE'
      Size = 300
    end
    object quPrint_AktEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'EMPLOYERS.EMAIL'
      Size = 120
    end
    object quPrint_AktIS_DOP_CONTRACT1: TIntegerField
      FieldName = 'IS_DOP_CONTRACT1'
      Origin = 'EMPLOYERS.IS_DOP_CONTRACT'
    end
    object quPrint_AktID_TYPE_AGREEMENT: TIntegerField
      FieldName = 'ID_TYPE_AGREEMENT'
      Origin = 'EMPLOYERS.ID_TYPE_AGREEMENT'
    end
    object quPrint_AktIS_PRINT: TIntegerField
      FieldName = 'IS_PRINT'
      Origin = 'EMPLOYERS.IS_PRINT'
    end
    object quPrint_AktDATE_END: TDateField
      FieldName = 'DATE_END'
      Origin = 'EMPLOYERS.DATE_END'
    end
    object quPrint_AktSTATUS_AGREEMENT: TIntegerField
      FieldName = 'STATUS_AGREEMENT'
      Origin = 'EMPLOYERS.STATUS_AGREEMENT'
    end
    object quPrint_AktID_USER: TIntegerField
      FieldName = 'ID_USER'
      Origin = 'EMPLOYERS.ID_USER'
    end
    object quPrint_AktIS_ACTUAL: TSmallintField
      FieldName = 'IS_ACTUAL'
      Origin = 'EMPLOYERS.IS_ACTUAL'
    end
    object quPrint_AktDOCUMENT: TIBStringField
      FieldName = 'DOCUMENT'
      Origin = 'EMPLOYERS.DOCUMENT'
      Size = 225
    end
    object quPrint_AktFIO_DIRECTOR: TIBStringField
      FieldName = 'FIO_DIRECTOR'
      Origin = 'EMPLOYERS.FIO_DIRECTOR'
      Size = 225
    end
    object quPrint_AktFIO_DIRECTOR_ROD: TIBStringField
      FieldName = 'FIO_DIRECTOR_ROD'
      Origin = 'EMPLOYERS.FIO_DIRECTOR_ROD'
      Size = 225
    end
    object quPrint_AktPOST_DIRECTOR: TIBStringField
      FieldName = 'POST_DIRECTOR'
      Origin = 'EMPLOYERS.POST_DIRECTOR'
      Size = 225
    end
    object quPrint_AktPOST_DIRECTOR_ROD: TIBStringField
      FieldName = 'POST_DIRECTOR_ROD'
      Origin = 'EMPLOYERS.POST_DIRECTOR_ROD'
      Size = 225
    end
    object quPrint_AktIS_UNLIMITED: TSmallintField
      FieldName = 'IS_UNLIMITED'
      Origin = 'EMPLOYERS.IS_UNLIMITED'
    end
    object quPrint_AktOKONH: TIBStringField
      FieldName = 'OKONH'
      Origin = 'EMPLOYERS.OKONH'
    end
    object quPrint_AktKPP: TIBStringField
      FieldName = 'KPP'
      Origin = 'EMPLOYERS.KPP'
    end
    object quPrint_AktINN: TIBStringField
      FieldName = 'INN'
      Origin = 'EMPLOYERS.INN'
    end
    object quPrint_AktBIK: TIBStringField
      FieldName = 'BIK'
      Origin = 'EMPLOYERS.BIK'
    end
    object quPrint_AktOKPO: TIBStringField
      FieldName = 'OKPO'
      Origin = 'EMPLOYERS.OKPO'
    end
    object quPrint_AktRS: TIBStringField
      FieldName = 'RS'
      Origin = 'EMPLOYERS.RS'
      Size = 100
    end
    object quPrint_AktLS: TIBStringField
      FieldName = 'LS'
      Origin = 'EMPLOYERS.LS'
      Size = 100
    end
    object quPrint_AktBANK: TIBStringField
      FieldName = 'BANK'
      Origin = 'EMPLOYERS.BANK'
      Size = 225
    end
    object quPrint_AktOKTMO: TIBStringField
      FieldName = 'OKTMO'
      Origin = 'EMPLOYERS.OKTMO'
      Size = 100
    end
    object quPrint_AktKBK: TIBStringField
      FieldName = 'KBK'
      Origin = 'EMPLOYERS.KBK'
    end
    object quPrint_AktKS: TIBStringField
      FieldName = 'KS'
      Origin = 'EMPLOYERS.KS'
      Size = 100
    end
    object quPrint_AktBANK_PREDL: TIBStringField
      FieldName = 'BANK_PREDL'
      Origin = 'EMPLOYERS.BANK_PREDL'
      Size = 225
    end
    object quPrint_AktIS_BUDGET: TSmallintField
      FieldName = 'IS_BUDGET'
      Origin = 'EMPLOYERS.IS_BUDGET'
    end
    object quPrint_AktCONTACT_DUTY: TIBStringField
      FieldName = 'CONTACT_DUTY'
      Origin = 'EMPLOYERS.CONTACT_DUTY'
      Size = 100
    end
    object quPrint_AktIS_OSO: TSmallintField
      FieldName = 'IS_OSO'
      Origin = 'EMPLOYERS.IS_OSO'
    end
    object quPrint_AktNUMBER_DOP_CONTRACT: TIBStringField
      FieldName = 'NUMBER_DOP_CONTRACT'
      Origin = 'EMP_DOP_CONTRACTS.NUMBER_DOP_CONTRACT'
      Size = 100
    end
    object quPrint_AktDATE_DOP_CONTRACT: TDateField
      FieldName = 'DATE_DOP_CONTRACT'
      Origin = 'EMP_DOP_CONTRACTS.DATE_DOP_CONTRACT'
    end
    object quPrint_AktID_FACULTY: TIntegerField
      FieldName = 'ID_FACULTY'
      Origin = 'EMPLOYERS.ID_FACULTY'
    end
    object quPrint_AktNAMEFAC: TIBStringField
      FieldName = 'NAMEFAC'
      Origin = 'FACULTY.NAME'
      Size = 82
    end
    object quPrint_AktSTATUSFAC: TSmallintField
      FieldName = 'STATUSFAC'
      Origin = 'FACULTY.STATUS'
    end
    object quPrint_AktNAME_DEPART: TIBStringField
      FieldName = 'NAME_DEPART'
      Size = 174
    end
    object quPrint_AktCOUNT_STUD: TIntegerField
      FieldName = 'COUNT_STUD'
      Origin = 'EMP_DOP_CONTRACTS.COUNT_STUD'
    end
    object quPrint_AktCOUNT_WEEKS: TIntegerField
      FieldName = 'COUNT_WEEKS'
      Origin = 'EMP_DOP_CONTRACTS.COUNT_WEEKS'
    end
  end
  object quMonitoring: TIBQuery
    Database = Ib_stud
    Transaction = trSprav
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select count(e.id) as count_no_num'
      'from EMPLOYERS e'
      
        'where e.id<>0  and e.is_actual=1 and  (e.num_agreement is null o' +
        'r e.num_agreement='#39#39')')
    Left = 41
    Top = 422
    object quMonitoringCOUNT_NO_NUM: TIntegerField
      FieldName = 'COUNT_NO_NUM'
      Required = True
    end
  end
  object dsUser: TDataSource
    DataSet = qUser
    Left = 194
    Top = 294
  end
  object quVoenSpec: TIBDataSet
    Database = Ib_stud
    Transaction = trSprav
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from Voen_spec'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into voen_spec'
      '  (ID, NAME)'
      'values'
      '  (:ID, :NAME)')
    SelectSQL.Strings = (
      'select id, name'
      'from VOEN_SPEC'
      'where id<>0'
      'order by name')
    ModifySQL.Strings = (
      'update voen_spec'
      'set'
      '  NAME = :NAME'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_VOEN_SPEC_ID'
    Left = 135
    Top = 136
    object IntegerField1: TIntegerField
      FieldName = 'ID'
      Origin = 'EMP_TYPE_INSTITUTION.ID'
      Required = True
    end
    object IBStringField1: TIBStringField
      DisplayWidth = 50
      FieldName = 'NAME'
      Origin = 'EMP_TYPE_INSTITUTION.NAME'
      Size = 120
    end
  end
  object quSverka: TIBDataSet
    Database = Ib_stud
    Transaction = trSprav
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from C_SVERKA_VOENKOM'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into c_sverka_voenkom'
      '  (ID, RESULT, DATE_SVERKA, ID_CONSCRIPT)'
      'values'
      '  (:ID, :RESULT, :DATE_SVERKA, :ID_CONSCRIPT)')
    SelectSQL.Strings = (
      'select id, result, date_sverka, id_conscript'
      'from c_sverka_voenkom'
      'where id_conscript=:id_conscript'
      'order by 3')
    ModifySQL.Strings = (
      'update c_sverka_voenkom'
      'set'
      '  RESULT= :RESULT,'
      '  DATE_SVERKA=:DATE_SVERKA,'
      '  ID_CONSCRIPT=:ID_CONSCRIPT'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_C_SVERKA_VOENKOM_ID'
    Left = 351
    Top = 16
    object quSverkaID: TIntegerField
      FieldName = 'ID'
      Origin = 'C_SVERKA_VOENKOM.ID'
      Required = True
    end
    object quSverkaRESULT: TIBStringField
      FieldName = 'RESULT'
      Origin = 'C_SVERKA_VOENKOM.RESULT'
      Size = 200
    end
    object quSverkaDATE_SVERKA: TDateField
      FieldName = 'DATE_SVERKA'
      Origin = 'C_SVERKA_VOENKOM.DATE_SVERKA'
    end
    object quSverkaID_CONSCRIPT: TIntegerField
      FieldName = 'ID_CONSCRIPT'
      Origin = 'C_SVERKA_VOENKOM.ID_CONSCRIPT'
    end
  end
  object dsSverka: TDataSource
    DataSet = quSverka
    Left = 415
    Top = 17
  end
  object quRodstvo: TIBDataSet
    Database = Ib_stud
    Transaction = trSprav
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from c_rodstvo'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into c_rodstvo'
      
        '  (fio, date_birth,adress, place_work, id_rodstvo, is_sovm, id_c' +
        'onscript)'
      'values'
      
        '  (:fio, :date_birth, :adress, :place_work, :id_rodstvo, :is_sov' +
        'm, :id_conscript)')
    SelectSQL.Strings = (
      
        'select r.id, r.fio, r.date_birth, r.adress, r.place_work, r.id_r' +
        'odstvo, sr.name as name_rodstvo, r.is_sovm, r.id_conscript'
      'from c_rodstvo r'
      'left join spr_rodstvo sr on sr.id=r.id_rodstvo'
      'where r.id_conscript=:id_conscript'
      'order by r.fio')
    ModifySQL.Strings = (
      'update c_rodstvo'
      'set '
      '  fio= :fio,'
      '  date_birth=:date_birth,'
      '  adress=:adress,'
      '  place_work=:place_work,'
      '  id_rodstvo=:id_rodstvo,'
      '  is_sovm=:is_sovm'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_C_RODSTVO_ID'
    Left = 351
    Top = 80
    object quRodstvoFIO: TIBStringField
      FieldName = 'FIO'
      Origin = 'C_RODSTVO.FIO'
      Size = 120
    end
    object quRodstvoDATE_BIRTH: TDateField
      FieldName = 'DATE_BIRTH'
      Origin = 'C_RODSTVO.DATE_BIRTH'
    end
    object quRodstvoADRESS: TIBStringField
      FieldName = 'ADRESS'
      Origin = 'C_RODSTVO.ADRESS'
      Size = 120
    end
    object quRodstvoPLACE_WORK: TIBStringField
      FieldName = 'PLACE_WORK'
      Origin = 'C_RODSTVO.PLACE_WORK'
      Size = 120
    end
    object quRodstvoID_RODSTVO: TSmallintField
      FieldName = 'ID_RODSTVO'
      Origin = 'C_RODSTVO.ID_RODSTVO'
    end
    object quRodstvoNAME_RODSTVO: TIBStringField
      FieldName = 'NAME_RODSTVO'
      Origin = 'SPR_RODSTVO.NAME'
      Size = 30
    end
    object quRodstvoIS_SOVM: TSmallintField
      FieldName = 'IS_SOVM'
      Origin = 'C_RODSTVO.IS_SOVM'
    end
    object quRodstvoID: TIntegerField
      FieldName = 'ID'
      Origin = 'C_RODSTVO.ID'
      Required = True
    end
    object quRodstvoID_CONSCRIPT: TSmallintField
      FieldName = 'ID_CONSCRIPT'
      Origin = 'C_RODSTVO.ID_CONSCRIPT'
    end
  end
  object dsRodstvo: TDataSource
    DataSet = quRodstvo
    Left = 431
    Top = 73
  end
  object quSprRodstvo: TIBDataSet
    Database = Ib_stud
    Transaction = trSprav
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from spr_rodstvo'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into spr_rodstvo'
      '  (ID, NAME)'
      'values'
      '  (:ID, :NAME)')
    SelectSQL.Strings = (
      'select sr.id, sr.name'
      'from spr_rodstvo sr'
      'order by 2')
    ModifySQL.Strings = (
      'update spr_rodstvo'
      'set'
      '  NAME = :NAME'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_C_RODSTVO_ID'
    Left = 351
    Top = 136
    object quSprRodstvoID: TIntegerField
      FieldName = 'ID'
      Origin = 'SPR_RODSTVO.ID'
      Required = True
    end
    object quSprRodstvoNAME: TIBStringField
      FieldName = 'NAME'
      Origin = 'SPR_RODSTVO.NAME'
      Size = 30
    end
  end
  object dsSprRodstvo: TDataSource
    DataSet = quSprRodstvo
    Left = 431
    Top = 129
  end
  object quFlaguage: TIBDataSet
    Database = Ib_stud
    Transaction = trSprav
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'select id, name'
      'from flanguage'
      'order by 2')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_FLANGUAGE_ID'
    Left = 359
    Top = 200
    object IntegerField2: TIntegerField
      FieldName = 'ID'
      Origin = 'SPR_RODSTVO.ID'
      Required = True
    end
    object IBStringField2: TIBStringField
      FieldName = 'NAME'
      Origin = 'SPR_RODSTVO.NAME'
      Size = 30
    end
  end
  object dsFlanguage: TDataSource
    DataSet = quFlaguage
    Left = 439
    Top = 201
  end
  object quReshenie_prizyv_kom: TIBDataSet
    Database = Ib_stud
    Transaction = trSprav
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'select id, name'
      'from DECISION_PRIZYV_KOM'
      'order by 2')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_DECISION_PRIZYV_KOM_ID'
    Left = 359
    Top = 248
    object IntegerField3: TIntegerField
      FieldName = 'ID'
      Origin = 'SPR_RODSTVO.ID'
      Required = True
    end
    object IBStringField3: TIBStringField
      FieldName = 'NAME'
      Origin = 'SPR_RODSTVO.NAME'
      Size = 120
    end
  end
  object dsReshenie_prizyv_kom: TDataSource
    DataSet = quReshenie_prizyv_kom
    Left = 439
    Top = 249
  end
  object quVoenZvanie: TIBDataSet
    Database = Ib_stud
    Transaction = trSprav
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from Voen_zvanie'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into voen_zvanie'
      '  (ID, NAME)'
      'values'
      '  (:ID, :NAME)')
    SelectSQL.Strings = (
      'select id, name'
      'from VOEN_ZVANIE'
      'where id<>0'
      'order by id')
    ModifySQL.Strings = (
      'update voen_zvanie'
      'set'
      '  NAME = :NAME'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_VOEN_SPEC_ID'
    Left = 351
    Top = 320
    object IntegerField4: TIntegerField
      FieldName = 'ID'
      Origin = 'EMP_TYPE_INSTITUTION.ID'
      Required = True
    end
    object IBStringField4: TIBStringField
      DisplayWidth = 50
      FieldName = 'NAME'
      Origin = 'EMP_TYPE_INSTITUTION.NAME'
      Size = 120
    end
  end
  object dsVoenZvanie: TDataSource
    DataSet = quVoenZvanie
    Left = 441
    Top = 313
  end
  object quSPR_ANSWER_RAZRYAD: TIBDataSet
    Database = Ib_stud
    Transaction = trSprav
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from Voen_zvanie'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into voen_zvanie'
      '  (ID, NAME)'
      'values'
      '  (:ID, :NAME)')
    SelectSQL.Strings = (
      'select id, name'
      'from SPR_ANWER_RAZRYAD')
    ModifySQL.Strings = (
      'update voen_zvanie'
      'set'
      '  NAME = :NAME'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_VOEN_SPEC_ID'
    Left = 343
    Top = 400
    object quSPR_ANSWER_RAZRYADID: TIntegerField
      FieldName = 'ID'
      Origin = 'SPR_ANWER_RAZRYAD.ID'
      Required = True
    end
    object quSPR_ANSWER_RAZRYADNAME: TIBStringField
      FieldName = 'NAME'
      Origin = 'SPR_ANWER_RAZRYAD.NAME'
      Size = 120
    end
  end
  object dsSPR_ANSWER_RAZRYAD: TDataSource
    DataSet = quSPR_ANSWER_RAZRYAD
    Left = 489
    Top = 401
  end
  object quSPR_ANSWER_SOSTAV: TIBDataSet
    Database = Ib_stud
    Transaction = trSprav
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from Voen_zvanie'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into voen_zvanie'
      '  (ID, NAME)'
      'values'
      '  (:ID, :NAME)')
    SelectSQL.Strings = (
      'select id, name'
      'from SPR_ANSWER_SOSTAV')
    ModifySQL.Strings = (
      'update voen_zvanie'
      'set'
      '  NAME = :NAME'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_VOEN_SPEC_ID'
    Left = 343
    Top = 448
    object quSPR_ANSWER_SOSTAVID: TIntegerField
      FieldName = 'ID'
      Origin = 'SPR_ANSWER_SOSTAV.ID'
      Required = True
    end
    object quSPR_ANSWER_SOSTAVNAME: TIBStringField
      FieldName = 'NAME'
      Origin = 'SPR_ANSWER_SOSTAV.NAME'
      Size = 120
    end
  end
  object dsSPR_ANSWER_SOSTAV: TDataSource
    DataSet = quSPR_ANSWER_SOSTAV
    Left = 489
    Top = 449
  end
end
