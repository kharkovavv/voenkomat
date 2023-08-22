object fmAddEmployer: TfmAddEmployer
  Left = 45
  Top = 21
  Width = 1323
  Height = 724
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080' '#1086' '#1087#1088#1080#1079#1099#1074#1085#1080#1082#1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1307
    Height = 33
    Align = alTop
    TabOrder = 0
    object ToolBar2: TToolBar
      Left = 1
      Top = 1
      Width = 1305
      Height = 24
      AutoSize = True
      ButtonWidth = 91
      Caption = 'ToolBar1'
      Flat = True
      Images = fmMenu.ImageList2
      TabOrder = 0
      Transparent = True
      object btnNew: TToolButton
        Left = 0
        Top = 0
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        ImageIndex = 0
        ParentShowHint = False
        ShowHint = True
        OnClick = btnNewClick
      end
      object btnEdit: TToolButton
        Left = 91
        Top = 0
        Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
        Caption = 'btnEdit'
        ImageIndex = 16
        ParentShowHint = False
        ShowHint = True
        OnClick = btnEditClick
      end
      object btnDel: TToolButton
        Left = 182
        Top = 0
        Hint = #1059#1076#1072#1083#1080#1090#1100
        Caption = 'btnDel'
        ImageIndex = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = btnDelClick
      end
      object DBNavigator1: TDBNavigator
        Left = 273
        Top = 0
        Width = 316
        Height = 22
        DataSource = dmSprav.dsEmployers
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        TabOrder = 0
        Visible = False
        OnClick = DBNavigator1Click
      end
      object Label7: TLabel
        Left = 589
        Top = 0
        Width = 28
        Height = 22
        Alignment = taCenter
        Caption = #1060#1048#1054
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edFIO: TDBEdit
        Left = 617
        Top = 0
        Width = 252
        Height = 22
        DataField = 'FIO'
        DataSource = dmSprav.dsEmployers
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 33
    Width = 1307
    Height = 653
    ActivePage = tsZapas
    Align = alClient
    TabOrder = 1
    object tsPrizyv: TTabSheet
      Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1087#1088#1080#1079#1099#1074#1085#1080#1082#1072
      object pnl1: TPanel
        Left = 0
        Top = 0
        Width = 1299
        Height = 625
        Align = alClient
        TabOrder = 0
        object Label90: TLabel
          Left = 466
          Top = 60
          Width = 24
          Height = 15
          Caption = #1055#1086#1083
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object GroupBox2: TGroupBox
          Left = 16
          Top = 96
          Width = 441
          Height = 337
          Caption = #1054#1089#1085#1086#1074#1085#1099#1077' '#1089#1074#1077#1076#1077#1085#1080#1103
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Label1: TLabel
            Left = 10
            Top = 139
            Width = 112
            Height = 15
            Caption = #1040#1076#1088#1077#1089' '#1087#1086' '#1087#1088#1086#1087#1080#1089#1082#1077
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label12: TLabel
            Left = 10
            Top = 19
            Width = 90
            Height = 15
            Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label2: TLabel
            Left = 10
            Top = 75
            Width = 98
            Height = 15
            Caption = #1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label14: TLabel
            Left = 218
            Top = 139
            Width = 197
            Height = 15
            Caption = #1040#1076#1088#1077#1089' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1086#1075#1086' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1103
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label4: TLabel
            Left = 218
            Top = 75
            Width = 122
            Height = 15
            Caption = #1052#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099'/'#1091#1095#1077#1073#1099
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label15: TLabel
            Left = 218
            Top = 20
            Width = 78
            Height = 15
            Caption = #1054#1073#1088#1072#1079#1086#1074#1072#1085#1080#1077
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object mmAdress: TDBMemo
            Left = 10
            Top = 160
            Width = 199
            Height = 41
            DataField = 'ADRESS_REG'
            DataSource = dmSprav.dsEmployers
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBDateTimeEditEh3: TDBDateTimeEditEh
            Left = 10
            Top = 42
            Width = 199
            Height = 23
            DataField = 'DATE_PASSPORT'
            DataSource = dmSprav.dsEmployers
            DynProps = <>
            EditButtons = <>
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            Kind = dtkDateEh
            ParentFont = False
            TabOrder = 1
            Visible = True
          end
          object DBMemo2: TDBMemo
            Left = 10
            Top = 96
            Width = 199
            Height = 41
            DataField = 'PLACE_BIRTH'
            DataSource = dmSprav.dsEmployers
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object DBMemo3: TDBMemo
            Left = 218
            Top = 160
            Width = 199
            Height = 41
            DataField = 'ADRESS_FACT'
            DataSource = dmSprav.dsEmployers
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object DBMemo4: TDBMemo
            Left = 218
            Top = 96
            Width = 199
            Height = 41
            DataField = 'PLACE_WORK'
            DataSource = dmSprav.dsEmployers
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object DBLookupComboboxEh1: TDBLookupComboboxEh
            Left = 218
            Top = 43
            Width = 199
            Height = 23
            DataField = 'ID_EDUC'
            DataSource = dmSprav.dsEmployers
            DropDownBox.Sizable = True
            EditButtons = <>
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            KeyField = 'ID'
            ListField = 'NAME'
            ListSource = dmSprav.dsTypeEduc
            ParentFont = False
            TabOrder = 5
            Visible = True
          end
          object GroupBox3: TGroupBox
            Left = 10
            Top = 208
            Width = 399
            Height = 121
            Caption = #1055#1072#1089#1087#1086#1088#1090
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 6
            object Label3: TLabel
              Left = 18
              Top = 19
              Width = 85
              Height = 15
              Caption = #1057#1077#1088#1080#1103' '#1080' '#1085#1086#1084#1077#1088
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label5: TLabel
              Left = 18
              Top = 59
              Width = 40
              Height = 15
              Caption = #1042#1099#1076#1072#1085
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label8: TLabel
              Left = 208
              Top = 11
              Width = 77
              Height = 15
              Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEdit1: TDBEdit
              Left = 18
              Top = 35
              Width = 183
              Height = 23
              DataField = 'NUM_PASSPORT'
              DataSource = dmSprav.dsEmployers
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object DBMemo1: TDBMemo
              Left = 18
              Top = 80
              Width = 367
              Height = 33
              DataField = 'WHO_PASSPORT'
              DataSource = dmSprav.dsEmployers
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object DBDateTimeEditEh1: TDBDateTimeEditEh
              Left = 208
              Top = 34
              Width = 177
              Height = 23
              DataField = 'DATE_PASSPORT'
              DataSource = dmSprav.dsEmployers
              DynProps = <>
              EditButtons = <>
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              Kind = dtkDateEh
              ParentFont = False
              TabOrder = 2
              Visible = True
            end
          end
        end
        object GroupBox4: TGroupBox
          Left = 16
          Top = 8
          Width = 441
          Height = 81
          Caption = #1059#1076#1086#1089#1090#1086#1074#1077#1088#1077#1085#1080#1077' '#1075#1088#1072#1078#1076#1072#1085#1080#1085#1072', '#1087#1086#1076#1083#1077#1078#1072#1097#1077#1075#1086' '#1087#1088#1080#1079#1099#1074#1091' '#1085#1072' '#1074#1086#1080#1085#1089#1082#1091#1102' '#1089#1083#1091#1078#1073#1091
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object Label9: TLabel
            Left = 10
            Top = 27
            Width = 85
            Height = 15
            Caption = #1057#1077#1088#1080#1103' '#1080' '#1085#1086#1084#1077#1088
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label13: TLabel
            Left = 290
            Top = 27
            Width = 77
            Height = 15
            Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBEdit2: TDBEdit
            Left = 10
            Top = 43
            Width = 271
            Height = 23
            DataField = 'NUM_PRIZYV_PASSPORT'
            DataSource = dmSprav.dsEmployers
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBDateTimeEditEh2: TDBDateTimeEditEh
            Left = 290
            Top = 42
            Width = 121
            Height = 23
            DataField = 'DATE_PRIZYV_PASSPORT'
            DataSource = dmSprav.dsEmployers
            DynProps = <>
            EditButtons = <>
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            Kind = dtkDateEh
            ParentFont = False
            TabOrder = 1
            Visible = True
          end
        end
        object rbMArried: TRadioGroup
          Left = 466
          Top = 10
          Width = 399
          Height = 47
          Caption = #1057#1077#1084#1077#1081#1085#1086#1077' '#1087#1086#1083#1086#1078#1077#1085#1080#1077
          Columns = 3
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Items.Strings = (
            #1047#1072#1084#1091#1078#1077#1084
            #1046#1077#1085#1072#1090
            #1061#1086#1083#1086#1089#1090)
          ParentFont = False
          TabOrder = 2
        end
        object GroupBox6: TGroupBox
          Left = 466
          Top = 96
          Width = 399
          Height = 337
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          object Label16: TLabel
            Left = 18
            Top = 20
            Width = 231
            Height = 15
            Caption = #1046#1080#1083#1080#1097#1085#1099#1081' '#1086#1088#1075#1072#1085' '#1087#1086' '#1084#1077#1089#1090#1091' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label17: TLabel
            Left = 18
            Top = 75
            Width = 238
            Height = 15
            Caption = #1058#1077#1088#1088#1080#1090#1086#1088#1080#1072#1083#1100#1085#1099#1081' '#1086#1088#1075#1072#1085' '#1074#1085#1091#1090#1088#1077#1085#1085#1080#1093' '#1076#1077#1083
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label18: TLabel
            Left = 16
            Top = 139
            Width = 186
            Height = 15
            Caption = #1042#1086#1077#1085#1085#1086'-'#1091#1095#1077#1090#1085#1072#1103' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label19: TLabel
            Left = 146
            Top = 222
            Width = 213
            Height = 15
            Caption = #1044#1072#1090#1072' '#1089#1085#1103#1090#1080' '#1080#1083#1080' '#1087#1086#1075#1072#1096#1077#1085#1080' '#1089#1091#1076#1080#1084#1086#1089#1090#1080
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label20: TLabel
            Left = 18
            Top = 222
            Width = 93
            Height = 15
            Caption = #1044#1072#1090#1072' '#1089#1091#1076#1080#1084#1086#1089#1090#1080
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label6: TLabel
            Left = 16
            Top = 267
            Width = 133
            Height = 15
            Caption = #1042#1083#1072#1076#1077#1085#1080#1077' '#1080#1085'. '#1103#1079#1099#1082#1072#1084#1080
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label10: TLabel
            Left = 162
            Top = 267
            Width = 114
            Height = 15
            Caption = #1042#1080#1076' '#1089#1087#1086#1088#1090#1072', '#1088#1072#1079#1088#1103#1076
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBEdit3: TDBEdit
            Left = 18
            Top = 43
            Width = 327
            Height = 23
            DataField = 'ZHIL_ORGAN'
            DataSource = dmSprav.dsEmployers
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBEdit4: TDBEdit
            Left = 18
            Top = 96
            Width = 327
            Height = 23
            DataField = 'MVD_ORGAN'
            DataSource = dmSprav.dsEmployers
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object DBCheckBox1: TDBCheckBox
            Left = 16
            Top = 200
            Width = 97
            Height = 17
            Caption = #1057#1091#1076#1080#1084#1086#1089#1090#1100
            DataField = 'IS_SUD'
            DataSource = dmSprav.dsEmployers
            TabOrder = 2
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBMemo5: TDBMemo
            Left = 112
            Top = 192
            Width = 233
            Height = 33
            DataField = 'SUD_PRIM'
            DataSource = dmSprav.dsEmployers
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object DBDateTimeEditEh4: TDBDateTimeEditEh
            Left = 162
            Top = 239
            Width = 183
            Height = 23
            DataField = 'DATE_SUD_END'
            DataSource = dmSprav.dsEmployers
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
          object DBLookupComboboxEh2: TDBLookupComboboxEh
            Left = 16
            Top = 155
            Width = 329
            Height = 23
            DataField = 'ID_VOEN_SPEC'
            DataSource = dmSprav.dsEmployers
            DropDownBox.Sizable = True
            EditButtons = <>
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            KeyField = 'ID'
            ListField = 'NAME'
            ListSource = dmSprav.dsVoenSpec
            ParentFont = False
            TabOrder = 5
            Visible = True
          end
          object DBDateTimeEditEh5: TDBDateTimeEditEh
            Left = 16
            Top = 239
            Width = 129
            Height = 23
            DataField = 'DATE_SUD_BEGIN'
            DataSource = dmSprav.dsEmployers
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
          object DBLookupComboboxEh3: TDBLookupComboboxEh
            Left = 16
            Top = 283
            Width = 137
            Height = 23
            DataField = 'ID_FLANGUAGE'
            DataSource = dmSprav.dsEmployers
            DropDownBox.Sizable = True
            EditButtons = <>
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            KeyField = 'ID'
            ListField = 'NAME'
            ListSource = dmSprav.dsFlanguage
            ParentFont = False
            TabOrder = 7
            Visible = True
          end
          object DBEdit5: TDBEdit
            Left = 162
            Top = 283
            Width = 183
            Height = 23
            DataField = 'SPORT'
            DataSource = dmSprav.dsEmployers
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
          end
        end
        object pnl2: TPanel
          Left = 1
          Top = 588
          Width = 1297
          Height = 36
          Align = alBottom
          TabOrder = 4
          object btnOk: TBitBtn
            Left = 256
            Top = 8
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
            Left = 519
            Top = 8
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
        object GroupBox1: TGroupBox
          Left = 16
          Top = 440
          Width = 281
          Height = 113
          Caption = #1056#1077#1096#1077#1085#1080#1077' '#1082#1086#1084#1080#1089#1089#1080#1080' '#1087#1086' '#1087#1086#1089#1090#1072#1085#1086#1074#1082#1077' '#1085#1072' '#1074#1086#1080#1085#1089#1082#1080#1081' '#1091#1095#1077#1090
          TabOrder = 5
          object Label11: TLabel
            Left = 10
            Top = 19
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
          object Label23: TLabel
            Left = 10
            Top = 67
            Width = 56
            Height = 15
            Caption = #1055#1088#1086#1090#1086#1082#1086#1083
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBDateTimeEditEh6: TDBDateTimeEditEh
            Left = 10
            Top = 42
            Width = 199
            Height = 23
            DataField = 'DATE_DECISION_VOINSK_UCHET'
            DataSource = dmSprav.dsEmployers
            DynProps = <>
            EditButtons = <>
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            Kind = dtkDateEh
            ParentFont = False
            TabOrder = 0
            Visible = True
          end
          object DBEdit6: TDBEdit
            Left = 10
            Top = 82
            Width = 199
            Height = 23
            DataField = 'DECISION_VOINSK_UCHET'
            DataSource = dmSprav.dsEmployers
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
        end
        object GroupBox5: TGroupBox
          Left = 304
          Top = 440
          Width = 273
          Height = 113
          Caption = #1056#1077#1096#1077#1085#1080#1077' '#1087#1088#1080#1079#1099#1074#1085#1086#1081' '#1082#1086#1084#1080#1089#1089#1080#1080
          TabOrder = 6
          object Label21: TLabel
            Left = 10
            Top = 19
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
          object Label24: TLabel
            Left = 10
            Top = 67
            Width = 56
            Height = 15
            Caption = #1055#1088#1086#1090#1086#1082#1086#1083
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBDateTimeEditEh7: TDBDateTimeEditEh
            Left = 10
            Top = 42
            Width = 199
            Height = 23
            DataField = 'DATE_DECISION_PRIZYV_KOM'
            DataSource = dmSprav.dsEmployers
            DynProps = <>
            EditButtons = <>
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            Kind = dtkDateEh
            ParentFont = False
            TabOrder = 0
            Visible = True
          end
          object DBLookupComboboxEh4: TDBLookupComboboxEh
            Left = 8
            Top = 82
            Width = 201
            Height = 23
            DataField = 'ID_DECISION_PRIZYV_KOM'
            DataSource = dmSprav.dsEmployers
            DropDownBox.Sizable = True
            EditButtons = <>
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            KeyField = 'ID'
            ListField = 'NAME'
            ListSource = dmSprav.dsReshenie_prizyv_kom
            ParentFont = False
            TabOrder = 1
            Visible = True
          end
        end
        object GroupBox7: TGroupBox
          Left = 584
          Top = 440
          Width = 281
          Height = 113
          Caption = #1055#1088#1080#1077#1084' '#1085#1072' '#1074#1086#1080#1089#1085#1082#1080#1081' '#1091#1095#1077#1090' '#1080' '#1089#1085#1103#1090#1080#1077' '#1089' '#1074#1086#1080#1085#1089#1082#1086#1075#1086' '#1091#1095#1077#1090#1072
          TabOrder = 7
          object DBCheckBox2: TDBCheckBox
            Left = 16
            Top = 32
            Width = 193
            Height = 17
            Caption = #1055#1088#1080#1085#1103#1090' '#1085#1072' '#1074#1086#1080#1085#1089#1082#1080#1081' '#1091#1095#1077#1090
            DataField = 'IS_VOEN_UCHET'
            DataSource = dmSprav.dsEmployers
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
        object DBCheckBox6: TDBCheckBox
          Left = 496
          Top = 56
          Width = 41
          Height = 17
          Caption = #1084#1091#1078
          DataField = 'IS_SEX'
          DataSource = dmSprav.dsEmployers
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
    end
    object tsZapas: TTabSheet
      Caption = #1059#1095#1077#1090#1085#1072#1103' '#1082#1072#1088#1090#1086#1095#1082#1072' '#1075#1088#1072#1078#1076#1072#1085#1080#1085#1072' '#1074' '#1079#1072#1087#1072#1089#1077
      ImageIndex = 1
      object Label37: TLabel
        Left = 856
        Top = 554
        Width = 86
        Height = 15
        Caption = #1044#1086#1087'. '#1089#1074#1077#1076#1077#1085#1080#1103
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label84: TLabel
        Left = 10
        Top = 123
        Width = 186
        Height = 15
        Caption = #1042#1086#1077#1085#1085#1086'-'#1091#1095#1077#1090#1085#1072#1103' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GroupBox8: TGroupBox
        Left = 858
        Top = 192
        Width = 399
        Height = 65
        Caption = #1042#1086#1077#1085#1085#1099#1081' '#1073#1080#1083#1077#1090
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label22: TLabel
          Left = 10
          Top = 19
          Width = 85
          Height = 15
          Caption = #1057#1077#1088#1080#1103' '#1080' '#1085#1086#1084#1077#1088
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label25: TLabel
          Left = 210
          Top = 19
          Width = 77
          Height = 15
          Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBEdit7: TDBEdit
          Left = 10
          Top = 35
          Width = 191
          Height = 23
          DataField = 'NUM_PRIZYV_PASSPORT'
          DataSource = dmSprav.dsEmployers
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object DBDateTimeEditEh8: TDBDateTimeEditEh
          Left = 210
          Top = 34
          Width = 121
          Height = 23
          DataField = 'DATE_PRIZYV_PASSPORT'
          DataSource = dmSprav.dsEmployers
          DynProps = <>
          EditButtons = <>
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Kind = dtkDateEh
          ParentFont = False
          TabOrder = 1
          Visible = True
        end
      end
      object GroupBox9: TGroupBox
        Left = 16
        Top = 8
        Width = 833
        Height = 577
        Caption = #1054#1089#1085#1086#1074#1085#1099#1077' '#1089#1074#1077#1076#1077#1085#1080#1103
        Color = clBtnFace
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clMaroon
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 1
        object Label26: TLabel
          Left = 10
          Top = 139
          Width = 112
          Height = 15
          Caption = #1040#1076#1088#1077#1089' '#1087#1086' '#1087#1088#1086#1087#1080#1089#1082#1077
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label27: TLabel
          Left = 10
          Top = 19
          Width = 90
          Height = 15
          Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label28: TLabel
          Left = 10
          Top = 75
          Width = 98
          Height = 15
          Caption = #1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label29: TLabel
          Left = 162
          Top = 139
          Width = 146
          Height = 15
          Caption = #1040#1076#1088#1077#1089' '#1092#1072#1082#1090'. '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1103
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label30: TLabel
          Left = 162
          Top = 75
          Width = 122
          Height = 15
          Caption = #1052#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099'/'#1091#1095#1077#1073#1099
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label31: TLabel
          Left = 162
          Top = 20
          Width = 78
          Height = 15
          Caption = #1054#1073#1088#1072#1079#1086#1074#1072#1085#1080#1077
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label42: TLabel
          Left = 330
          Top = 20
          Width = 98
          Height = 15
          Caption = #1053#1072#1094#1080#1086#1085#1072#1083#1100#1085#1086#1089#1090#1100
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label43: TLabel
          Left = 442
          Top = 20
          Width = 172
          Height = 15
          Caption = #1043#1088#1072#1078#1076#1072#1085#1089#1082#1080#1077' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1080
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label44: TLabel
          Left = 658
          Top = 20
          Width = 53
          Height = 15
          Caption = #1058#1077#1083#1077#1092#1086#1085
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label63: TLabel
          Left = 506
          Top = 523
          Width = 120
          Height = 15
          Caption = #1047#1072#1082#1083'. '#1082#1086#1084#1072#1085#1076#1086#1074#1072#1085#1080#1103
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label65: TLabel
          Left = 666
          Top = 523
          Width = 132
          Height = 15
          Caption = #1047#1072#1082#1083'. '#1074#1086#1077#1085'. '#1082#1086#1084#1080#1089#1089#1072#1088#1072
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label41: TLabel
          Left = 498
          Top = 163
          Width = 114
          Height = 15
          Caption = #1042#1080#1076' '#1089#1087#1086#1088#1090#1072', '#1088#1072#1079#1088#1103#1076
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label40: TLabel
          Left = 328
          Top = 163
          Width = 133
          Height = 15
          Caption = #1042#1083#1072#1076#1077#1085#1080#1077' '#1080#1085'. '#1103#1079#1099#1082#1072#1084#1080
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label83: TLabel
          Left = 666
          Top = 163
          Width = 95
          Height = 15
          Caption = #1044#1086#1079#1072' '#1086#1073#1083#1091#1095#1077#1085#1080#1103
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label89: TLabel
          Left = 778
          Top = 20
          Width = 24
          Height = 15
          Caption = #1055#1086#1083
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBMemo6: TDBMemo
          Left = 10
          Top = 160
          Width = 143
          Height = 41
          DataField = 'ADRESS_REG'
          DataSource = dmSprav.dsEmployers
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object DBDateTimeEditEh9: TDBDateTimeEditEh
          Left = 10
          Top = 42
          Width = 143
          Height = 23
          DataField = 'DATE_PASSPORT'
          DataSource = dmSprav.dsEmployers
          DynProps = <>
          EditButtons = <>
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Kind = dtkDateEh
          ParentFont = False
          TabOrder = 1
          Visible = True
        end
        object DBMemo7: TDBMemo
          Left = 10
          Top = 96
          Width = 143
          Height = 41
          DataField = 'PLACE_BIRTH'
          DataSource = dmSprav.dsEmployers
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object DBMemo8: TDBMemo
          Left = 162
          Top = 160
          Width = 143
          Height = 41
          DataField = 'ADRESS_FACT'
          DataSource = dmSprav.dsEmployers
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object DBMemo9: TDBMemo
          Left = 162
          Top = 96
          Width = 143
          Height = 41
          DataField = 'PLACE_WORK'
          DataSource = dmSprav.dsEmployers
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object DBLookupComboboxEh5: TDBLookupComboboxEh
          Left = 162
          Top = 43
          Width = 143
          Height = 23
          DataField = 'ID_EDUC'
          DataSource = dmSprav.dsEmployers
          DropDownBox.Sizable = True
          EditButtons = <>
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = dmSprav.dsTypeEduc
          ParentFont = False
          TabOrder = 5
          Visible = True
        end
        object GroupBox10: TGroupBox
          Left = 10
          Top = 208
          Width = 295
          Height = 137
          Caption = #1055#1072#1089#1087#1086#1088#1090
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          object Label32: TLabel
            Left = 18
            Top = 19
            Width = 85
            Height = 15
            Caption = #1057#1077#1088#1080#1103' '#1080' '#1085#1086#1084#1077#1088
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label33: TLabel
            Left = 18
            Top = 67
            Width = 40
            Height = 15
            Caption = #1042#1099#1076#1072#1085
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label34: TLabel
            Left = 152
            Top = 19
            Width = 77
            Height = 15
            Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBEdit8: TDBEdit
            Left = 18
            Top = 43
            Width = 119
            Height = 23
            DataField = 'NUM_PASSPORT'
            DataSource = dmSprav.dsEmployers
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBMemo10: TDBMemo
            Left = 18
            Top = 88
            Width = 263
            Height = 41
            DataField = 'WHO_PASSPORT'
            DataSource = dmSprav.dsEmployers
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object DBDateTimeEditEh10: TDBDateTimeEditEh
            Left = 152
            Top = 42
            Width = 129
            Height = 23
            DataField = 'DATE_PASSPORT'
            DataSource = dmSprav.dsEmployers
            DynProps = <>
            EditButtons = <>
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            Kind = dtkDateEh
            ParentFont = False
            TabOrder = 2
            Visible = True
          end
        end
        object DBEdit12: TDBEdit
          Left = 330
          Top = 43
          Width = 103
          Height = 23
          DataField = 'NATION'
          DataSource = dmSprav.dsEmployers
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object DBEdit13: TDBEdit
          Left = 442
          Top = 43
          Width = 207
          Height = 23
          DataField = 'GRAZHD_SPEC'
          DataSource = dmSprav.dsEmployers
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
        object DBEdit14: TDBEdit
          Left = 658
          Top = 43
          Width = 119
          Height = 23
          DataField = 'PHONE'
          DataSource = dmSprav.dsEmployers
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
        end
        object GroupBox13: TGroupBox
          Left = 8
          Top = 408
          Width = 489
          Height = 161
          Caption = #1055#1088#1080#1087#1080#1089#1072#1085' ('#1087#1088#1077#1076#1085#1072#1079#1085#1072#1095#1077#1085')'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
          object Label49: TLabel
            Left = 10
            Top = 19
            Width = 116
            Height = 15
            Caption = #8470' '#1082#1086#1084#1072#1085#1076#1099' '#1080' '#1083#1080#1090#1077#1088
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label50: TLabel
            Left = 138
            Top = 99
            Width = 189
            Height = 15
            Caption = #1044#1072#1090#1072' '#1074#1088#1091#1095#1077#1085#1080#1103' '#1084#1086#1073#1087#1088#1077#1076#1087#1080#1089#1072#1085#1080#1103
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label51: TLabel
            Left = 10
            Top = 59
            Width = 42
            Height = 15
            Caption = #1055#1086' '#1042#1059#1057
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label52: TLabel
            Left = 10
            Top = 99
            Width = 83
            Height = 15
            Caption = #1053#1072' '#1076#1086#1083#1078#1085#1086#1089#1090#1100
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label53: TLabel
            Left = 138
            Top = 19
            Width = 184
            Height = 15
            Caption = #1042#1086#1080#1085#1089#1082#1086#1077' '#1079#1074#1072#1085#1080#1077' '#1087#1086' '#1096#1090#1072#1090#1091' ('#1082#1086#1076')'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label54: TLabel
            Left = 138
            Top = 59
            Width = 96
            Height = 15
            Caption = #1053#1086#1084#1077#1088' '#1084#1072#1088#1096#1088#1091#1090#1072
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label55: TLabel
            Left = 330
            Top = 19
            Width = 97
            Height = 15
            Caption = #1044#1085#1080' '#1080' '#1095#1072#1089#1099' '#1103#1074#1082#1080
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label56: TLabel
            Left = 330
            Top = 59
            Width = 63
            Height = 15
            Caption = #1055#1091#1085#1082#1090' '#1103#1074#1082#1080
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label57: TLabel
            Left = 330
            Top = 99
            Width = 64
            Height = 15
            Caption = #8470' '#1076#1086#1087#1091#1089#1082#1072
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBEdit18: TDBEdit
            Left = 10
            Top = 35
            Width = 119
            Height = 23
            DataField = 'NUM_COMMAND_AND_LITER'
            DataSource = dmSprav.dsEmployers
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBDateTimeEditEh13: TDBDateTimeEditEh
            Left = 138
            Top = 114
            Width = 135
            Height = 23
            DataField = 'DATE_MOB_PREDPIS'
            DataSource = dmSprav.dsEmployers
            DynProps = <>
            EditButtons = <>
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            Kind = dtkDateEh
            ParentFont = False
            TabOrder = 1
            Visible = True
          end
          object DBEdit19: TDBEdit
            Left = 10
            Top = 75
            Width = 119
            Height = 23
            DataField = 'VUS'
            DataSource = dmSprav.dsEmployers
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object DBEdit20: TDBEdit
            Left = 10
            Top = 115
            Width = 119
            Height = 23
            DataField = 'DOLZNOST'
            DataSource = dmSprav.dsEmployers
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object DBEdit21: TDBEdit
            Left = 138
            Top = 35
            Width = 135
            Height = 23
            DataField = 'VOEN_ZVAN_KOD'
            DataSource = dmSprav.dsEmployers
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object DBEdit22: TDBEdit
            Left = 138
            Top = 75
            Width = 135
            Height = 23
            DataField = 'NUM_MARSHRUT'
            DataSource = dmSprav.dsEmployers
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
          end
          object DBEdit23: TDBEdit
            Left = 330
            Top = 35
            Width = 135
            Height = 23
            DataField = 'YAVKA'
            DataSource = dmSprav.dsEmployers
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
          end
          object DBEdit24: TDBEdit
            Left = 330
            Top = 75
            Width = 135
            Height = 23
            DataField = 'PUNKT_YAVKI'
            DataSource = dmSprav.dsEmployers
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
          end
          object DBEdit25: TDBEdit
            Left = 330
            Top = 115
            Width = 135
            Height = 23
            DataField = 'NUM_DOPUSK'
            DataSource = dmSprav.dsEmployers
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
          end
        end
        object GroupBox14: TGroupBox
          Left = 504
          Top = 408
          Width = 321
          Height = 113
          Caption = #1055#1088#1086#1093#1086#1078#1076#1077#1085#1080#1077' '#1074#1086#1077#1085#1085#1086#1081' '#1089#1083#1091#1078#1073#1099', '#1072#1083#1100#1090#1077#1088#1085'. '#1075#1088'.'#1089#1083#1091#1078#1073#1099
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 11
          object Label58: TLabel
            Left = 10
            Top = 27
            Width = 92
            Height = 15
            Caption = #1042#1086#1080#1085#1089#1082#1072#1103' '#1095#1072#1089#1090#1100
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label59: TLabel
            Left = 10
            Top = 67
            Width = 78
            Height = 15
            Caption = #1050#1086#1076#1086#1074#1086#1077' '#1086#1073'-'#1077
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label60: TLabel
            Left = 114
            Top = 67
            Width = 47
            Height = 15
            Caption = #1058#1080#1087' '#1042#1042#1058
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label61: TLabel
            Left = 114
            Top = 27
            Width = 102
            Height = 15
            Caption = 'C '#1082#1072#1082#1086#1075#1086' '#1074#1088#1077#1084#1077#1085#1080
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label62: TLabel
            Left = 218
            Top = 27
            Width = 91
            Height = 15
            Caption = #1055#1086' '#1082#1072#1082#1086#1077' '#1074#1088#1077#1084#1103
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label64: TLabel
            Left = 218
            Top = 67
            Width = 43
            Height = 15
            Caption = #1059#1074#1086#1083#1077#1085
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBEdit26: TDBEdit
            Left = 10
            Top = 43
            Width = 95
            Height = 23
            DataField = 'ALTER_VOIN_CHAST'
            DataSource = dmSprav.dsEmployers
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBEdit27: TDBEdit
            Left = 10
            Top = 83
            Width = 95
            Height = 23
            DataField = 'ALTER_KOD_VUS'
            DataSource = dmSprav.dsEmployers
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object DBEdit28: TDBEdit
            Left = 114
            Top = 83
            Width = 95
            Height = 23
            DataField = 'ALTER_TYPE_VVT'
            DataSource = dmSprav.dsEmployers
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object DBEdit29: TDBEdit
            Left = 114
            Top = 43
            Width = 95
            Height = 23
            DataField = 'ALTER_DATE_BEGIN'
            DataSource = dmSprav.dsEmployers
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object DBEdit30: TDBEdit
            Left = 218
            Top = 43
            Width = 95
            Height = 23
            DataField = 'ALTER_DATE_END'
            DataSource = dmSprav.dsEmployers
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object DBDateTimeEditEh14: TDBDateTimeEditEh
            Left = 218
            Top = 82
            Width = 95
            Height = 23
            DataField = 'ALTER_DATE_UVOLEN'
            DataSource = dmSprav.dsEmployers
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
        end
        object DBEdit31: TDBEdit
          Left = 506
          Top = 539
          Width = 143
          Height = 23
          DataField = 'ZAKL_KOMAND_VOEN_CHAST'
          DataSource = dmSprav.dsEmployers
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 12
        end
        object DBEdit32: TDBEdit
          Left = 664
          Top = 539
          Width = 161
          Height = 23
          DataField = 'ZAKL_VOEN_KOMISSAR'
          DataSource = dmSprav.dsEmployers
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
        end
        object GroupBox15: TGroupBox
          Left = 328
          Top = 80
          Width = 457
          Height = 81
          Caption = #1040#1085#1090#1088#1086#1087#1086#1084#1077#1090#1088#1080#1095#1077#1089#1082#1080#1077' '#1076#1072#1085#1085#1099#1077' ('#1088#1072#1079#1084#1077#1088#1099')'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 14
          object Label68: TLabel
            Left = 82
            Top = 26
            Width = 101
            Height = 15
            Caption = #1054#1073#1084#1091#1085#1076#1080#1088#1086#1074#1072#1085#1080#1077
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label66: TLabel
            Left = 6
            Top = 26
            Width = 27
            Height = 15
            Caption = #1056#1086#1089#1090
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label67: TLabel
            Left = 270
            Top = 18
            Width = 59
            Height = 30
            Caption = #1043#1086#1083#1086#1074#1085#1086#1081' '#1091#1073#1086#1088
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            WordWrap = True
          end
          object Label69: TLabel
            Left = 368
            Top = 26
            Width = 67
            Height = 15
            Caption = #1055#1088#1086#1090#1080#1074#1086#1075#1072#1079
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label70: TLabel
            Left = 190
            Top = 18
            Width = 46
            Height = 30
            Caption = #1056#1072#1079#1084#1077#1088' '#1086#1073#1091#1074#1080
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            WordWrap = True
          end
          object DBEdit35: TDBEdit
            Left = 82
            Top = 50
            Width = 79
            Height = 23
            DataField = 'SIZE_MUNDIR'
            DataSource = dmSprav.dsEmployers
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBEdit33: TDBEdit
            Left = 6
            Top = 50
            Width = 67
            Height = 23
            DataField = 'ROST'
            DataSource = dmSprav.dsEmployers
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object DBEdit34: TDBEdit
            Left = 272
            Top = 50
            Width = 73
            Height = 23
            DataField = 'SIZE_HAD'
            DataSource = dmSprav.dsEmployers
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object DBEdit36: TDBEdit
            Left = 370
            Top = 50
            Width = 71
            Height = 23
            DataField = 'SIZE_PROTIVOGAZ'
            DataSource = dmSprav.dsEmployers
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object DBEdit37: TDBEdit
            Left = 190
            Top = 50
            Width = 67
            Height = 23
            DataField = 'SIZE_FOOT'
            DataSource = dmSprav.dsEmployers
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
        end
        object DBEdit11: TDBEdit
          Left = 498
          Top = 187
          Width = 143
          Height = 23
          DataField = 'SPORT'
          DataSource = dmSprav.dsEmployers
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 15
        end
        object DBLookupComboboxEh7: TDBLookupComboboxEh
          Left = 328
          Top = 187
          Width = 145
          Height = 23
          DataField = 'ID_FLANGUAGE'
          DataSource = dmSprav.dsEmployers
          DropDownBox.Sizable = True
          EditButtons = <>
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = dmSprav.dsFlanguage
          ParentFont = False
          TabOrder = 16
          Visible = True
        end
        object DBEdit47: TDBEdit
          Left = 666
          Top = 187
          Width = 119
          Height = 23
          DataField = 'IND_DOZ_OBLUCH'
          DataSource = dmSprav.dsEmployers
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 17
        end
        object GroupBox17: TGroupBox
          Left = 328
          Top = 216
          Width = 457
          Height = 185
          Color = clGradientInactiveCaption
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 18
          object Label46: TLabel
            Left = 10
            Top = 10
            Width = 103
            Height = 15
            Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1079#1072#1087#1072#1089#1072
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label71: TLabel
            Left = 128
            Top = 12
            Width = 121
            Height = 15
            Caption = #1059#1095#1072#1089#1090#1080#1077' '#1074' '#1073'-'#1093' '#1076#1077#1081#1089'-'#1093
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label72: TLabel
            Left = 314
            Top = 12
            Width = 113
            Height = 15
            Caption = #1043#1086#1089'. '#1085#1072#1075#1088#1072#1076#1099'\'#1079#1085#1072#1082#1080
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label45: TLabel
            Left = 8
            Top = 51
            Width = 100
            Height = 15
            Caption = #1042#1086#1080#1085#1089#1082#1086#1077' '#1079#1074#1072#1085#1080#1077
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label47: TLabel
            Left = 130
            Top = 52
            Width = 76
            Height = 15
            Caption = #1043#1088#1091#1087#1087#1072' '#1091#1095#1105#1090#1072
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label48: TLabel
            Left = 226
            Top = 52
            Width = 41
            Height = 15
            Caption = #1057#1086#1089#1090#1072#1074
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label73: TLabel
            Left = 314
            Top = 52
            Width = 125
            Height = 15
            Caption = #1059#1074#1077#1095#1100#1103', '#1079#1072#1073#1086#1083#1077#1074#1072#1085#1080#1103
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label78: TLabel
            Left = 10
            Top = 99
            Width = 186
            Height = 15
            Caption = #1042#1086#1077#1085#1085#1086'-'#1091#1095#1077#1090#1085#1072#1103' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label74: TLabel
            Left = 218
            Top = 100
            Width = 169
            Height = 15
            Caption = #1050' '#1074#1086#1077#1085#1085#1086#1081' '#1087#1088#1080#1089#1103#1075#1077' '#1087#1088#1080#1074#1077#1076#1077#1085
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label88: TLabel
            Left = 10
            Top = 138
            Width = 115
            Height = 15
            Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1075#1086#1076#1085#1086#1089#1090#1080
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBEdit15: TDBEdit
            Left = 10
            Top = 26
            Width = 103
            Height = 23
            DataField = 'KAT_ZAPAS'
            DataSource = dmSprav.dsEmployers
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBEdit38: TDBEdit
            Left = 130
            Top = 26
            Width = 175
            Height = 23
            DataField = 'TAKE_PART_BOY_ACTION'
            DataSource = dmSprav.dsEmployers
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object DBEdit39: TDBEdit
            Left = 314
            Top = 27
            Width = 119
            Height = 23
            DataField = 'GOS_NAGRADA'
            DataSource = dmSprav.dsEmployers
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object DBLookupComboboxEh8: TDBLookupComboboxEh
            Left = 8
            Top = 67
            Width = 105
            Height = 23
            DataField = 'ID_VOEN_ZVANIE'
            DataSource = dmSprav.dsEmployers
            DropDownBox.Sizable = True
            EditButtons = <>
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            KeyField = 'ID'
            ListField = 'NAME'
            ListSource = dmSprav.dsVoenZvanie
            ParentFont = False
            TabOrder = 3
            Visible = True
          end
          object DBEdit16: TDBEdit
            Left = 130
            Top = 67
            Width = 79
            Height = 23
            DataField = 'GROUP_UCHET'
            DataSource = dmSprav.dsEmployers
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object DBEdit17: TDBEdit
            Left = 224
            Top = 67
            Width = 81
            Height = 23
            DataField = 'SOSTAV'
            DataSource = dmSprav.dsEmployers
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
          end
          object DBEdit40: TDBEdit
            Left = 314
            Top = 67
            Width = 119
            Height = 23
            DataField = 'TRAVMA'
            DataSource = dmSprav.dsEmployers
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
          end
          object DBLookupComboboxEh9: TDBLookupComboboxEh
            Left = 10
            Top = 115
            Width = 191
            Height = 23
            DataField = 'ID_VOEN_SPEC'
            DataSource = dmSprav.dsEmployers
            DropDownBox.Sizable = True
            EditButtons = <>
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            KeyField = 'ID'
            ListField = 'NAME'
            ListSource = dmSprav.dsVoenSpec
            ParentFont = False
            TabOrder = 7
            Visible = True
          end
          object DBEdit41: TDBEdit
            Left = 216
            Top = 115
            Width = 209
            Height = 23
            DataField = 'PRISYAGA'
            DataSource = dmSprav.dsEmployers
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
          end
          object DBEdit48: TDBEdit
            Left = 10
            Top = 154
            Width = 103
            Height = 23
            DataField = 'KAT_GODNOSTI'
            DataSource = dmSprav.dsEmployers
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
          end
        end
        object DBCheckBox5: TDBCheckBox
          Left = 784
          Top = 48
          Width = 41
          Height = 17
          Caption = #1084#1091#1078
          DataField = 'IS_SEX'
          DataSource = dmSprav.dsEmployers
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 19
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object RadioGroup1: TRadioGroup
        Left = 26
        Top = 360
        Width = 295
        Height = 49
        Caption = #1057#1077#1084'. '#1087#1086#1083#1086#1078#1077#1085#1080#1077
        Columns = 3
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Items.Strings = (
          #1047#1072#1084#1091#1078#1077#1084
          #1046#1077#1085#1072#1090
          #1061#1086#1083#1086#1089#1090)
        ParentFont = False
        TabOrder = 2
      end
      object GroupBox11: TGroupBox
        Left = 858
        Top = 0
        Width = 399
        Height = 185
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        object Label35: TLabel
          Left = 18
          Top = 12
          Width = 231
          Height = 15
          Caption = #1046#1080#1083#1080#1097#1085#1099#1081' '#1086#1088#1075#1072#1085' '#1087#1086' '#1084#1077#1089#1090#1091' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label36: TLabel
          Left = 18
          Top = 59
          Width = 238
          Height = 15
          Caption = #1058#1077#1088#1088#1080#1090#1086#1088#1080#1072#1083#1100#1085#1099#1081' '#1086#1088#1075#1072#1085' '#1074#1085#1091#1090#1088#1077#1085#1085#1080#1093' '#1076#1077#1083
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label38: TLabel
          Left = 146
          Top = 134
          Width = 213
          Height = 15
          Caption = #1044#1072#1090#1072' '#1089#1085#1103#1090#1080' '#1080#1083#1080' '#1087#1086#1075#1072#1096#1077#1085#1080' '#1089#1091#1076#1080#1084#1086#1089#1090#1080
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label39: TLabel
          Left = 18
          Top = 134
          Width = 93
          Height = 15
          Caption = #1044#1072#1090#1072' '#1089#1091#1076#1080#1084#1086#1089#1090#1080
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBEdit9: TDBEdit
          Left = 18
          Top = 27
          Width = 231
          Height = 23
          DataField = 'ZHIL_ORGAN'
          DataSource = dmSprav.dsEmployers
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object DBEdit10: TDBEdit
          Left = 18
          Top = 72
          Width = 231
          Height = 23
          DataField = 'MVD_ORGAN'
          DataSource = dmSprav.dsEmployers
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object DBCheckBox3: TDBCheckBox
          Left = 16
          Top = 104
          Width = 97
          Height = 17
          Caption = #1057#1091#1076#1080#1084#1086#1089#1090#1100
          DataField = 'IS_SUD'
          DataSource = dmSprav.dsEmployers
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBMemo11: TDBMemo
          Left = 112
          Top = 96
          Width = 233
          Height = 33
          DataField = 'SUD_PRIM'
          DataSource = dmSprav.dsEmployers
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object DBDateTimeEditEh11: TDBDateTimeEditEh
          Left = 152
          Top = 151
          Width = 99
          Height = 23
          DataField = 'DATE_SUD_END'
          DataSource = dmSprav.dsEmployers
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
        object DBDateTimeEditEh12: TDBDateTimeEditEh
          Left = 18
          Top = 151
          Width = 121
          Height = 23
          DataField = 'DATE_SUD_BEGIN'
          DataSource = dmSprav.dsEmployers
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
      end
      object Panel2: TPanel
        Left = 0
        Top = 584
        Width = 1299
        Height = 41
        Align = alBottom
        TabOrder = 4
        object BitBtn1: TBitBtn
          Left = 472
          Top = 8
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
        object BitBtn2: TBitBtn
          Left = 735
          Top = 8
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
      object GroupBox12: TGroupBox
        Left = 856
        Top = 424
        Width = 401
        Height = 121
        Caption = #1055#1088#1080#1077#1084' '#1085#1072' '#1074#1086#1080#1089#1085#1082#1080#1081' '#1091#1095#1077#1090' '#1080' '#1089#1085#1103#1090#1080#1077' '#1089' '#1074#1086#1080#1085#1089#1082#1086#1075#1086' '#1091#1095#1077#1090#1072
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        object Label79: TLabel
          Left = 48
          Top = 66
          Width = 27
          Height = 15
          Caption = #1057#1085#1103#1090
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label80: TLabel
          Left = 216
          Top = 34
          Width = 64
          Height = 15
          Caption = #1055#1088#1080#1073#1099#1083' '#1080#1079
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label81: TLabel
          Left = 232
          Top = 66
          Width = 42
          Height = 15
          Caption = #1059#1073#1099#1083' '#1074
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label82: TLabel
          Left = 8
          Top = 98
          Width = 130
          Height = 15
          Caption = #1053#1072#1095#1072#1083#1100#1085#1080#1082' '#1086#1090#1076#1077#1083#1077#1085#1080#1103
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object DBCheckBox4: TDBCheckBox
          Left = 8
          Top = 16
          Width = 81
          Height = 49
          Caption = #1055#1088#1080#1085#1103#1090' '#1085#1072' '#1074#1086#1080#1085#1089#1082#1080#1081' '#1091#1095#1077#1090
          DataField = 'IS_VOEN_UCHET'
          DataSource = dmSprav.dsEmployers
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
          WordWrap = True
        end
        object DBDateTimeEditEh17: TDBDateTimeEditEh
          Left = 90
          Top = 26
          Width = 121
          Height = 23
          DataField = 'DATE_DECISION_VOINSK_UCHET'
          DataSource = dmSprav.dsEmployers
          DynProps = <>
          EditButtons = <>
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Kind = dtkDateEh
          ParentFont = False
          TabOrder = 1
          Visible = True
        end
        object DBDateTimeEditEh18: TDBDateTimeEditEh
          Left = 90
          Top = 58
          Width = 119
          Height = 23
          DataField = 'DATE_DECISION_VOIN_UCHET_SNYAT'
          DataSource = dmSprav.dsEmployers
          DynProps = <>
          EditButtons = <>
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Kind = dtkDateEh
          ParentFont = False
          TabOrder = 2
          Visible = True
        end
        object DBEdit43: TDBEdit
          Left = 282
          Top = 26
          Width = 111
          Height = 23
          DataField = 'PRIBYL'
          DataSource = dmSprav.dsEmployers
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object DBEdit44: TDBEdit
          Left = 280
          Top = 59
          Width = 113
          Height = 23
          DataField = 'YBYL'
          DataSource = dmSprav.dsEmployers
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object DBEdit45: TDBEdit
          Left = 146
          Top = 91
          Width = 63
          Height = 23
          DataField = 'NACHALNIK'
          DataSource = dmSprav.dsEmployers
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
      end
      object GroupBox16: TGroupBox
        Left = 856
        Top = 264
        Width = 401
        Height = 65
        Caption = #1055#1088#1077#1073#1099#1074#1072#1085#1080#1077' '#1074' '#1084#1086#1073'. '#1083#1102#1076#1089#1082#1086#1084' '#1088#1077#1079#1077#1088#1074#1077
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        object Label75: TLabel
          Left = 90
          Top = 19
          Width = 65
          Height = 15
          Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label76: TLabel
          Left = 10
          Top = 19
          Width = 59
          Height = 15
          Caption = #1055#1086#1089#1090#1091#1087#1080#1083' '
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label77: TLabel
          Left = 242
          Top = 19
          Width = 60
          Height = 15
          Caption = #1048#1089#1082#1083#1102#1095#1077#1085
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBEdit42: TDBEdit
          Left = 90
          Top = 35
          Width = 143
          Height = 23
          DataField = 'MOB_RESERV_OSNOVANIE'
          DataSource = dmSprav.dsEmployers
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object DBDateTimeEditEh15: TDBDateTimeEditEh
          Left = 10
          Top = 34
          Width = 71
          Height = 23
          DataField = 'MOB_RESERV_DATE_BEGIN'
          DataSource = dmSprav.dsEmployers
          DynProps = <>
          EditButtons = <>
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Kind = dtkDateEh
          ParentFont = False
          TabOrder = 1
          Visible = True
        end
        object DBDateTimeEditEh16: TDBDateTimeEditEh
          Left = 242
          Top = 34
          Width = 71
          Height = 23
          DataField = 'MOB_RESERV_DATE_END'
          DataSource = dmSprav.dsEmployers
          DynProps = <>
          EditButtons = <>
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Kind = dtkDateEh
          ParentFont = False
          TabOrder = 2
          Visible = True
        end
      end
      object DBEdit46: TDBEdit
        Left = 944
        Top = 547
        Width = 313
        Height = 23
        DataField = 'DOP_SVED'
        DataSource = dmSprav.dsEmployers
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object GroupBox18: TGroupBox
        Left = 856
        Top = 336
        Width = 401
        Height = 81
        Caption = #1044#1083#1103' '#1086#1090#1095#1077#1090#1072
        Color = clGradientInactiveCaption
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clMaroon
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 8
        object Label85: TLabel
          Left = 206
          Top = 10
          Width = 43
          Height = 15
          Caption = #1056#1072#1079#1088#1103#1076
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label86: TLabel
          Left = 304
          Top = 10
          Width = 41
          Height = 15
          Caption = #1057#1086#1089#1090#1072#1074
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label87: TLabel
          Left = 14
          Top = 18
          Width = 26
          Height = 15
          Caption = #1059#1095#1105#1090
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbRazryad: TDBLookupComboboxEh
          Left = 202
          Top = 26
          Width = 95
          Height = 23
          DataField = 'ID_ANSWER_RAZRYAD'
          DataSource = dmSprav.dsEmployers
          DropDownBox.Sizable = True
          DropDownBox.SpecRow.CellsText = '---'
          DropDownBox.SpecRow.Visible = True
          EditButtons = <>
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = dmSprav.dsSPR_ANSWER_RAZRYAD
          ParentFont = False
          TabOrder = 0
          Visible = True
        end
        object dbSostav: TDBLookupComboboxEh
          Left = 304
          Top = 26
          Width = 81
          Height = 23
          DataField = 'ID_ANSWER_SOSTAV'
          DataSource = dmSprav.dsEmployers
          DropDownBox.Sizable = True
          DropDownBox.SpecRow.CellsText = '---'
          DropDownBox.SpecRow.Visible = True
          EditButtons = <>
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = dmSprav.dsSPR_ANSWER_SOSTAV
          ParentFont = False
          TabOrder = 1
          Visible = True
        end
        object cmb: TDBComboBoxEh
          Left = 10
          Top = 34
          Width = 95
          Height = 23
          DataField = 'IS_UCHET'
          DataSource = dmSprav.dsEmployers
          DynProps = <>
          DropDownBox.Sizable = True
          EditButtons = <>
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Items.Strings = (
            '---'
            #1054#1073#1097#1080#1081
            #1057#1087#1077#1094#1080#1072#1083#1100#1085#1099#1081)
          KeyItems.Strings = (
            '-1'
            '0'
            '1')
          MRUList.Items.Strings = (
            '0'
            '1'
            '2'
            '3'
            '4')
          ParentFont = False
          TabOrder = 2
          Visible = True
        end
        object gbRA_VMF: TGroupBox
          Left = 112
          Top = 8
          Width = 81
          Height = 65
          Caption = #1056#1040'/'#1042#1052#1060
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          object rbRA: TDBCheckBox
            Left = 8
            Top = 16
            Width = 41
            Height = 17
            Caption = #1056#1040
            DataField = 'IS_RA'
            DataSource = dmSprav.dsEmployers
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object rbVMF: TDBCheckBox
            Left = 8
            Top = 40
            Width = 49
            Height = 17
            Caption = #1042#1052#1060
            DataField = 'IS_VMF'
            DataSource = dmSprav.dsEmployers
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
        object DBCheckBoxEh1: TDBCheckBoxEh
          Left = 200
          Top = 56
          Width = 185
          Height = 17
          Caption = #1055#1077#1088#1074#1072#1103' '#1082#1072#1090#1077#1075#1086#1088#1080#1103' '#1079#1072#1087#1072#1089#1072
          DataField = 'IS_FIRST_KAT_ZAPAS'
          DataSource = dmSprav.dsEmployers
          DynProps = <>
          TabOrder = 4
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
    end
    object tsRodstvo: TTabSheet
      Caption = #1057#1074#1077#1076#1077#1085#1080#1103' '#1086' '#1073#1083#1080#1078#1072#1081#1096#1080#1093' '#1088#1086#1076#1089#1090#1074#1077#1085#1085#1080#1082#1072#1093' '#1075#1088#1072#1078#1076#1072#1085#1080#1085#1072
      ImageIndex = 2
      object DBGridEh2: TDBGridEh
        Left = 0
        Top = 0
        Width = 1311
        Height = 587
        Align = alClient
        AutoFitColWidths = True
        DataSource = dmSprav.dsRodstvo
        DrawMemoText = True
        DynProps = <>
        Flat = True
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        FooterParams.Color = clInfoBk
        IndicatorOptions = [gioShowRowIndicatorEh]
        ParentFont = False
        ReadOnly = True
        SumList.Active = True
        TabOrder = 0
        TitleParams.Font.Charset = RUSSIAN_CHARSET
        TitleParams.Font.Color = clNavy
        TitleParams.Font.Height = -12
        TitleParams.Font.Name = 'Arial'
        TitleParams.Font.Style = [fsBold]
        TitleParams.ParentFont = False
        TitleParams.MultiTitle = True
        Columns = <
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'NAME_RODSTVO'
            Footers = <>
            Title.Caption = #1056#1086#1076#1089#1090#1074#1086
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'FIO'
            Footers = <>
            Title.Caption = #1060#1048#1054
            Width = 163
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'DATE_BIRTH'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'ADRESS'
            Footers = <>
            Title.Caption = #1040#1076#1088#1077#1089
            Width = 121
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'PLACE_WORK'
            Footers = <>
            Title.Caption = #1052#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099'/'#1091#1095#1077#1073#1099
            Width = 112
          end
          item
            Checkboxes = True
            DynProps = <>
            EditButtons = <>
            FieldName = 'IS_SOVM'
            Footers = <>
            Title.Caption = #1055#1088#1086#1078#1080#1074#1072#1102#1090' '#1089#1086#1074#1084#1077#1089#1090#1085#1086
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object tsSverka: TTabSheet
      Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1089#1074#1077#1088#1086#1082' '#1076#1072#1085#1085#1099#1093' '#1089' '#1074#1086#1077#1085#1085#1099#1084' '#1082#1086#1084#1080#1089#1089#1072#1088#1080#1072#1090#1086#1084
      ImageIndex = 3
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 0
        Width = 1311
        Height = 587
        Align = alClient
        AutoFitColWidths = True
        DataSource = dmSprav.dsSverka
        DrawMemoText = True
        DynProps = <>
        Flat = True
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        FooterParams.Color = clInfoBk
        IndicatorOptions = [gioShowRowIndicatorEh]
        ParentFont = False
        ReadOnly = True
        SumList.Active = True
        TabOrder = 0
        TitleParams.Font.Charset = RUSSIAN_CHARSET
        TitleParams.Font.Color = clNavy
        TitleParams.Font.Height = -12
        TitleParams.Font.Name = 'Arial'
        TitleParams.Font.Style = [fsBold]
        TitleParams.ParentFont = False
        TitleParams.MultiTitle = True
        Columns = <
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'DATE_SVERKA'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072' '#1089#1074#1077#1088#1082#1080
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'RESULT'
            Footers = <>
            Title.Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1089#1074#1077#1088#1082#1080
            Width = 101
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
end
