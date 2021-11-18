unit KartEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBVertGridsEh, Vcl.ExtCtrls, DBCtrlsEh, Vcl.StdCtrls, Vcl.Mask,
  FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  System.Math;

type
  TfKartEdit = class(TForm)
    paTop: TPanel;
    pa1: TPanel;
    edKart_Name: TDBEditEh;
    edCena: TDBNumberEditEh;
    edCenaProd: TDBNumberEditEh;
    edKol: TDBNumberEditEh;
    edVupak: TDBNumberEditEh;
    edVes1: TDBNumberEditEh;
    edGtd: TDBEditEh;
    edEd_kod: TDBEditEh;
    edLand_kod: TDBEditEh;
    edGrp_kod: TDBEditEh;
    edKart_kod: TDBEditEh;
    cbLand_name: TDBComboBoxEh;
    cbGrp_name: TDBComboBoxEh;
    cbEd_name: TDBComboBoxEh;
    btOk: TButton;
    btCancel: TButton;
    edNac: TDBNumberEditEh;
    edUpak: TDBNumberEditEh;
    cbNds_name: TDBComboBoxEh;
    procedure FormShow(Sender: TObject);
    procedure cbEd_nameChange(Sender: TObject);
    procedure cbGrp_nameChange(Sender: TObject);
    procedure cbLand_nameChange(Sender: TObject);
    procedure edCenaProdChange(Sender: TObject);
    procedure edVupakChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btCancelClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
  private
    okFlag: boolean;  // какой кнопкой закрыта форма
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fKartEdit: TfKartEdit;

implementation
uses dbMain,Main,AMyLib;

{$R *.dfm}

{ ------ загрузка справочника в ComboBox ------}
procedure LoadSpr(tbl:TpFIBDataSet;kod,name:string;cb:TDBComboBoxEh);
begin
  cb.KeyItems.Clear;
  cb.Items.Clear;
  tbl.First;
  while (not tbl.Eof) do
  begin
    cb.KeyItems.Add(tbl.FN(kod).AsString);
    cb.Items.Add(tbl.FN(name).AsString);
    tbl.Next;
  end;
  tbl.First;
end;

{ ---------- закрыть кнопкой ------------}
procedure TfKartEdit.btCancelClick(Sender: TObject);
begin
  fKartEdit.Close;
end;

procedure TfKartEdit.btOkClick(Sender: TObject);
begin
  fKartEdit.okFlag := true;
  fKartEdit.Close;
end;

{ ---------- код ед ------------}
procedure TfKartEdit.cbEd_nameChange(Sender: TObject);
var i: integer;
begin
  i := cbEd_name.Items.IndexOf(cbEd_name.Text);
  if (i=-1) then
    edEd_kod.Clear
  else
    edEd_kod.Text := cbEd_name.KeyItems.KeyNames[i];
end;

{ ---------- код группы ------------}
procedure TfKartEdit.cbGrp_nameChange(Sender: TObject);
var i: integer;
begin
  i := cbGrp_name.Items.IndexOf(cbGrp_name.Text);
  if (i=-1) then
    edGrp_kod.Clear
  else
    edGrp_kod.Text := cbGrp_name.KeyItems.KeyNames[i];
end;

{ ---------- код страны ------------}
procedure TfKartEdit.cbLand_nameChange(Sender: TObject);
var i: integer;
begin
  i := cbLand_name.Items.IndexOf(cbLand_name.Text);
  if (i=-1) then
    edLand_kod.Clear
  else
    edLand_kod.Text := cbLand_name.KeyItems.KeyNames[i];
end;

{ ----- расчет наценки ------}
procedure TfKartEdit.edCenaProdChange(Sender: TObject);
begin
  if (edCena.IsEmpty or (edCena.Value=0) or edCenaProd.IsEmpty) then
    edNac.Clear
  else
    edNac.Value := SimpleRoundTo((edCenaProd.Value/edCena.Value-1)*100,-1);
end;

{ ------- расчет упаковок ------------}
procedure TfKartEdit.edVupakChange(Sender: TObject);
begin
  if (edVupak.IsEmpty or (edVupak.Value=0) or edKol.IsEmpty) then
    edUpak.Clear
  else
    edUpak.Value := SimpleRoundTo(edKol.Value/edVupak.Value);
end;

{ --------  сохранить данные -------------------------------------}
procedure TfKartEdit.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  sSql: string;
  kart_id: integer;  //
