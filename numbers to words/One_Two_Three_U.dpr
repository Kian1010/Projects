program One_Two_Three_U;

uses
  Forms,
  One_Two_Three in 'One_Two_Three.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
