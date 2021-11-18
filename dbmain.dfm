object dm1: Tdm1
  OldCreateOrder = False
  Height = 466
  Width = 548
  object dbT: TpFIBDatabase
    Connected = True
    DBName = 'WinKlad'
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'password=1'
      'user_name=SYSDBA')
    DefaultTransaction = trR1
    DefaultUpdateTransaction = trW1
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = [ddoIsDefaultDatabase, ddoStoreConnected]
    LibraryName = 'C:\WinKlad\fbclient32\fbclient.dll'
    WaitForRestoreConnect = 0
    Left = 48
    Top = 24
  end
  object trR1: TpFIBTransaction
    Active = True
    DefaultDatabase = dbT
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 120
    Top = 24
  end
  object dKart: TpFIBDataSet
    UpdateSQL.Strings = (
      '')
    DeleteSQL.Strings = (
      '')
    InsertSQL.Strings = (
      '')
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'SELECT'
      '    K.KART_ID,'
      '    K.KART_KOD,'
      '    K.KART_NAME,'
      '    K.KOL,'
      '    K.CENA,'
      '    K.CENAPROD,'
      '    K.GRP_KOD'
      '   ,K.NDS'
      '   ,K.VES1'
      '   ,K.VUPAK'
      '   ,K.GTD'
      '   ,K.ED_KOD'
      '   ,K.LAND_KOD'
      '   ,G.GRP_NAME'
      
        '   ,iif(K.CENA>0.0, round((K.CENAPROD/K.CENA-1.0)*100.0,1), 0.0)' +
        ' NAC'
      '   ,L.LAND_NAME'
      '   ,E.ED_NAME'
      'FROM'
      '  KART K'
      '    left join GRP  G on K.GRP_KOD  = G.GRP_KOD'
      '    left join LAND L on K.LAND_KOD = L.LAND_KOD'
      '    left join ED   E on K.ED_KOD   = E.ED_KOD'
      '  @@pWhere% @'
      'ORDER BY G.GRP_NAME, K.KART_NAME')
    Transaction = trKartR
    Database = dbT
    UpdateTransaction = trKartW
    DefaultFormats.NumericDisplayFormat = '0.00'
    Left = 48
    Top = 96
    object dKartKART_ID: TFIBIntegerField
      FieldName = 'KART_ID'
    end
    object dKartKART_KOD: TFIBStringField
      DisplayLabel = #1050#1086#1076' '#1090#1086#1074'.'
      FieldName = 'KART_KOD'
      Size = 7
      EmptyStrToNull = True
    end
    object dKartGRP_KOD: TFIBStringField
      DisplayLabel = #1050#1086#1076' '#1075#1088'.'
      FieldName = 'GRP_KOD'
      Size = 7
      EmptyStrToNull = True
    end
    object dKartLAND_NAME: TFIBStringField
      DisplayLabel = #1057#1090#1088#1072#1085#1072
      FieldName = 'LAND_NAME'
      Size = 50
      EmptyStrToNull = True
    end
    object dKartKART_NAME: TFIBStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074'.'
      FieldName = 'KART_NAME'
      Size = 50
      EmptyStrToNull = True
    end
    object dKartED_NAME: TFIBStringField
      DisplayLabel = #1045#1076'.'
      FieldName = 'ED_NAME'
      Size = 50
      EmptyStrToNull = True
    end
    object dKartKOL: TFIBFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'KOL'
    end
    object dKartCENA: TFIBFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1079#1072#1082
      FieldName = 'CENA'
    end
    object dKartCENAPROD: TFIBFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1087#1088#1086#1076'.'
      FieldName = 'CENAPROD'
    end
    object dKartGRP_NAME: TFIBStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072
      FieldName = 'GRP_NAME'
      Size = 50
      EmptyStrToNull = True
    end
    object dKartNAC: TFIBFloatField
      DisplayLabel = #1053#1072#1094'%'
      FieldName = 'NAC'
    end
    object dKartNDS: TFIBFloatField
      DisplayLabel = #1053#1044#1057'%'
      FieldName = 'NDS'
    end
    object dKartVES1: TFIBFloatField
      DisplayLabel = #1042#1077#1089'1'#1096#1090
      FieldName = 'VES1'
    end
    object dKartVUPAK: TFIBFloatField
      DisplayLabel = #1042' '#1091#1087#1072#1082'.'
      FieldName = 'VUPAK'
    end
    object dKartGTD: TFIBStringField
      DisplayLabel = #1043#1058#1044
      FieldName = 'GTD'
      Size = 50
      EmptyStrToNull = True
    end
    object dKartED_KOD: TFIBStringField
      DisplayLabel = #1045#1076'.'#1050#1086#1076
      FieldName = 'ED_KOD'
      Size = 7
      EmptyStrToNull = True
    end
    object dKartLAND_KOD: TFIBStringField
      DisplayLabel = #1057#1090#1088'.'#1050#1086#1076
      FieldName = 'LAND_KOD'
      Size = 7
      EmptyStrToNull = True
    end
  end
  object trKartW: TpFIBTransaction
    DefaultDatabase = dbT
    TRParams.Strings = (
      'write'
      'isc_tpb_nowait'
      'read_committed'
      'rec_version')
    TPBMode = tpbDefault
    Left = 176
    Top = 96
  end
  object trKartR: TpFIBTransaction
    Active = True
    DefaultDatabase = dbT
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 112
    Top = 96
  end
  object dGrp: TpFIBDataSet
    UpdateSQL.Strings = (
      '')
    DeleteSQL.Strings = (
      '')
    InsertSQL.Strings = (
      '')
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'with I as ('
      
        'select K.grp_kod, count(all K.grp_kod) KA,  -- '#1074#1089#1077#1075#1086' '#1074' '#1075#1088#1091#1087#1087#1077' '#1082#1072 +
        #1088#1090#1086#1095#1077#1082
      
        '  (select count(*) from Kart K1 where K1.grp_kod=K.grp_kod and K' +
        '1.kol>0) KB,  -- '#1074' '#1075#1088#1091#1087#1087#1077' '#1082#1086#1083' > 0'
      
        '  (select count(*) from Kart K3 where K3.grp_kod=K.grp_kod and K' +
        '3.kol<0) KM   -- '#1074' '#1075#1088#1091#1087#1087#1077' '#1082#1086#1083' < 0'
      'from kart K'
      'group by K.grp_kod'
      ')'
      'select G.grp_kod,G.grp_name,'
      '       cast(I.ka as integer) ka,'
      '       cast(I.kb as integer) kb,'
      '       cast(I.km as integer) km,'
      '       cast(I.ka-I.kb-I.km as integer) KN'
      'from grp G'
      '    left join I on (I.GRP_kod=G.GRP_kod)'
      'order by G.grp_kod')
    Transaction = trGrpR
    Database = dbT
    UpdateTransaction = trGrpW
    Left = 48
    Top = 152
    WaitEndMasterScroll = True
    object dGrpGRP_KOD: TFIBStringField
      DisplayLabel = #1050#1086#1076' '#1075#1088'.'
      FieldName = 'GRP_KOD'
      Size = 7
      EmptyStrToNull = True
    end
    object dGrpGRP_NAME: TFIBStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072
      FieldName = 'GRP_NAME'
      Size = 50
      EmptyStrToNull = True
    end
    object dGrpKA: TFIBIntegerField
      DisplayLabel = #1042#1089#1077#1075#1086
      FieldName = 'KA'
    end
    object a: TFIBIntegerField
      DisplayLabel = '>0'
      FieldName = 'KB'
    end
    object dGrpKN: TFIBIntegerField
      DisplayLabel = '=0'
      FieldName = 'KN'
    end
    object dGrpKM: TFIBIntegerField
      DisplayLabel = '<0'
      FieldName = 'KM'
    end
  end
  object trGrpR: TpFIBTransaction
    Active = True
    DefaultDatabase = dbT
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 112
    Top = 152
  end
  object trGrpW: TpFIBTransaction
    DefaultDatabase = dbT
    Left = 176
    Top = 152
  end
  object dsGrp: TDataSource
    DataSet = dGrp
    Left = 232
    Top = 152
  end
  object dsKart: TDataSource
    DataSet = dKart
    Left = 231
    Top = 96
  end
  object dLand: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      ' '#9'L.LAND_ID,'
      ' '#9'L.LAND_KOD,'
      ' '#9'L.LAND_NAME'
      'from LAND L'
      'order by L.LAND_NAME')
    Transaction = trR1
    Database = dbT
    UpdateTransaction = trW1
    Left = 56
    Top = 224
    object dLandLAND_ID: TFIBIntegerField
      DisplayLabel = #1050#1086#1076' '#1089#1090#1088
      FieldName = 'LAND_ID'
    end
    object dLandLAND_KOD: TFIBStringField
      DisplayLabel = #1050#1086#1076' '#1089#1090#1088'.'
      FieldName = 'LAND_KOD'
      Size = 7
      EmptyStrToNull = True
    end
    object dLandLAND_NAME: TFIBStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'LAND_NAME'
      Size = 50
      EmptyStrToNull = True
    end
  end
  object dEd: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      ' '#9'E.ED_ID,'
      ' '#9'E.ED_KOD,'
      #9' E.ED_NAME'
      'from ED E'
      'order by E.ED_NAME')
    Transaction = trR1
    Database = dbT
    UpdateTransaction = trW1
    Left = 56
    Top = 288
  end
  object q: TpFIBQuery
    Transaction = trW1
    Database = dbT
    Left = 56
    Top = 352
  end
  object trW1: TpFIBTransaction
    DefaultDatabase = dbT
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 176
    Top = 24
  end
end
