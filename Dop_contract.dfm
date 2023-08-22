object fmDop_contract: TfmDop_contract
  Left = 172
  Top = 193
  Width = 1132
  Height = 674
  Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1089#1086#1075#1083#1072#1096#1077#1085#1080#1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1116
    Height = 119
    Align = alTop
    TabOrder = 0
    object Label3: TLabel
      Left = 6
      Top = 5
      Width = 83
      Height = 15
      Caption = #1056#1072#1073#1086#1090#1086#1076#1072#1090#1077#1083#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 15
      Top = 39
      Width = 158
      Height = 15
      Caption = #1054#1073#1088#1072#1079#1086#1074#1072#1090#1077#1083#1100#1085#1099#1081' '#1087#1072#1088#1090#1085#1077#1088
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBMemo1: TDBMemo
      Left = 15
      Top = 57
      Width = 268
      Height = 51
      DataField = 'NAME'
      DataSource = dmSprav.dsEmployers
      Enabled = False
      TabOrder = 0
    end
    object CoolBar2: TCoolBar
      Left = 1
      Top = 1
      Width = 1114
      Height = 28
      AutoSize = True
      Bands = <
        item
          Break = False
          Control = ToolBar1
          ImageIndex = -1
          MinHeight = 24
          Width = 1110
        end>
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Images = fmMenu.ImageList2
      ParentFont = False
      object ToolBar1: TToolBar
        Left = 9
        Top = 0
        Width = 1097
        Height = 24
        AutoSize = True
        ButtonWidth = 91
        Caption = 'ToolBar1'
        Flat = True
        Images = fmMenu.ImageList2
        TabOrder = 0
        Transparent = True
        object tbAdd: TToolButton
          Left = 0
          Top = 0
          Hint = #1044#1086#1073#1072#1074#1080#1090#1100
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100
          ImageIndex = 0
          ParentShowHint = False
          ShowHint = True
          OnClick = btnNewClick
        end
        object tbEdit: TToolButton
          Left = 91
          Top = 0
          Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
          Caption = 'btnEdit'
          ImageIndex = 16
          ParentShowHint = False
          ShowHint = True
          OnClick = btnEditClick
        end
        object tbDelete: TToolButton
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
          Width = 224
          Height = 22
          DataSource = dmSprav.dsDopContract
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          TabOrder = 0
        end
        object ToolButton5: TToolButton
          Left = 497
          Top = 0
          Hint = #1055#1077#1095#1072#1090#1100' '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086#1075#1086' '#1089#1086#1075#1083#1072#1096#1077#1085#1080#1103
          Caption = 'tbPrint'
          ImageIndex = 8
          ParentShowHint = False
          ShowHint = True
          OnClick = ToolButton5Click
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 119
    Width = 1116
    Height = 517
    Align = alClient
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 1114
      Height = 515
      Align = alClient
      AutoFitColWidths = True
      Color = clWhite
      DataSource = dmSprav.dsDopContract
      DynProps = <>
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FooterRowCount = 1
      FooterParams.Color = clMenu
      GridLineParams.VertEmptySpaceStyle = dessNonEh
      IndicatorOptions = [gioShowRowIndicatorEh]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghDialogFind, dghColumnResize, dghColumnMove]
      ParentFont = False
      ReadOnly = True
      SumList.Active = True
      TabOrder = 0
      TitleParams.Font.Charset = DEFAULT_CHARSET
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
          FieldName = 'NUMBER_DOP_CONTRACT'
          Footer.Value = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
          Footer.ValueType = fvtStaticText
          Footers = <>
          Title.Caption = #1053#1086#1084#1077#1088' '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086#1075#1086' '#1089#1086#1075#1083#1072#1096#1077#1085#1080#1103
          Title.TitleButton = True
          Width = 83
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'DATE_DOP_CONTRACT'
          Footer.ValueType = fvtCount
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086#1075#1086' '#1089#1086#1075#1083#1072#1096#1077#1085#1080#1103
          Title.TitleButton = True
          Width = 115
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'SUMM'
          Footers = <>
          Title.Caption = #1057#1091#1084#1084#1072' '#1086#1087#1083#1072#1090#1099' '#1087#1088#1072#1082#1090#1080#1082#1080
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'NUMBER_PAY'
          Footers = <>
          Title.Caption = #1053#1086#1084#1077#1088' '#1087#1083#1072#1090#1077#1078#1085#1086#1075#1086' '#1087#1086#1088#1091#1095#1077#1085#1080#1103
          Width = 83
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'DATE_PAY'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1087#1083#1072#1090#1077#1078#1085#1086#1075#1086' '#1087#1086#1088#1091#1095#1077#1085#1080#1103
          Width = 81
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'NAME_FACULTY'
          Footers = <>
          Title.Caption = #1054#1087#1083#1072#1090#1080#1074#1096#1080#1081' '#1092#1072#1082#1091#1083#1100#1090#1077#1090' '
          Title.TitleButton = True
          Width = 90
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'DATE_END_DOP_CONTRACT'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1076#1086#1087'. '#1089#1086#1075#1083#1072#1096#1077#1085#1080#1103
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'DATE_AKT'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1072#1082#1090#1072' '#1074#1099#1087#1086#1083#1085#1077#1085#1085#1099#1093' '#1088#1072#1073#1086#1090
          Width = 89
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
end
