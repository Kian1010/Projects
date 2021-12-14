unit FibonacciSequence;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    BtnCalc: TButton;
    EdtTerm: TEdit;
    MemDisplay: TMemo;
    Label1: TLabel;
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
Var
T1,T2,NextTerm,AmountOfTerms,Count:Integer;
St:String;
Begin
MemDisplay.Lines.Clear;
Count:=0;
AmountOfTerms:= StrToInt(EdtTerm.Text);

T1:=0;
T2:=1;
NextTerm:=0;
St:= '0';
  if AmountOfTerms > 40 then
  begin
ShowMessage('Use A Smaller Number');
exit;
  end;


 while AmountOfTerms <> Count do

              begin
        T1:=T2;
        // 0 Becomes 1 .      1 Becomes 0.     0 Becomes 1.  1 B 1.
        T2:=NextTerm;
        // 1 Becomes 0.       0 Becomes 1.     1 Becomes 1.  1 B 2.
        NextTerm:= T1+T2;
        //NTerm(0) Becomes 1+0.          1 Becomes 1.     1 Becomes 2.  2 B 3.
        St:= St+  ', ' + IntToStr(NextTerm)  ;
        Count:=Count+1;
              end;
MemDisplay.Lines.Add('The Fibonacci Numbers For The Terms entered are' + St) ;
end;

end.
