object fmAnswer: TfmAnswer
  Left = 207
  Top = 23
  Width = 1086
  Height = 717
  Caption = 'fmAnswer'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 785
    Height = 678
    Align = alClient
    TabOrder = 0
    object grdReestr: TDBGridEh
      Left = 1
      Top = 26
      Width = 783
      Height = 651
      Align = alClient
      AutoFitColWidths = True
      Color = clBtnFace
      DataSource = dmAnswer.dsOtchet
      DynProps = <>
      Flat = True
      FooterRowCount = 1
      IndicatorOptions = [gioShowRowIndicatorEh]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
      ReadOnly = True
      RowSizingAllowed = True
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
          FieldName = 'RAZRYAD'
          Footers = <>
          Title.Caption = #1056#1072#1079#1088#1103#1076
          Width = 98
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'SOSTAV'
          Footers = <>
          Title.Caption = #1057#1086#1089#1090#1072#1074
          Width = 81
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'KOL_RA_ALL'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1042#1057#1045#1043#1054'|'#1056#1040
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'KOL_VMF_ALL'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1042#1057#1045#1043#1054'|'#1042#1052#1060
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'KOL_ALL'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1042#1057#1045#1043#1054'|'#1056#1040'+'#1042#1052#1060
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'KOL_RA_O'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1042' '#1090'.'#1095'. '#1085#1072' '#1086#1073#1097#1077#1084' '#1091#1095#1077#1090#1077'|'#1056#1040
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'KOL_VMF_O'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1042' '#1090'.'#1095'. '#1085#1072' '#1086#1073#1097#1077#1084' '#1091#1095#1077#1090#1077'|'#1042#1052#1060
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'KOL_ALL_O'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1042' '#1090'.'#1095'. '#1085#1072' '#1086#1073#1097#1077#1084' '#1091#1095#1077#1090#1077'|'#1042#1089#1077#1075#1086
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'KOL_RA_S'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1042' '#1090'.'#1095'. '#1085#1072' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1084' '#1091#1095#1077#1090#1077'|'#1056#1040
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'KOL_VMF_S'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1042' '#1090'.'#1095'. '#1085#1072' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1084' '#1091#1095#1077#1090#1077'|'#1042#1052#1060
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'KOL_ALL_S'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1042' '#1090'.'#1095'. '#1085#1072' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1084' '#1091#1095#1077#1090#1077'|'#1042#1089#1077#1075#1086
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object ToolBar2: TToolBar
      Left = 1
      Top = 1
      Width = 783
      Height = 25
      AutoSize = True
      ButtonHeight = 23
      ButtonWidth = 91
      Caption = 'ToolBar1'
      Flat = True
      Images = fmMenu.ImageList2
      TabOrder = 1
      Transparent = True
      object btnFilter: TToolButton
        Left = 0
        Top = 0
        Hint = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1089#1087#1080#1089#1086#1082
        Caption = 'btnFilter'
        ImageIndex = 10
        ParentShowHint = False
        ShowHint = True
        OnClick = btnFilterClick
      end
      object DBNavigator2: TDBNavigator
        Left = 91
        Top = 0
        Width = 224
        Height = 23
        DataSource = dmSprav.dsEmployers
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Flat = True
        TabOrder = 0
      end
      object btnAmswer: TToolButton
        Left = 315
        Top = 0
        Hint = #1054#1090#1095#1077#1090#1099
        Caption = 'btnAmswer'
        ImageIndex = 8
        ParentShowHint = False
        ShowHint = True
        OnClick = btnAmswerClick
      end
    end
  end
  object plFilter: TPanel
    Left = 785
    Top = 0
    Width = 285
    Height = 678
    Align = alRight
    TabOrder = 1
    object grpWorkParams: TGroupBox
      Left = 1
      Top = 1
      Width = 283
      Height = 676
      Align = alClient
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1086#1090#1095#1077#1090#1072
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object rgReportType: TRadioGroup
        Left = 8
        Top = 30
        Width = 264
        Height = 43
        Caption = #1054#1090#1095#1077#1090
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ItemIndex = 0
        Items.Strings = (
          #1061#1072#1088'-'#1082#1072' '#1074#1086#1077#1085#1085#1086'-'#1091#1095#1077#1090#1085#1099#1093' '#1087#1088#1080#1079#1085#1072#1082#1086#1074' '#1075#1088#1072#1078#1076#1072#1085', '#1087#1088#1077#1073#1099#1074#1072#1102#1097#1080#1093' '#1074' '#1079#1072#1087#1072#1089#1077)
        ParentFont = False
        TabOrder = 0
      end
      object BitBtn1: TBitBtn
        Left = 8
        Top = 88
        Width = 257
        Height = 25
        Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' 1 '#1082#1072#1090#1077#1075#1086#1088#1080#1102' '#1079#1072#1087#1072#1089#1072
        TabOrder = 1
        OnClick = BitBtn1Click
      end
    end
  end
end
