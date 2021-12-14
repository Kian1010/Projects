program PokemonMatchups_p;

uses
  Forms,
  PokemonMatchups_u in 'PokemonMatchups_u.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
