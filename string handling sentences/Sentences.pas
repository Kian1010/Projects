unit Sentences;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    BtnChar: TButton;
    MemDisplay: TMemo;
    EdtWord: TEdit;
    BtnLines: TButton;
    BtnWords: TButton;
    BtnBkwards: TButton;
    BtnVowel: TButton;
    BtnPall: TButton;
    BtnBkward: TButton;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure BtnCharClick(Sender: TObject);
    procedure BtnLinesClick(Sender: TObject);
    procedure BtnWordsClick(Sender: TObject);
    procedure BtnBkwardsClick(Sender: TObject);
    procedure BtnVowelClick(Sender: TObject);
    procedure BtnPallClick(Sender: TObject);
    procedure BtnBkwardClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

//EXAMPLE OF PROCEDURE
procedure NumString(N: Integer; var S: string);
var
  V: Integer;
begin
  V := Abs(N);
  S :='' ;
  repeat
    S := Chr(V mod 10 + Ord('0')) + S;
    V := V div 10;
  until V = 0;
  if N < 0 then S := '-' + S;
end;


//EXAPLE OF FUNCTION
function Max(A: array of Real; N: Integer): Real;
var
  X: Real;
  I: Integer;
begin
  X := A[0];
  for I := 1 to N - 1 do
    if X < A[I] then X := A[I];
  Max := X;
end;


procedure TForm1.BtnLinesClick(Sender: TObject);
var
St:String;
Len,X:Integer;
begin
MemDisplay.Lines.Clear;
St:= EdtWord.Text;
Len:= Length(St);
for X := 1 to Len do
  MemDisplay.Lines.Add(St[x]);
end;

procedure TForm1.BtnPallClick(Sender: TObject);
var
St,Sen:String;
X,Len:Integer;
begin
MemDisplay.Lines.Clear;
St:= EdtWord.Text;
St:= UpperCase(St);
Len:= length(St);
Sen:= '';
for X := Len downto 1 do
begin
Sen:= Sen + St[X]
end;

if St = Sen then
MemDisplay.Lines.Add('Is a Pallendium')
else
MemDisplay.Lines.Add('is not a Pallendium');
end;

procedure TForm1.BtnVowelClick(Sender: TObject);
var
st,New:String;
X,Count:Integer;
S: set of char;
begin
MemDisplay.Lines.Clear;
Count:=0;
St:= EdtWord.Text;
St:= UpperCase(St);
S:= [ 'A', 'E', 'I', 'O', 'U'];
for X:= 1 to Length(st) do
  if St[X] in S then
  count:= Succ(Count);
  MemDisplay.Lines.Add(IntToStr(Count));

end;

procedure TForm1.BtnBkwardClick(Sender: TObject);
var
St,Sen:String;
X,Len: Integer;
begin
MemDisplay.Lines.Clear;
St:= EdtWord.Text;
Len:= Length(St);
Sen:='';
for X := Len downto 1 do
begin
Sen:= Sen + St[X];
end;
MemDisplay.Lines.Add(Sen);
end;

procedure TForm1.BtnWordsClick(Sender: TObject);
Var
St:String;
Len,X,Count:Integer;
Alp: set of char;
begin
MemDisplay.Lines.Clear;
Count:=0;
St:= EdtWord.Text;
St:= UpperCase(St);
Alp:= [' ', 'A', 'B', 'C', 'D', 'E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
Len:= Length(St);
if st[len] = ' ' then
   Count:= Count-1;
if St[1] = ' ' then
Count:= Count-1;
for X := 1 to Len do
            begin
if St[X] = ' ' then
   Count := Count + 1;
if St[x] = ' ' then
      begin
       if St[x+1] = ' ' then
         Count:= Count-1;
         if St[x-1] in Alp  then
         count:= Count
         else
         Count:= Count-1;
             end;
end;
  MemDisplay.Lines.Add(IntToStr(Count+1));
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
EdtWord.Clear;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
St,Letter,ASCII:String;
X,Forward3, len, Byte:Integer;
begin
MemDisplay.Lines.Clear;
St:='';
Letter:= Lowercase(EdtWord.Text);
Len:=  Length(Letter);




for x := 1 to Len do
       Begin
       case Chr(Ord(Letter[x])) of
       'x'      : St:= St+ 'a' ;
       'y'      :  St:= St+ 'b';
       'z'      : St:= St+ 'c' ;
       ' '      : St:= St+ ' ';
       else
       St:= St+ Chr(Ord(Letter[x]) +3);
       end;

 //St:= St+ Chr(Ord(Letter[x]) +3);


      End;
 MemDisplay.Lines.Add(St);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
K:Array[1..20] of real;
begin
K[1]:= 5;
K[2]:= 10;
K[3]:= 25;
K[4]:= 20;
Showmessage(FloatToStr(Max(K,4)));
end;

procedure TForm1.BtnBkwardsClick(Sender: TObject);
Var
St,sen:String;
len,x:integer;
begin
MemDisplay.Lines.Clear;
St:= EdtWord.Text;
Len:= Length(St);
Sen:='';
for X := Len downto 1 do
begin
Sen:= Sen + St[X];
end;
MemDisplay.Lines.Add(Sen);
end;

procedure TForm1.BtnCharClick(Sender: TObject);
Var
Digits:Integer;
Char:String;
begin
MemDisplay.Lines.Clear;
Char := EdtWord.Text;
Digits:= Length(Char);
MemDisplay.Lines.Add(IntToStr(Digits));

end;

end.
