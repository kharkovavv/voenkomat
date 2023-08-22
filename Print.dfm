object fmPrint: TfmPrint
  Left = 496
  Top = 286
  Width = 254
  Height = 196
  BorderIcons = [biMinimize, biMaximize]
  Caption = #1055#1077#1095#1072#1090#1100
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 106
    Width = 238
    Height = 52
    Align = alBottom
    TabOrder = 0
    object btnOk: TBitBtn
      Left = 14
      Top = 12
      Width = 98
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100
      TabOrder = 0
      OnClick = btnOkClick
      Kind = bkOK
    end
    object btnCancel: TBitBtn
      Left = 131
      Top = 12
      Width = 97
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 238
    Height = 106
    Align = alTop
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 14
      Top = 11
      Width = 214
      Height = 85
      Caption = #1042#1099#1073#1086#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object rbDog: TRadioButton
        Left = 9
        Top = 20
        Width = 113
        Height = 17
        Caption = #1044#1086#1075#1086#1074#1086#1088
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TabStop = True
      end
      object rbCalendar: TRadioButton
        Left = 9
        Top = 57
        Width = 120
        Height = 17
        Caption = #1050#1072#1083#1077#1085#1076#1072#1088#1085#1099#1081' '#1087#1083#1072#1085
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
  end
end
