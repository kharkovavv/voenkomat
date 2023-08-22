object fmSpisok: TfmSpisok
  Left = 156
  Top = 109
  Width = 1296
  Height = 677
  Caption = #1057#1087#1080#1089#1086#1082' '#1087#1088#1080#1079#1099#1074#1085#1080#1082#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar2: TCoolBar
    Left = 0
    Top = 0
    Width = 1280
    Height = 28
    AutoSize = True
    Bands = <
      item
        Break = False
        Control = ToolBar2
        ImageIndex = -1
        MinHeight = 24
        Width = 1276
      end>
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Images = fmMenu.ImageList2
    ParentFont = False
    object ToolBar2: TToolBar
      Left = 9
      Top = 0
      Width = 1263
      Height = 24
      AutoSize = True
      ButtonWidth = 91
      Caption = 'ToolBar1'
      Flat = True
      Images = fmMenu.ImageList2
      TabOrder = 0
      Transparent = True
      object btnFilter: TToolButton
        Left = 0
        Top = 0
        Hint = #1060#1080#1083#1100#1090#1088
        Caption = 'btnFilter'
        ImageIndex = 10
        ParentShowHint = False
        ShowHint = True
        OnClick = btnFilterClick
      end
      object btnNew: TToolButton
        Left = 91
        Top = 0
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        ImageIndex = 0
        ParentShowHint = False
        ShowHint = True
        OnClick = btnNewClick
      end
      object btnEdit: TToolButton
        Left = 182
        Top = 0
        Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
        Caption = 'btnEdit'
        ImageIndex = 16
        ParentShowHint = False
        ShowHint = True
        OnClick = btnEditClick
      end
      object btnDel: TToolButton
        Left = 273
        Top = 0
        Hint = #1059#1076#1072#1083#1080#1090#1100
        Caption = 'btnDel'
        ImageIndex = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = btnDelClick
      end
      object DBNavigator2: TDBNavigator
        Left = 364
        Top = 0
        Width = 224
        Height = 22
        DataSource = dmSprav.dsEmployers
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Flat = True
        TabOrder = 0
      end
      object ToolButton1: TToolButton
        Left = 588
        Top = 0
        Hint = #1055#1077#1095#1072#1090#1100' '#1076#1086#1075#1086#1074#1086#1088#1072
        Caption = 'tbPrint'
        ImageIndex = 8
        ParentShowHint = False
        ShowHint = True
        OnClick = ToolButton1Click
      end
    end
  end
  object plFilter: TPanel
    Left = 0
    Top = 28
    Width = 1280
    Height = 125
    Align = alTop
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label8: TLabel
      Left = 5
      Top = 53
      Width = 84
      Height = 15
      Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1060#1048#1054
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object Label9: TLabel
      Left = 204
      Top = 53
      Width = 98
      Height = 15
      Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1072#1076#1088#1077#1089#1091
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object deFio: TEdit
      Left = 5
      Top = 74
      Width = 188
      Height = 23
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object edAdress: TEdit
      Left = 204
      Top = 74
      Width = 173
      Height = 23
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 337
      Height = 41
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object rbPriz: TRadioButton
        Left = 16
        Top = 16
        Width = 113
        Height = 17
        Caption = #1087#1088#1080#1079#1099#1074#1085#1080#1082
        TabOrder = 0
      end
      object rbUchet: TRadioButton
        Left = 120
        Top = 16
        Width = 113
        Height = 17
        Caption = #1074' '#1079#1072#1087#1072#1089#1077
        TabOrder = 1
      end
      object rbAll: TRadioButton
        Left = 224
        Top = 16
        Width = 89
        Height = 17
        Caption = #1074#1089#1077
        Checked = True
        TabOrder = 2
        TabStop = True
      end
    end
  end
  object pcEmployer: TPageControl
    Left = 0
    Top = 153
    Width = 1280
    Height = 485
    ActivePage = tsEmp
    Align = alClient
    TabOrder = 2
    object tsEmp: TTabSheet
      Caption = #1057#1087#1080#1089#1086#1082' '#1087#1088#1080#1079#1099#1074#1085#1080#1082#1086#1074
      object grOrder: TDBGridEh
        Left = 0
        Top = 0
        Width = 1272
        Height = 457
        Align = alClient
        AutoFitColWidths = True
        Color = clWhite
        DataSource = dmSprav.dsEmployers
        DynProps = <>
        Flat = True
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        FooterRowCount = 1
        FooterParams.Color = clHighlightText
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
        OnDblClick = btnEditClick
        OnDrawColumnCell = grOrderDrawColumnCell
        Columns = <
          item
            DynProps = <>
            DropDownBox.SortLocal = True
            EditButtons = <>
            FieldName = 'FIO'
            Footer.ToolTips = True
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Caption = #1060#1048#1054
            Width = 63
          end
          item
            Checkboxes = True
            DynProps = <>
            DropDownBox.SortLocal = True
            EditButtons = <>
            FieldName = 'IS_PRIZYV'
            Footers = <>
            Title.Caption = #1055#1088#1080#1079#1099#1074#1085#1080#1082
            Title.TitleButton = True
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'ADRESS_REG'
            Footers = <>
            Title.Caption = #1040#1076#1088#1077#1089' ('#1087#1088#1086#1087#1080#1089#1082#1072')'
            Width = 119
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'ADRESS_FACT'
            Footers = <>
            Title.Caption = #1040#1076#1088#1077#1089' ('#1092#1072#1082#1090'.)'
            Width = 142
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'PLACE_WORK'
            Footers = <>
            Title.Caption = #1052#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099'/'#1091#1095#1077#1073#1099
            Width = 116
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
end
