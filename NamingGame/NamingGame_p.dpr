program NamingGame_p;

uses
  Forms,
  NamingGame_u in 'NamingGame_u.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
