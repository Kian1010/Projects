program Collectibles_p;

uses
  Forms,
  Login_U in 'Login_U.pas' {FrmLogin},
  Register_U in 'Register_U.pas' {FrmRegister},
  DM_U in 'DM_U.pas' {DataModule1: TDataModule},
  AdminPage_U in 'AdminPage_U.pas' {FrmAdmin},
  MainPage_U in 'MainPage_U.pas' {FrmMainPage},
  Help_U in 'Help_U.pas' {FrmHelp},
  Validate_u in 'Validate_u.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'QuickBid!';
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFrmRegister, FrmRegister);
  Application.CreateForm(TFrmAdmin, FrmAdmin);
  Application.CreateForm(TFrmMainPage, FrmMainPage);
  Application.CreateForm(TFrmHelp, FrmHelp);
  Application.Run;
end.
