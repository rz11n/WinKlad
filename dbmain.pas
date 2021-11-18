unit dbmain;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  FIBQuery, pFIBQuery;

type
  Tdm1 = class(TDataModule)
    dbT: TpFIBDatabase;
    trR1: TpFIBTransaction;
    dKart: TpFIBDataSet;
    trKartW: TpFIBTransaction;
    trKartR: TpFIBTransaction;
    dGrp: TpFIBDataSet;
    trGrpR: TpFIBTransaction;
    trGrpW: TpFIBTransaction;
    dsGrp: TDataSource;
    dsKart: TDataSource;
    dGrpKA: TFIBIntegerField;
    a: TFIBIntegerField;
    dGrpKM: TFIBIntegerField;
    dGrpKN: TFIBIntegerField;
    dKartKART_ID: TFIBIntegerField;
    dKartKART_KOD: TFIBStringField;
    dKartKART_NAME: TFIBStringField;
    dKartKOL: TFIBFloatField;
    dKartCENA: TFIBFloatField;
    dKartCENAPROD: TFIBFloatField;
    dKartGRP_KOD: TFIBStringField;
    dKartGRP_NAME: TFIBStringField;
    dKartNAC: TFIBFloatField;
    dKartLAND_NAME: TFIBStringField;
    dKartED_NAME: TFIBStringField;
    dGrpGRP_KOD: TFIBStringField;
    dGrpGRP_NAME: TFIBStringField;
    dLand: TpFIBDataSet;
    dEd: TpFIBDataSet;
    q: TpFIBQuery;
    trW1: TpFIBTransaction;
    dLandLAND_ID: TFIBIntegerField;
    dLandLAND_KOD: TFIBStringField;
    dLandLAND_NAME: TFIBStringField;
    dKartNDS: TFIBFloatField;
    dKartVES1: TFIBFloatField;
    dKartVUPAK: TFIBFloatField;
    dKartGTD: TFIBStringField;
    dKartED_KOD: TFIBStringField;
    dKartLAND_KOD: TFIBStringField;
    procedure dGrpAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm1: Tdm1;

implementation

{$R *.dfm}

uses Kart;

{-------- скрол спр групп товара ----------}
procedure Tdm1.dGrpAfterScroll(DataSet: TDataSet);
var
  s1: string;
  s2: string;
  pWhere: string;
  ss: string;
begin
// используется макрос FIB+
// @@<MACROS_NAME>[%<DEFAULT_VALUE>][#]@
// @@pWhere% %@

  pWhere := '';
  s1 := '';
  s2 := '';
  if not fKart.ckGrAll.Checked then
    s1 := ' K.GRP_KOD = ' +''''+ dm1.dGrp.FN('GRP_KOD').AsString +'''';

  s2 := '';
  if fKart.cbKol.Text = '>0' then
    s2 := ' K.KOL>0.0'
  else
  if fKart.cbKol.Text = '=0' then
    s2 := ' K.KOL BETWEEN -0.01 AND 0.01'
  else
  if fKart.cbKol.Text = '<0' then
    s2 := ' K.KOL<0.0';

  if (s1+s2)<>'' then
  begin
    if (s1<>'') and (s2<>'') then
      pWhere := 'WHERE ' + s1 + 'AND' + s2
    else
    begin
      if (s1<>'') then
        pWhere := 'WHERE ' + s1
      else
        pWhere := 'WHERE ' + s2;
    end;
  end;

  dm1.dKart.DisableControls;
  try
    dm1.dKart.Close;
    dm1.dKart.ParamByName('pWhere').AsString := pWhere;
    ss := dm1.dKart.SelectSQL.Text;
    dm1.dKart.Open;
  finally
    dm1.dKart.EnableControls;
  end;
end;

end.
