program Test1;

uses
  Forms,
  dbmain in 'dbmain.pas' {dm1: TDataModule},
  main in 'main.pas' {fMain},
  Kart in 'Kart.pas' {fKart},
  KartEdit in 'KartEdit.pas' {fKartEdit},
  AMyLib in 'AMyLib.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdm1, dm1);
  Application.CreateForm(TfMain, fMain);
  Application.CreateForm(TfKart, fKart);
  Application.CreateForm(TfKartEdit, fKartEdit);
  Application.Run;
end.
