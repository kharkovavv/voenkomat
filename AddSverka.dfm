object fmAddSverka: TfmAddSverka
  Left = 532
  Top = 184
  Width = 268
  Height = 248
  Caption = 'fmAddSverka'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 252
    Height = 161
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 9
      Top = 80
      Width = 58
      Height = 15
      Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
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
      Width = 72
      Height = 15
      Caption = #1044#1072#1090#1072' '#1089#1074#1077#1088#1082#1080
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBMemo1: TDBMemo
      Left = 9
      Top = 102
      Width = 224
      Height = 40
      DataField = 'RESULT'
      DataSource = dmSprav.dsSverka
      TabOrder = 0
    end
    object DBDateTimeEditEh3: TDBDateTimeEditEh
      Left = 10
      Top = 42
      Width = 223
      Height = 23
      DataField = 'DATE_SVERKA'
      DataSource = dmSprav.dsSverka
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
  object pnl2: TPanel
    Left = 0
    Top = 161
    Width = 252
    Height = 49
    Align = alBottom
    TabOrder = 1
    object btnOk: TBitBtn
      Left = 34
      Top = 8
      Width = 95
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Default = True
      ModalResult = 1
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
      Left = 139
      Top = 8
      Width = 94
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
  end
end