begin


  case (MesYesNoCancel('Предупреждение','Документ был изменен. Сохранить?')) of
    IDYES    :  ;
    IDNO     :
      begin
        CanClose := true;
        exit;
      end;
    IDCANCEL :
      begin
        CanClose := False;
        exit;
      end;
  end;
  // добавить запись в kart
  try
    if (false) then
      kart_id := dm1.dbT.Gen_Id('GEN_KART_ID',1) // добавить
    else
      kart_id := dm1.dKart.FN('kart_id').AsInteger;  // обновить

    sSql := 'UPDATE OR INSERT INTO kart '+
            '(Kart_id,Kart_kod,Kart_Name,Kol,Cena,CenaProd,Ves1,Vupak,Gtd,Ed_kod,Land_kod,Grp_kod,nds)'+
            'VALUES '+
            '(:Kart_id,:Kart_kod,:Kart_Name,:Kol,:Cena,:CenaProd,:Ves1,:Vupak,:Gtd,:Ed_kod,:Land_kod,:Grp_kod,:nds)';

    dm1.q.SQL.Clear;
    dm1.q.SQL.Append(sSql);
    dm1.q.ParamByName('Kart_id').AsInt64 := kart_id;
    dm1.q.ParamByName('Kart_kod').AsString := edKart_kod.Text;
    dm1.q.ParamByName('Kart_Name').AsString := edKart_Name.Text;
    dm1.q.ParamByName('Gtd').AsString := edGtd.Text;
    dm1.q.ParamByName('Ed_kod').AsString := edEd_kod.Text;
    dm1.q.ParamByName('Land_kod').AsString := edLand_kod.Text;
    dm1.q.ParamByName('Grp_kod').AsString := edGrp_kod.Text;

    dm1.q.ParamByName('Kol').AsDouble := edKol.Value;
    dm1.q.ParamByName('Cena').AsDouble := edCena.Value;
    dm1.q.ParamByName('CenaProd').AsDouble := edCenaProd.Value;
    dm1.q.ParamByName('Ves1').AsDouble := edVes1.Value;
    dm1.q.ParamByName('Vupak').AsDouble := edVupak.Value;
    if cbNds_name.IsEmpty then
     dm1.q.ParamByName('Nds').AsDouble := 0.0
    else
     dm1.q.ParamByName('Nds').AsDouble := cbNds_name.Value;

    dm1.q.Transaction.StartTransaction;
    dm1.q.ExecQuery;
    dm1.q.Transaction.Commit;

    dm1.dKart.CloseOpen(false);
  except on E: Exception do
    begin
      if dm1.q.Transaction.Active then
        dm1.q.Transaction.Rollback;
       mesEr('TfKartEdit.FormCloseQuery. Ошибка. Запись не сохранена.'+sLineBreak+E.Message,false);
    end;
  end;

end;

{ --------------- загузить данные  ------------------- }
procedure TfKartEdit.FormShow(Sender: TObject);
var
  i: integer;
  ss: string;
begin
  LoadSpr(dm1.dGrp,'Grp_kod','Grp_name',fKartEdit.cbGrp_name);
  LoadSpr(dm1.dLand,'Land_kod','Land_name',fKartEdit.cbLand_name);
  LoadSpr(dm1.dEd,'Ed_kod','Ed_name',fKartEdit.cbEd_name);

  cbNds_name.Text := dm1.dKart.FN('Nds').AsString;
  cbNds_name.Items.Clear;
  cbNds_name.Items.DelimitedText := ',20,10,0';

  edKart_kod.Value := dm1.dKart.FN('Kart_kod').AsString;
  edKart_kod.MaxLength := dm1.dKart.FN('Kart_kod').Size;

  edKart_Name.Value := dm1.dKart.FN('Kart_Name').AsString;
  edKart_Name.MaxLength := dm1.dKart.FN('Kart_Name').Size;

  edKol.Value := dm1.dKart.FN('Kol').AsFloat;
  edCena.Value := dm1.dKart.FN('Cena').AsFloat;
  edCenaProd.Value := dm1.dKart.FN('CenaProd').AsFloat;
  edVes1.Value := dm1.dKart.FN('Ves1').AsFloat;
  edVupak.Value := dm1.dKart.FN('Vupak').AsFloat;

  edGtd.Value := dm1.dKart.FN('Gtd').AsString;
  edGtd.MaxLength := dm1.dKart.FN('Gtd').Size;

  // справочники  код
  edEd_kod.Value := dm1.dKart.FN('Ed_kod').AsString;
  edEd_kod.MaxLength := dm1.dKart.FN('Ed_kod').Size;

  edLand_kod.Value := dm1.dKart.FN('Land_kod').AsString;
  edLand_kod.MaxLength := dm1.dKart.FN('Land_kod').Size;

  edGrp_kod.Value := dm1.dKart.FN('Grp_kod').AsString;
  edGrp_kod.MaxLength := dm1.dKart.FN('Grp_kod').Size;

// справочники наименование
  cbLand_name.Text := dm1.dKart.FN('Land_name').AsString;
  cbEd_name.Text := dm1.dKart.FN('Ed_name').AsString;
  cbGrp_name.Text := dm1.dKart.FN('Grp_name').AsString;


// сбросить признак модифицировано
   for i:=0 to ComponentCount - 1 do
   begin
//     Components[i].ClassType
     if (Components[i] is TCustomDBEditEh) then
     begin
       TCustomDBEditEh(Components[i]).Modified := false;
     end;
   end;
   fKartEdit.okFlag := false;  // закрыто отменой


end;

end.
