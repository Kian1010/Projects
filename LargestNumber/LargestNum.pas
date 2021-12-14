unit LargestNum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EdtNum1: TEdit;
    EdtNum3: TEdit;
    EdtNum2: TEdit;
    Label4: TLabel;
    EdtLNum: TEdit;
    BtnCalc: TButton;
    procedure BtnCalcClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BtnCalcClick(Sender: TObject);
var
Num1: Integer;
Num2:Integer;
Num3: Integer;
LNum : Integer;
begin
Num1:= StrToInt(EdtNum1.Text);
Num2:= StrToInt(EdtNum2.Text);
Num3:= StrToInt(EdtNum3.Text);

EdtLNum.Text:= IntToStr (Num3);

if(Num1 > Num2) and (Num1 > Num3) then
EdtLNum.Text:= IntToStr (Num1)
else
if Num2 > Num3 then
EdtLNum.Text:= IntToStr (Num2);



end;

end.
