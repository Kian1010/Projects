unit NamingGame_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
ArrAlph: Array[1..22] of char ;
old:Integer;
implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
x,count:Integer;
begin
old:=0;
count:=0;
for x := 65 to 87 do
begin
Inc(count);

if x = 81 then
count:=Count -1
else
ArrAlph[count]:= Chr(x);

end;//for
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
x,count,new:Integer;
begin
new:=0;
Randomize;

repeat
New:= Random(22-1+1)+1;

until Old <> New;



Label2.Caption:= ArrAlph[New];

{for x := 1 to 22 do
begin
  ShowMessage(ArrAlph[x]);
end;  }
 Timer1.Interval:= 60000;

 old:= New;
end;

end.
