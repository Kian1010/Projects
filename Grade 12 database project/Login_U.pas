unit Login_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, pngimage, DM_U, Buttons,ComObj,MMSystem;

type
  TFrmLogin = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edtusername: TEdit;
    EdtPassword: TEdit;
    Image1: TImage;
    Label5: TLabel;
    BtnRegister: TButton;
    Label6: TLabel;
    EdtEmail: TEdit;
    BtnSignIn: TButton;
    BtnClose: TButton;
    BitBtnHelp: TBitBtn;
    CbxPassword: TCheckBox;
    procedure BtnRegisterClick(Sender: TObject);
    procedure BtnSignInClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BitBtnHelpClick(Sender: TObject);
    procedure CbxPasswordClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ClearAllfields;
  private
    { Private declarations }
  public
    { Public declarations }
    Name,Surname:String;
  end;

var
  FrmLogin: TFrmLogin;
implementation

uses Register_U, MainPage_U,AdminPage_U,Help_U,Validate_u;

{$R *.dfm}

procedure TFrmLogin.BtnRegisterClick(Sender: TObject);
begin
//Takes the user to the registration page
FrmLogin.Hide;
FrmRegister.Show;
ClearAllFields;
end;

procedure TFrmLogin.BtnSignInClick(Sender: TObject);
var
sUsername,sEmail,sPassword,sLine:String;
MyFile: TextFile;
bAuthorized:boolean;
ArrUsername,ArrEmail,ArrPassword: Array[1..100] of string;
iCount:Integer;
begin
//Initializes all variables that have changes later on. as well as extract data
//from the edit boxes
iCount:=0;
bAuthorized:= False;
sUsername:= Edtusername.Text;
sPassword:= EdtPassword.Text;
sEmail:= EdtEmail.Text;

//If this specific username and password is entered it redirects the user to the admin page
// and ends the program from reading the text file, Saving processing power
 if (Uppercase(sUsername) = 'ADMIN' ) AND (sPassword = 'ADMIN') then
 begin
 ShowMessage('Welcome, Admin! Now directing you to the editing system');
 ClearAllfields;//clears all fields
 FrmLogin.Hide;
 FrmAdmin.Show;
 Exit;
 end; //if

 //ensures no fields are blank
if (Edtusername.Text= '') OR (EdtPassword.Text= '') OR (EdtEmail.Text = '') then
    begin
    ShowMessage('Please fill in all fields');
    Exit;
    end;

//Ensures the length of the password is longer than 4 characters. For security reasons
if Length(sPassword) < 4 then
    begin
   ShowMessage('Password too short, please re-enter');
   Exit;
    end;



 //Introduces the variable text file to the string which the data is stored
AssignFile(MyFile, 'Users and passwords.txt');

//checks if file exists, if it does not then the program ends with a user friendly message
if  FileExists('Users and passwords.txt') = False then
begin
ShowMessage('No one has registered. Please register');
Exit;
end;

//allows the file to begin from the start
Reset(MyFile);


//stores the username, password and email in arrays of the same position[count].
//then checks if any of the registered users in the array match with what the user entered.
while NOT Eof(MyFile) do
      Begin
      iCount:= iCount+1;   //increrments iCount
      Readln(MyFile, sLine); //reads the line with user details stored
      {We are only interested in the username,password and email for verification
       therefore we do not extract the other information for no reason}

      ArrUsername[iCount]:= Copy(sLine,1,Pos(',',sLine)-1 );
      Delete(sLine,1, Pos(',',sLine));

      ArrPassword[iCount]:= Copy(sLine,1, Pos(',',sLine)-1);
      Delete(sLine,1, Pos(',',sLine));

      ArrEmail[iCount]:= Copy(sLine,1, Pos(',',sLine)-1);
      Delete(sLine,1, Pos(',', sLine));

      {if what the user entered matches the info in the text file, then they
      are now authorized and will be able to go to the next form}
if (Uppercase(arrusername[icount]) = Uppercase(sUsername)) AND (Arrpassword[iCount] = sPassword) AND (Uppercase(Arremail[iCount]) = Uppercase(sEmail)) then
begin
bAuthorized:= True;
Name := Copy(sLine,1, Pos(',',sLine)-1);
Delete(sLine,1, Pos(',',sLine));
Surname:= sLine;

end;//if

end;
//closes the file after the program is done with using it
CloseFile(MyFile);

//if the boolean is true, which can only be possible if the data entered matched the array,
//then the program will welcome the user to the main page. ELSE if the data entered is incorrect
//a message tells the user that the data entered is wrong.
if bAuthorized then   {takes user to next form}
            begin
          ShowMessage('Thank you for using Quickbid! Welcome.');
          FrmLogin.Hide;
          FrmMainPage.Show;
          ClearAllfields;
            end
            else
            begin
           ShowMessage('Details incorrect. Re-enter your details or register below');
            end;
//

end;

procedure TFrmLogin.CbxPasswordClick(Sender: TObject);
begin
if CbxPassword.Checked  then  {shows and hides password typed}
begin
EdtPassword.PasswordChar:= #0;
end
else
EdtPassword.PasswordChar:= '*';

end;



procedure TFrmLogin.ClearAllfields;
begin
Edtusername.Clear;
 EdtPassword.Clear;
 EdtEmail.Clear;
 CbxPassword.Checked:= False;
end;

procedure TFrmLogin.FormActivate(Sender: TObject);
begin
if waveOutGetNumDevs = 0 then
    begin
    Showmessage('Sound Not Detected! Our help uses voice recognition')
    end;
end;

procedure TFrmLogin.BitBtnHelpClick(Sender: TObject);
begin
FrmHelp.ShowModal;  {help form}
end;

procedure TFrmLogin.BtnCloseClick(Sender: TObject);
begin
{ User friendly message for the teacher viewing my project. }

if  MessageDlg('Are you sure you want to exit?', mtConfirmation, [mbYes, mbNo],0) = mrYes then
begin
voice:= CreateOleObject('SAPI.SpVoice');

if waveOutGetNumDevs <> 0 then    {checks if output audio devices are connected}
    begin
    Voice.voice:= Voice.getVoices.Item(1);
voice.Speak('Thank You for Viewing the project done by Kian Naidu, Have a good day');
    end;

ShowMessage('Thank You for Viewing the project done by Kian Naidu, Have a good day');
close;
end;

end;

end.
