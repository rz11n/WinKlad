object fMain: TfMain
  Left = 0
  Top = 0
  Caption = 'fMain'
  ClientHeight = 383
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object ps1: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 41
    Align = alTop
    TabOrder = 0
    object btKart: TButton
      Left = 24
      Top = 9
      Width = 75
      Height = 25
      Caption = #1050#1072#1088#1090#1086#1095#1082#1080
      TabOrder = 0
      OnClick = btKartClick
    end
  end
  object MainMenu1: TMainMenu
    Left = 16
    Top = 48
    object mmFile: TMenuItem
      Caption = #1060#1072#1081#1083
      object mmExit: TMenuItem
        Caption = #1042#1099#1093#1086#1076
      end
    end
    object mmKart: TMenuItem
      Caption = #1050#1072#1088#1090#1086#1090#1077#1082#1072
      object mmKartEdit: TMenuItem
        Caption = #1050#1072#1088#1090#1086#1095#1082#1080
      end
    end
    object mmSpraw: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      object mmGrpEdit: TMenuItem
        Caption = #1043#1088#1091#1087#1087#1099' '#1090#1086#1074#1072#1088#1072
      end
    end
  end
end
