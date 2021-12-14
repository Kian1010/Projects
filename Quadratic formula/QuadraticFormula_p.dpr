program QuadraticFormula_p;

uses
  Forms,
  QuadraticFormula_u in 'QuadraticFormula_u.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
