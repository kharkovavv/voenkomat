object fmSprav: TfmSprav
  Left = 45
  Top = 104
  Width = 1292
  Height = 784
  AutoSize = True
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object pcSpr: TPageControl
    Left = 0
    Top = 28
    Width = 1276
    Height = 718
    ActivePage = tsVoenSpec
    Align = alClient
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Images = fmMenu.ImageList1
    ParentFont = False
    TabOrder = 1
    object tsVoenSpec: TTabSheet
      Caption = #1042#1086#1077#1085#1085#1086'-'#1091#1095#1077#1090#1085#1099#1077' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1080
      ImageIndex = 30
      OnShow = tsVoenSpecShow
      object GrType: TDBGridEh
        Left = 0
        Top = 0
        Width = 1268
        Height = 688
        Align = alClient
        AutoFitColWidths = True
        DataSource = dmSprav.dsVoenSpec
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
        OnDblClick = GrTypeDblClick
        Columns = <
          item
            DynProps = <>
            DropDownBox.ColumnDefValues.Title.TitleButton = True
            DropDownBox.Options = [dlgColLinesEh, dlgAutoSortMarkingEh, dlgMultiSortMarkingEh]
            DropDownBox.SortLocal = True
            EditButtons = <>
            FieldName = 'NAME'
            Footers = <>
            Title.Caption = #1058#1080#1087' '#1091#1095#1088#1077#1078#1076#1077#1085#1080#1103
            Title.TitleButton = True
            Width = 142
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object tsResidenc: TTabSheet
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1088#1077#1075#1080#1086#1085#1086#1074
      ImageIndex = 2
      TabVisible = False
      OnShow = tsResidencShow
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 0
        Width = 1268
        Height = 688
        Align = alClient
        AutoFitColWidths = True
        DataSource = dmSprav.dsResidenc
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
            FieldName = 'NAME'
            Footers = <>
            Title.Caption = #1058#1080#1087' '#1091#1095#1088#1077#1078#1076#1077#1085#1080#1103
            Title.TitleButton = True
            Title.SortIndex = 1
            Title.SortMarker = smDownEh
            Width = 142
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object tsVoen_Zvanie: TTabSheet
      Caption = #1042#1086#1080#1085#1089#1082#1080#1077' '#1079#1074#1072#1085#1080#1103' '
      ImageIndex = 2
      object DBGridEh2: TDBGridEh
        Left = 0
        Top = 0
        Width = 1268
        Height = 688
        Align = alClient
        AutoFitColWidths = True
        DataSource = dmSprav.dsVoenZvanie
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
        OnDblClick = GrTypeDblClick
        Columns = <
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'NAME'
            Footers = <>
            Title.Caption = #1042#1086#1080#1085#1089#1082#1086#1077' '#1079#1074#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 142
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object tsRodstvo: TTabSheet
      Caption = #1056#1086#1076#1089#1090#1074#1086
      ImageIndex = 3
      object DBGridEh3: TDBGridEh
        Left = 0
        Top = 0
        Width = 1268
        Height = 688
        Align = alClient
        AutoFitColWidths = True
        DataSource = dmSprav.dsSprRodstvo
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
        OnDblClick = GrTypeDblClick
        Columns = <
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'NAME'
            Footers = <>
            Title.Caption = #1056#1086#1076#1089#1090#1074#1086
            Title.TitleButton = True
            Width = 142
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  object clbr1: TCoolBar
    Left = 0
    Top = 0
    Width = 1276
    Height = 28
    AutoSize = True
    Bands = <
      item
        Break = False
        Control = tlb1
        ImageIndex = -1
        MinHeight = 24
        Width = 1272
      end>
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Images = fmMenu.ImageList2
    ParentFont = False
    object tlb1: TToolBar
      Left = 9
      Top = 0
      Width = 1259
      Height = 24
      AutoSize = True
      ButtonWidth = 91
      Caption = 'ToolBar1'
      Flat = True
      Images = fmMenu.ImageList2
      TabOrder = 0
      Transparent = True
      object dbNav: TDBNavigator
        Left = 0
        Top = 0
        Width = 220
        Height = 22
        DataSource = dmSprav.dsVoenSpec
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Flat = True
        TabOrder = 0
      end
      object btnAdd: TToolButton
        Left = 220
        Top = 0
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        ImageIndex = 0
        ParentShowHint = False
        ShowHint = True
        OnClick = btnAddClick
      end
      object btnEdit: TToolButton
        Left = 311
        Top = 0
        Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
        Caption = 'btnEdit'
        ImageIndex = 16
        ParentShowHint = False
        ShowHint = True
        OnClick = btnEditClick
      end
      object btnDel: TToolButton
        Left = 402
        Top = 0
        Hint = #1059#1076#1072#1083#1080#1090#1100
        Caption = 'btnDel'
        ImageIndex = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = btnDelClick
      end
      object lb5: TLabel
        Left = 493
        Top = 0
        Width = 4
        Height = 22
      end
    end
  end
end
