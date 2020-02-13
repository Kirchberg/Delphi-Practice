object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1043#1088#1072#1092#1080#1095#1077#1089#1082#1080#1081' '#1088#1077#1076#1072#1082#1090#1086#1088
  ClientHeight = 286
  ClientWidth = 598
  Color = clBtnShadow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Image: TImage
    Left = 8
    Top = 8
    Width = 386
    Height = 270
    OnMouseDown = ImageMouseDown
  end
  object ExitButton: TButton
    Left = 405
    Top = 127
    Width = 185
    Height = 38
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 0
    OnClick = ExitButtonClick
  end
  object RadioGroup1: TRadioGroup
    Left = 405
    Top = 8
    Width = 185
    Height = 113
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1083#1080#1085#1080#1102':'
    Color = clWhite
    Items.Strings = (
      #1051#1080#1085#1080#1103
      #1051#1080#1085#1080#1103' '#1089#1086' '#1089#1090#1088#1077#1083#1082#1086#1081)
    ParentBackground = False
    ParentColor = False
    TabOrder = 1
  end
end
