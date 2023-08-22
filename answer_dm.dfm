object dmAnswer: TdmAnswer
  OldCreateOrder = False
  Left = 404
  Top = 146
  Height = 510
  Width = 1019
  object trAnswer: TIBTransaction
    Active = False
    DefaultDatabase = dmSprav.Ib_stud
    AutoStopAction = saNone
    Left = 21
    Top = 19
  end
  object quReestrInst: TIBQuery
    Database = dmSprav.Ib_stud
    Transaction = trAnswer
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select e.id, e.name, e.Small_name, e.num_agreement, e.date_agree' +
        'ment, e.date_end, e.contact, e.phone, e.email, e.is_dop_contract' +
        ', t.name as type_inst'
      'from employers e'
      'left join emp_type_institution t on t.id=e.id_type_institution'
      'where not e.small_name is null')
    Left = 88
    Top = 13
    object quReestrInstID: TIntegerField
      FieldName = 'ID'
      Origin = 'EMPLOYERS.ID'
      Required = True
    end
    object quReestrInstSMALL_NAME: TIBStringField
      FieldName = 'SMALL_NAME'
      Origin = 'EMPLOYERS.SMALL_NAME'
      Size = 300
    end
    object quReestrInstNUM_AGREEMENT: TIBStringField
      FieldName = 'NUM_AGREEMENT'
      Origin = 'EMPLOYERS.NUM_AGREEMENT'
      Size = 100
    end
    object quReestrInstDATE_AGREEMENT: TDateField
      FieldName = 'DATE_AGREEMENT'
      Origin = 'EMPLOYERS.DATE_AGREEMENT'
    end
    object quReestrInstCONTACT: TIBStringField
      FieldName = 'CONTACT'
      Origin = 'EMPLOYERS.CONTACT'
      Size = 120
    end
    object quReestrInstPHONE: TIBStringField
      FieldName = 'PHONE'
      Origin = 'EMPLOYERS.PHONE'
      Size = 300
    end
    object quReestrInstEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'EMPLOYERS.EMAIL'
      Size = 120
    end
    object quReestrInstIS_DOP_CONTRACT: TIntegerField
      FieldName = 'IS_DOP_CONTRACT'
      Origin = 'EMPLOYERS.IS_DOP_CONTRACT'
    end
    object quReestrInstTYPE_INST: TIBStringField
      FieldName = 'TYPE_INST'
      Origin = 'EMP_TYPE_INSTITUTION.NAME'
      Size = 120
    end
    object quReestrInstDATE_END: TDateField
      FieldName = 'DATE_END'
      Origin = 'EMPLOYERS.DATE_END'
    end
    object quReestrInstNAME: TIBStringField
      FieldName = 'NAME'
      Origin = 'EMPLOYERS.NAME'
      Size = 400
    end
  end
  object dsReestrInst: TDataSource
    DataSet = quReestrInst
    Left = 149
    Top = 12
  end
  object quOtchet: TIBQuery
    Database = dmSprav.Ib_stud
    Transaction = dmSprav.trSprav
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select  distinct *'
      'from otchet(:is_pr)'
      'where razryad is not null'
      '')
    Left = 36
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'is_pr'
        ParamType = ptUnknown
      end>
    object quOtchetRAZRYAD: TIBStringField
      FieldName = 'RAZRYAD'
      Origin = 'OTCHET.RAZRYAD'
      Size = 100
    end
    object quOtchetSOSTAV: TIBStringField
      FieldName = 'SOSTAV'
      Origin = 'OTCHET.SOSTAV'
      Size = 100
    end
    object quOtchetKOL_RA_ALL: TIntegerField
      FieldName = 'KOL_RA_ALL'
      Origin = 'OTCHET.KOL_RA_ALL'
    end
    object quOtchetKOL_VMF_ALL: TIntegerField
      FieldName = 'KOL_VMF_ALL'
      Origin = 'OTCHET.KOL_VMF_ALL'
    end
    object quOtchetKOL_ALL: TIntegerField
      FieldName = 'KOL_ALL'
      Origin = 'OTCHET.KOL_ALL'
    end
    object quOtchetKOL_RA_O: TIntegerField
      FieldName = 'KOL_RA_O'
      Origin = 'OTCHET.KOL_RA_O'
    end
    object quOtchetKOL_VMF_O: TIntegerField
      FieldName = 'KOL_VMF_O'
      Origin = 'OTCHET.KOL_VMF_O'
    end
    object quOtchetKOL_ALL_O: TIntegerField
      FieldName = 'KOL_ALL_O'
      Origin = 'OTCHET.KOL_ALL_O'
    end
    object quOtchetKOL_RA_S: TIntegerField
      FieldName = 'KOL_RA_S'
      Origin = 'OTCHET.KOL_RA_S'
    end
    object quOtchetKOL_VMF_S: TIntegerField
      FieldName = 'KOL_VMF_S'
      Origin = 'OTCHET.KOL_VMF_S'
    end
    object quOtchetKOL_ALL_S: TIntegerField
      FieldName = 'KOL_ALL_S'
      Origin = 'OTCHET.KOL_ALL_S'
    end
  end
  object dsOtchet: TDataSource
    DataSet = quOtchet
    Left = 85
    Top = 236
  end
  object quFirst_kat_zapas: TIBQuery
    Database = dmSprav.Ib_stud
    Transaction = dmSprav.trSprav
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select  c.fio, r.name as name_razryad,s.name as name_sostav, iif' +
        '(c.is_uchet=0, '#39#1086#1073#1097#1080#1081#39', '#39#1089#1087#1077#1094#39' ) as Uchet ,'
      ' iif(c.is_vmf=1, '#39#1042#1052#1060#39','#39#39') as VMF, iif(c.is_ra=1,'#39#1056#1040#39','#39#39') as RA'
      'from  conscripts c'
      'left join spr_answer_sostav s on s.id=c.id_answer_sostav'
      'left join spr_anwer_razryad r on r.id=c.id_answer_razryad'
      'where c.is_first_kat_zapas=1'
      'order by c.fio, r.name, s.name, c.is_uchet, c.is_vmf')
    Left = 36
    Top = 304
    object quFirst_kat_zapasFIO: TIBStringField
      FieldName = 'FIO'
      Origin = 'CONSCRIPTS.FIO'
      Size = 120
    end
    object quFirst_kat_zapasNAME_RAZRYAD: TIBStringField
      FieldName = 'NAME_RAZRYAD'
      Origin = 'SPR_ANWER_RAZRYAD.NAME'
      Size = 120
    end
    object quFirst_kat_zapasNAME_SOSTAV: TIBStringField
      FieldName = 'NAME_SOSTAV'
      Origin = 'SPR_ANSWER_SOSTAV.NAME'
      Size = 120
    end
    object quFirst_kat_zapasUCHET: TIBStringField
      FieldName = 'UCHET'
      Required = True
      FixedChar = True
      Size = 5
    end
    object quFirst_kat_zapasVMF: TIBStringField
      FieldName = 'VMF'
      Required = True
      FixedChar = True
      Size = 3
    end
    object quFirst_kat_zapasRA: TIBStringField
      FieldName = 'RA'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object dsFirst_kat_zapas: TDataSource
    DataSet = quFirst_kat_zapas
    Left = 85
    Top = 300
  end
end
