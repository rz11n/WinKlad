unit Kart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  MemTableDataEh, Db, MemTableEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  ExtCtrls, StdCtrls, DBCtrlsEh, Mask,
  DBGridEhImpExp,  PropStorageEh, PropFilerEh, Vcl.Buttons;  // импорт экспорт

type
  TfKart = class(TForm)
    pa1: TPanel;
    pa2: TPanel;
    Splitter1: TSplitter;
    paR: TPanel;
    dgGrp: TDBGridEh;
    dgKart: TDBGridEh;
    pak: TPanel;
    laKart: TLabel;
    paG: TPanel;
    laGr: TLabel;
    ckGrAll: TDBCheckBoxEh;
    cbKol: TDBComboBoxEh;
    btExcel: TButton;
    sd1: TSaveDialog;
    memGrp: TMemTableEh;
    dsMGrp: TDataSource;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    procedure cbKolChange(Sender: TObject);
    procedure btExcelClick(Sender: TObject);
    procedure dgKartDblClick(Sender: TObject);
    procedure memGrpAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fKart: TfKart;

implementation

{$R *.dfm}
uses dbmain, AMyLib, KartEdit;

{----------------- Экспорт в Excel  -------------------------------}
procedure TfKart.btExcelClick(Sender: TObject);
var
  Path: string;
begin
  try
    GetDir(0,Path);
    sd1.FileName := 'Карточки учето товара';
    sd1.DefaultExt := 'xlsx';
    sd1.Filter := 'Все файлы|*.*|Excel|*.xlsx';
    sd1.InitialDir := path;
    if sd1.Execute then
  //   SaveDBGridEhToExportFile(TDBGridEhExportAsText,dgUsr,sd1.FileName,true);
     SaveDBGridEhToExportFile(TDBGridEhExportAsOLEXLS,dgKart,sd1.FileName,true);    // нужен Excel
  //   SaveDBGridEhToExportFile(TDBGridEhExportAsXMLSpreadsheet ,dgKart,sd1.FileName,true); файл не откр
  //   SaveDBGridEhToExportFile(ExportDBGridEhToXlsMemFile ,dgKart,sd1.FileName,true);
  except on E: Exception do
    begin
      mesEr('TfKart.btExcelClick: Ошибка экспорта в Excel '+E.Message);
    end;
  end;
end;

{-------------------- фильтр по количеству ----------------------------}
procedure TfKart.cbKolChange(Sender: TObject);
begin
  dm1.dGrpAfterScroll(dm1.dGrp)
end;

{--------------------- редактирование карточки---------------------------------}
procedure TfKart.dgKartDblClick(Sender: TObject);
begin
  fKartEdit.Show;
end;

procedure TfKart.memGrpAfterScroll(DataSet: TDataSet);
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
    s1 := ' K.GRP_KOD = ' +''''+ memGrp.FieldByName('GRP_KOD').AsString +'''';

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
