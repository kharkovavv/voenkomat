object fmAddDopContract: TfmAddDopContract
  Left = 284
  Top = 347
  Width = 602
  Height = 387
  Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1089#1086#1075#1083#1072#1096#1077#1085#1080#1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 586
    Height = 301
    Align = alClient
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 9
      Top = 6
      Width = 566
      Height = 277
      Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label6: TLabel
        Left = 12
        Top = 19
        Width = 37
        Height = 15
        Caption = #1053#1086#1084#1077#1088
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl4: TLabel
        Left = 12
        Top = 64
        Width = 28
        Height = 15
        Caption = #1044#1072#1090#1072
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 295
        Top = 111
        Width = 139
        Height = 15
        Caption = #1057#1091#1084#1084#1072' '#1086#1087#1083#1072#1090#1099' '#1087#1088#1072#1082#1090#1080#1082#1080
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 12
        Top = 161
        Width = 174
        Height = 15
        Caption = #1053#1086#1084#1077#1088' '#1087#1083#1072#1090#1077#1078#1085#1086#1075#1086' '#1087#1086#1088#1091#1095#1077#1085#1080#1103
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 12
        Top = 209
        Width = 166
        Height = 15
        Caption = #1044#1072#1090#1072' '#1087#1083#1072#1090#1077#1078#1085#1086#1075#1086' '#1087#1086#1083#1091#1095#1077#1085#1080#1103
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 295
        Top = 19
        Width = 137
        Height = 15
        Caption = #1054#1087#1083#1072#1090#1080#1074#1096#1080#1081' '#1092#1072#1082#1091#1083#1100#1090#1077#1090
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 295
        Top = 64
        Width = 179
        Height = 15
        Caption = #1044#1072#1090#1072' '#1072#1082#1090#1072' '#1074#1099#1087#1086#1083#1085#1077#1085#1085#1099#1093' '#1088#1072#1073#1086#1090
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 12
        Top = 111
        Width = 253
        Height = 15
        Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1076#1086#1087'. '#1089#1086#1075#1083#1072#1096#1077#1085#1080#1103
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 295
        Top = 161
        Width = 131
        Height = 15
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1090#1091#1076#1077#1085#1090#1086#1074
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 295
        Top = 209
        Width = 116
        Height = 15
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1085#1077#1076#1077#1083#1100
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edNum_Agreement: TDBEdit
        Left = 13
        Top = 36
        Width = 252
        Height = 23
        DataField = 'NUMBER_DOP_CONTRACT'
        DataSource = dmSprav.dsDopContract
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object edSumm: TDBEdit
        Left = 295
        Top = 131
        Width = 252
        Height = 23
        DataField = 'SUMM'
        DataSource = dmSprav.dsDopContract
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object EdNum_pay: TDBEdit
        Left = 12
        Top = 181
        Width = 252
        Height = 23
        DataField = 'NUMBER_PAY'
        DataSource = dmSprav.dsDopContract
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object cbFacultyPay: TDBLookupComboboxEh
        Left = 295
        Top = 36
        Width = 252
        Height = 21
        DataField = 'ID_FACULTY_PAY'
        DataSource = dmSprav.dsDopContract
        DropDownBox.Rows = 15
        DropDownBox.Sizable = True
        DropDownBox.SpecRow.CellsText = '<'#1092#1072#1082#1091#1083#1100#1090#1077#1090' '#1085#1077' '#1074#1099#1073#1088#1072#1085'>'
        DropDownBox.SpecRow.Font.Charset = DEFAULT_CHARSET
        DropDownBox.SpecRow.Font.Color = clWindowText
        DropDownBox.SpecRow.Font.Height = -11
        DropDownBox.SpecRow.Font.Name = 'MS Sans Serif'
        DropDownBox.SpecRow.Font.Style = [fsBold]
        DropDownBox.SpecRow.ShortCut = 16430
        DropDownBox.SpecRow.Visible = True
        DropDownBox.Width = -1
        EditButtons = <>
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Flat = True
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = dmSprav.dsFacult
        ParentFont = False
        TabOrder = 3
        Visible = True
      end
      object dtpDate1: TDBDateTimeEditEh
        Left = 12
        Top = 82
        Width = 252
        Height = 23
        DataField = 'DATE_DOP_CONTRACT'
        DataSource = dmSprav.dsDopContract
        DynProps = <>
        EditButtons = <>
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Kind = dtkDateEh
        ParentFont = False
        TabOrder = 4
        Visible = True
      end
      object dtpDate2: TDBDateTimeEditEh
        Left = 12
        Top = 230
        Width = 252
        Height = 23
        DataField = 'DATE_PAY'
        DataSource = dmSprav.dsDopContract
        DynProps = <>
        EditButtons = <>
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Kind = dtkDateEh
        ParentFont = False
        TabOrder = 5
        Visible = True
      end
      object dtpDate_akt: TDBDateTimeEditEh
        Left = 295
        Top = 82
        Width = 252
        Height = 23
        DataField = 'DATE_AKT'
        DataSource = dmSprav.dsDopContract
        DynProps = <>
        EditButtons = <>
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Kind = dtkDateEh
        ParentFont = False
        TabOrder = 6
        Visible = True
      end
      object dtpDate3: TDBDateTimeEditEh
        Left = 12
        Top = 131
        Width = 252
        Height = 23
        DataField = 'DATE_END_DOP_CONTRACT'
        DataSource = dmSprav.dsDopContract
        DynProps = <>
        EditButtons = <>
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Kind = dtkDateEh
        ParentFont = False
        TabOrder = 7
        Visible = True
      end
      object edCount_Stud: TDBEdit
        Left = 295
        Top = 181
        Width = 252
        Height = 23
        DataField = 'COUNT_STUD'
        DataSource = dmSprav.dsDopContract
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
      object edCount_Weeks: TDBEdit
        Left = 295
        Top = 230
        Width = 252
        Height = 23
        DataField = 'COUNT_WEEKS'
        DataSource = dmSprav.dsDopContract
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
      end
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 301
    Width = 586
    Height = 48
    Align = alBottom
    TabOrder = 1
    object btnOk: TBitBtn
      Left = 165
      Top = 11
      Width = 113
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Default = True
      TabOrder = 0
      OnClick = btnOkClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btnCancel: TBitBtn
      Left = 310
      Top = 10
      Width = 113
      Height = 25
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      OnClick = btnCancelClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
end
