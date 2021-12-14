unit Mathwork;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    RedOutput: TRichEdit;
    PnlDescription: TPanel;
    BtBtnReset: TBitBtn;
    BtBtnClose: TBitBtn;
    BtnCalc: TButton;
    BtnLarge: TButton;
    Label1: TLabel;
    EdtNumber: TEdit;
    procedure BtBtnResetClick(Sender: TObject);
    procedure BtnCalcClick(Sender: TObject);
    procedure BtnLargeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
   Num:Integer;
implementation

{$R *.dfm}

procedure TForm1.BtBtnResetClick(Sender: TObject);
Var
Sp: String;
begin
RedOutput.Lines.Clear;
Sp:= '                    ';
RedOutput.Lines.Add('Integer Value' + Sp + 'Even Or Odd' + Sp + 'No Of Digits' + Sp+ 'Sum Of Factors');
end;

procedure TForm1.BtnCalcClick(Sender: TObject);
Var
Digits,SumOfFactors,X:Integer;
Sp,EvenOrNot: String;
begin
 SumOfFactors:=0;
 Sp:= '                                          ';
 Num:= StrToInt(EdtNumber.Text);
 if Num mod 2=0 then
 EvenOrNot:='Even'
 else EvenOrNot:= 'Odd';
Digits:= Length(IntToStr(Num));
SumOfFactors:= SumOfFactors + Num;
for X := 1 to Num-1 do
  begin
    if Num Mod X =0 then
    SumOfFactors:= SumOfFactors + X;
  end;
RedOutput.Lines.Add(IntToStr(Num) + Sp + EvenOrNot + Sp + IntToStr(Digits) + Sp +  IntToStr(SumOfFactors) );
end;

procedure TForm1.BtnLargeClick(Sender: TObject);
var
Num2:Integer;
St:String;
begin
Num:= StrToInt(EdtNumber.Text);
Num2:= StrToInt(EdtNumber.Text);

             if Num > Num2 then
 St:= IntToStr(Num)
 else
 St:= IntToStr(Num2);
 RedOutput.Lines.Add('The Largest Integer Value Is ' + St)
end;

end.
