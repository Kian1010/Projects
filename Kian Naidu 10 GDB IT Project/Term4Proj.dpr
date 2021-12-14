program Term4Proj;

uses
  Forms,
  SweetsProj in 'SweetsProj.pas' {Form1},
  DMUnit in 'DMUnit.pas' {DataModule2: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule2, DataModule2);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
