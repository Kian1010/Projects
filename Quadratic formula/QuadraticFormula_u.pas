unit QuadraticFormula_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,math;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
Discrim:Real;
implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
a,b,c:Integer;
ans1,ans2:Real;
begin

A:= StrToInt(InputBox('','Enter Value A','0')  );
B:= StrToInt(InputBox('','Enter Value of B','0')) ;
C:= StrToInt(InputBox('','Enter Value Of C','0'));

Discrim:= Sqrt( Sqr(b) - (4*a*c)   )      ;

ans1:= (-b + Discrim)/2*a;

ans2:= (-b - Discrim)/2*a;

ShowMessage('The Answer is: ' + FloatToStrF(ans1,ffFixed,20,2) + sLineBreak+
'Or It Is: ' + FloatToStrF(ans2, ffFixed,20,2));

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
ShowMessage('The Discriminant is: '+ FloatToStrF(sqr(Discrim),ffFixed,20,2));
end;

end.
