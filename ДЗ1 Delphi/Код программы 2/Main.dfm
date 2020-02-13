object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = #1050#1086#1083#1077#1073#1072#1085#1080#1077
  ClientHeight = 394
  ClientWidth = 645
  Color = clGrayText
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image: TImage
    Left = 8
    Top = 8
    Width = 629
    Height = 329
  end
  object EndButton: TButton
    Left = 152
    Top = 343
    Width = 337
    Height = 43
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 0
    OnClick = EndButtonClick
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 296
    Top = 152
  end
end
