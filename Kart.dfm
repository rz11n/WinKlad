object fKart: TfKart
  Left = 0
  Top = 0
  Caption = 'fKart'
  ClientHeight = 565
  ClientWidth = 1133
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object Splitter1: TSplitter
    Left = 369
    Top = 41
    Width = 1
    Height = 524
    ExplicitLeft = 137
    ExplicitHeight = 252
  end
  object pa1: TPanel
    Left = 0
    Top = 0
    Width = 1133
    Height = 41
    Align = alTop
    TabOrder = 0
  end
  object pa2: TPanel
    Left = 0
    Top = 41
    Width = 369
    Height = 524
    Align = alLeft
    TabOrder = 1
    object dgGrp: TDBGridEh
      Left = 1
      Top = 41
      Width = 367
      Height = 482
      Align = alClient
      DataSource = dsMGrp
      DynProps = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      HorzScrollBar.ExtraPanel.NavigatorButtons = [nbFirstEh, nbPriorEh, nbNextEh, nbLastEh]
      HorzScrollBar.ExtraPanel.Visible = True
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghExtendVertLines]
      ParentFont = False
      SearchPanel.Enabled = True
      SearchPanel.Location = splHorzScrollBarExtraPanelEh
      TabOrder = 0
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'GRP_KOD'
          Footers = <>
          Width = 46
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'GRP_NAME'
          Footers = <>
          Width = 125
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'KA'
          Footers = <>
          Width = 43
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'KB'
          Footers = <>
          Title.Alignment = taCenter
          Width = 38
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'KN'
          Footers = <>
          Title.Alignment = taCenter
          Width = 27
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'KM'
          Footers = <>
          Title.Alignment = taCenter
          Width = 33
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object paG: TPanel
      Left = 1
      Top = 1
      Width = 367
      Height = 40
      Align = alTop
      TabOrder = 1
      object laGr: TLabel
        Left = 16
        Top = 5
        Width = 122
        Height = 16
        Caption = #1057#1087#1080#1089#1086#1082' '#1075#1088#1091#1087#1087' '#1090#1086#1074#1072#1088#1072
      end
    end
  end
  object paR: TPanel
    Left = 370
    Top = 41
    Width = 763
    Height = 524
    Align = alClient
    TabOrder = 2
    object dgKart: TDBGridEh
      Left = 1
      Top = 41
      Width = 761
      Height = 482
      Align = alClient
      DataSource = dm1.dsKart
      DynProps = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      HorzScrollBar.ExtraPanel.NavigatorButtons = [nbFirstEh, nbPriorEh, nbNextEh, nbLastEh, nbDeleteEh, nbRefreshEh]
      HorzScrollBar.ExtraPanel.Visible = True
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      SearchPanel.Enabled = True
      SearchPanel.Location = splHorzScrollBarExtraPanelEh
      TabOrder = 0
      OnDblClick = dgKartDblClick
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'KART_KOD'
          Footers = <>
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'KART_NAME'
          Footers = <>
          Width = 200
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'GRP_KOD'
          Footers = <>
          Width = 47
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'GRP_NAME'
          Footers = <>
          Width = 70
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ED_NAME'
          Footers = <>
          Width = 43
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'KOL'
          Footers = <>
          Width = 53
        end
        item
          CellButtons = <>
          DisplayFormat = '0.00'
          DynProps = <>
          EditButtons = <>
          FieldName = 'CENA'
          Footers = <>
        end
        item
          CellButtons = <>
          DisplayFormat = '0.00'
          DynProps = <>
          EditButtons = <>
          FieldName = 'CENAPROD'
          Footers = <>
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NAC'
          Footers = <>
          Width = 46
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'LAND_NAME'
          Footers = <>
          Width = 54
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NDS'
          Footers = <>
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object pak: TPanel
      Left = 1
      Top = 1
      Width = 761
      Height = 40
      Align = alTop
      TabOrder = 1
      object laKart: TLabel
        Left = 3
        Top = 2
        Width = 180
        Height = 16
        Caption = #1057#1087#1080#1089#1086#1082' '#1082#1072#1088#1090#1086#1095#1077#1082' '#1091#1095#1077#1090#1072' '#1090#1086#1074#1072#1088#1072
      end
      object SpeedButton1: TSpeedButton
        Left = 200
        Top = 5
        Width = 23
        Height = 22
      end
      object SpeedButton2: TSpeedButton
        Left = 229
        Top = 5
        Width = 23
        Height = 22
      end
      object SpeedButton3: TSpeedButton
        Left = 258
        Top = 5
        Width = 23
        Height = 22
      end
      object ckGrAll: TDBCheckBoxEh
        Left = 5
        Top = 17
        Width = 65
        Height = 17
        Hint = #1041#1077#1079' '#1075#1088#1091#1087#1087#1080#1088#1086#1074#1082#1080
        Caption = #1041#1077#1079' '#1075#1088'.'
        DynProps = <>
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = cbKolChange
      end
      object cbKol: TDBComboBoxEh
        Left = 452
        Top = 5
        Width = 65
        Height = 24
        Hint = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1091
        ControlLabel.Width = 45
        ControlLabel.Height = 16
        ControlLabel.Caption = #1050#1086#1083'-'#1074#1086':'
        ControlLabel.ParentShowHint = False
        ControlLabel.ShowHint = True
        ControlLabel.Visible = True
        ControlLabelLocation.Spacing = 5
        ControlLabelLocation.Position = lpLeftTextBaselineEh
        DynProps = <>
        EditButtons = <>
        Items.Strings = (
          #1042#1089#1077
          '>0'
          '<0'
          '=0')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Text = #1042#1089#1077
        Visible = True
        OnChange = cbKolChange
      end
      object btExcel: TButton
        Left = 544
        Top = 4
        Width = 75
        Height = 25
        Hint = #1069#1082#1089#1087#1086#1088#1090' '#1082#1072#1088#1090#1086#1095#1077#1082' '#1091#1095#1077#1090#1072' '#1090#1086#1074#1072#1088#1072' '#1074' Excel'
        Caption = 'Excel'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btExcelClick
      end
    end
  end
  object sd1: TSaveDialog
    Left = 995
    Top = 42
  end
  object memGrp: TMemTableEh
    Active = True
    FieldDefs = <
      item
        Name = 'GRP_KOD'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'GRP_NAME'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'KA'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'KB'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'KN'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'KM'
        DataType = ftInteger
        Precision = 15
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterScroll = memGrpAfterScroll
    Left = 248
    Top = 449
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object GRP_KOD: TMTStringDataFieldEh
          FieldName = 'GRP_KOD'
          StringDataType = fdtStringEh
          DisplayLabel = #1050#1086#1076' '#1075#1088'.'
          DisplayWidth = 7
          Size = 7
          Transliterate = True
        end
        object GRP_NAME: TMTStringDataFieldEh
          FieldName = 'GRP_NAME'
          StringDataType = fdtStringEh
          DisplayLabel = #1043#1088#1091#1087#1087#1072
          DisplayWidth = 50
          Size = 50
          Transliterate = True
        end
        object KA: TMTNumericDataFieldEh
          FieldName = 'KA'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = #1042#1089#1077#1075#1086
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object KB: TMTNumericDataFieldEh
          FieldName = 'KB'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = '>0'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object KN: TMTNumericDataFieldEh
          FieldName = 'KN'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = '=0'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object KM: TMTNumericDataFieldEh
          FieldName = 'KM'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = '<0'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
      end
      object RecordsList: TRecordsListEh
        Data = (
          (
            '001'
            #1052#1086#1089#1082#1074#1072
            49
            47
            1
            1)
          (
            '002'
            #1062#1080#1082#1086#1088#1080#1103
            53
            52
            1
            0)
          (
            '003'
            #1055#1088#1077#1076#1087#1086#1088#1090#1086#1074#1099#1081
            39
            21
            18
            0)
          (
            '004'
            #1041#1072#1082#1072#1083#1077#1103
            141
            90
            48
            3)
          (
            '005'
            #1056#1091#1089#1089#1082#1080#1081' '#1087#1088#1086#1076#1091#1082#1090
            16
            16
            0
            0)
          (
            '006'
            #1042#1077#1089#1086#1074#1086#1081' '#1090#1086#1074#1072#1088
            117
            9
            105
            3)
          (
            '007'
            #1056#1072#1089#1087#1072#1082
            9
            9
            0
            0)
          (
            '008'
            #1057#1091#1093#1086#1092#1088#1091#1082#1090#1099
            39
            29
            8
            2)
          (
            '009'
            #1045#1074#1088#1086#1087#1077#1082
            30
            28
            1
            1)
          (
            '01'
            #1042#1077#1075#1077#1090#1072
            7
            6
            1
            0)
          (
            '010'
            #1057#1086#1083#1100
            17
            9
            3
            5)
          (
            '011'
            #1052#1072#1082#1072#1088#1086#1085#1099
            49
            38
            4
            7)
          (
            '012'
            #1043#1088#1077#1094#1080#1103
            61
            48
            13
            0)
          (
            '019'
            #1043#1086#1088#1083#1080#1085#1082#1072
            3
            3
            0
            0)
          (
            '12'
            #1050#1091#1085#1094#1077#1074#1086
            39
            28
            7
            4)
          (
            '13'
            #1050#1088#1091#1087#1099
            24
            21
            3
            0)
          (
            '14'
            #1055#1056#1054#1063#1045#1045
            263
            1
            261
            1)
          (
            '15'
            #1050#1086#1085#1089#1077#1088#1074#1072#1094#1080#1103
            218
            43
            175
            0)
          (
            '16'
            #1061#1072#1074#1080#1072#1088
            35
            9
            26
            0)
          (
            '17'
            #1052#1040#1043#1043#1048
            54
            51
            3
            0)
          (
            '18'
            #1057#1086#1091#1089#1072
            34
            26
            6
            2)
          (
            '19'
            #1058#1045#1056#1045#1047#1040'-'#1055#1040#1050
            9
            3
            6
            0)
          (
            '20'
            #1044#1046#1045#1052
            24
            21
            3
            0)
          (
            '21'
            #1051#1045#1053
            13
            10
            3
            0)
          (
            '22'
            #1050#1059#1051#1048#1053#1040#1056
            34
            24
            9
            1)
          (
            '23'
            #1050#1048#1058#1040#1049
            28
            16
            12
            0)
          (
            '24'
            #1055#1056#1048#1055#1056#1040#1042#1050#1040
            51
            47
            3
            1)
          (
            '25'
            #1053#1054#1042#1054#1057#1048#1041#1048#1056#1057#1050
            96
            83
            12
            1)
          (
            '26'
            #1040#1043#1056#1054#1048#1052#1055#1054#1056#1058
            6
            6
            0
            0)
          (
            '27'
            'HoReCa'
            97
            82
            14
            1)
          (
            '28'
            #1050#1053#1054#1056#1056
            14
            13
            1
            0)
          (
            '29'
            #1062#1072#1088#1089#1082#1072#1103' '#1055#1088#1080#1087#1088#1072#1074#1072
            24
            24
            0
            0)
          (
            '30'
            #1057#1040#1053#1048#1071
            26
            19
            6
            1)
          (
            '32'
            #1062#1048#1050#1054#1056#1048#1049
            52
            43
            9
            0)
          (
            '33'
            #1058#1048#1040#1042#1048#1058
            15
            9
            6
            0)
          (
            '35'
            #1040#1076#1077#1075#1077#1081#1089#1082#1072#1103' '#1057#1086#1083#1100
            4
            3
            0
            1)
          (
            '36'
            #1055#1040#1057#1061#1040
            88
            64
            18
            6)
          (
            '37'
            #1053#1040#1055#1048#1058#1050#1048
            51
            43
            8
            0)
          (
            '38'
            #1055#1040#1064#1058#1045#1058#1067
            16
            0
            16
            0)
          (
            '39'
            #1055#1056#1054#1050#1057#1048#1052#1040
            104
            86
            17
            1)
          (
            '40'
            #1040#1076#1084#1080#1088#1072#1083
            13
            8
            5
            0)
          (
            '41'
            #1052#1054#1049' '#1055#1056#1054#1044#1059#1050#1058
            28
            0
            28
            0)
          (
            '42'
            #1042#1086#1083#1096#1077#1073#1085#1086#1077' '#1044#1077#1088#1077#1074#1086
            115
            70
            45
            0)
          (
            '43'
            #1043#1072#1083#1080#1085#1072' '#1041#1083#1072#1085#1082#1072
            7
            5
            2
            0)
          (
            '45'
            #1051#1040#1042#1050#1040' '#1055#1056#1071#1053#1054#1057#1058#1045#1049
            38
            15
            23
            0)
          (
            '46'
            #1041#1072#1089#1090#1080#1086#1085
            15
            12
            3
            0)
          (
            '47'
            #1057#1090#1077#1073#1077#1083#1100' '#1041#1072#1084#1073#1091#1082#1072
            20
            0
            20
            0)
          (
            '50'
            #1052#1072#1075#1077#1090#1072
            26
            0
            26
            0)
          (
            '52'
            #1040#1083#1077#1074#1072
            9
            9
            0
            0)
          (
            '53'
            #1040#1079#1077#1088#1095#1072#1081
            17
            0
            17
            0)
          (
            '54'
            #1041#1055
            56
            11
            45
            0)
          (
            '99'
            '--'
            51
            0
            0
            51))
      end
    end
  end
  object dsMGrp: TDataSource
    DataSet = memGrp
    Left = 168
    Top = 449
  end
end
