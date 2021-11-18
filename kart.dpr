program kart;

uses
  Forms,
  main in 'main.pas' {fMain},
  dbmain in 'dbmain.pas' {dm1: TDataModule},
  Kart in 'Kart.pas' {fKart},
  KartEdit in 'KartEdit.pas' {fKartEdit};

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
