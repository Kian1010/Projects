unit Register_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons,validate_u,jpeg;

type
  TFrmRegister = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    EdtName: TEdit;
    EdtPassword: TEdit;
    EdtEmail: TEdit;
    btnRegister: TButton;
    Label6: TLabel;
    Panel1: TPanel;
    BtnBack: TButton;
    Label7: TLabel;
    EdtSUrname: TEdit;
    Label8: TLabel;
    EdtVerify: TEdit;
    BitBtnRetry: TBitBtn;
    EdtUsername: TEdit;
    Label9: TLabel;
    BitBtnHelp: TBitBtn;
    Image1: TImage;
    Timer1: TTimer;
    procedure BtnBackClick(Sender: TObject);
    procedure BitBtnRetryClick(Sender: TObject);
    procedure btnRegisterClick(Sender: TObject);
    procedure BitBtnHelpClick(Sender: TObject);
    procedure ClearAll;
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    ObjValidate: Tvalidate;
  //  ArrPasswords: Array[1..100] of string,ArrUsernames
  public
    { Public declarations }
  end;

var
  FrmRegister: TFrmRegister;
  x:integer;

implementation
uses
Login_U,Help_U;

{$R *.dfm}

procedure TFrmRegister.ClearAll;
begin
EdtName.Clear;   {clears all input fields}
EdtPassword.Clear;
EdtEmail.Clear;
EdtSurname.Clear;
EdtVerify.Clear;
EdtUsername.Clear;

end;

procedure TFrmRegister.FormActivate(Sender: TObject);
begin
x:=0;  {starts counter}
end;


procedure TFrmRegister.Timer1Timer(Sender: TObject);
begin

if x >26 then  {restarts counter}
x:=0;
                                  {loads picture according to counter var}
Image1.Picture.LoadFromFile('Frame_'+ IntToStr(x) +'_delay-0.1s.jpg');
Inc(x);
end;

procedure TFrmRegister.BitBtnHelpClick(Sender: TObject);
begin
frmhelp.ShowModal; {shows help form}
end;

procedure TFrmRegister.BitBtnRetryClick(Sender: TObject);
begin

 {Prompts user if they want to clear all fields, if not then the process stops}
 if  MessageDlg('Clear all fields?', mtConfirmation, [mbYes, mbNo],0) = mrNo then
 begin
   Exit;
 end;
{Clears all fields and allows the user to retry}
ClearAll;
end;

procedure TFrmRegister.btnRegisterClick(Sender: TObject);
var
sLine,Name,Surname,Email,Username,Password,VerifyPassword: String;
Verified:Boolean;
MyFile: Textfile;
begin
Verified:= False;   //Assigns Boolean false
Name:= EdtName.Text;
Surname:= EdtSurname.Text;
Email:= EdtEmail.Text;
Username:= EdtUsername.Text;
Password:= EdtPassword.Text;
VerifyPassword:= EdtVerify.Text;   //Assigns the variables to data in the text boxes

//These Items are sent to the object class to do the validation process
ObjValidate:= Tvalidate.Create(Email,Password,VerifyPassword,Verified);
ObjValidate.Validate;
Verified:= ObjValidate.GetVerified;//Only returns the FINAL value if information is completely valid or not
ObjValidate.Free;

if NOT Verified  then
begin
Exit;
end;

 // Stores all information as a string, seperated by commas
sLine:=  Username + ',' + Password + ',' + Email + ',' +Name +','+ Surname;

AssignFile(MyFile, 'Users and passwords.txt'); //Assigns variable to text file

if FileExists('Users and passwords.txt') = False then
begin //checks if file exists, and if it does not Then the text file is created and tells the user that they are the first person to register
Rewrite(MyFile);
ShowMessage('Congratulations on being our first user! Please click again to confirm')
end
              else
              begin     //If the file exists then it is appended and all the users data for registering is stored on the text file
              Append(MyFile);
          Writeln(MyFile, sLine );
          Append(MyFile);
              end;

  CloseFile(MyFile);
  //closes the file after the program finishes using it. then shows a message to tell the user that they will be redirected automatically back to the login page

 ShowMessage('You Have Registered. Now redirecting to login page');
 ClearAll;//clears all entered data once its right.
 FrmRegister.Hide;
 FrmLogin.Show;
end;

procedure TFrmRegister.BtnBackClick(Sender: TObject);
begin
ClearAll;//clears all fields
//Allows the user to go back to the login page if they accidently clicked register
FrmRegister.Hide;
FrmLogin.Show;
end;

end.
