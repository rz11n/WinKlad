unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, PlatformDefaultStyleActnCtrls, ActnList, ActnMan,
  Buttons, StdCtrls;

type
  TfMain = class(TForm)
    ps1: TPanel;
    MainMenu1: TMainMenu;
    mmFile: TMenuItem;
    mmExit: TMenuItem;
    mmKart: TMenuItem;
    mmSpraw: TMenuItem;
    mmGrpEdit: TMenuItem;
    mmKartEdit: TMenuItem;
    btKart: TButton;
    procedure btKartClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

{$R *.dfm}
uses dbMain,kart;


{-----------   --------------}
procedure TfMain.btKartClick(Sender: TObject);
begin
  if not dm1.dbT.Connected then
    dm1.dbT.Open;

  dm1.dGrp.StartTransaction;
  dm1.dGrp.Open;

  dm1.dKart.StartTransaction;
  dm1.dKart.Open;

  dm1.dEd.StartTransaction;
  dm1.dEd.Open;

  dm1.dLand.StartTransaction;
  dm1.dLand.Open;

  fKart.Show;

//  dm1.dKart.Close;
//  dm1.dGrp.Close;

end;

end.
