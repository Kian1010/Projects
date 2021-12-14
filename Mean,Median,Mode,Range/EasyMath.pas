unit EasyMath;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
Num,Sum,Count,RepeatedNum,Hi,Low,Range:integer;
Average:real;
St:String;
begin
Sum:=0;
Count:=0;
Num:=0;
St:='';
Hi:=0;
         while Num <> -999 do
         begin
         Num:= StrToInt(InputBox('','Enter Your set of numbers <-999 to stop>',''));

                   if Num <> -999 then    {To avoid -999 from being calculated}
                          begin
                          if Num<Low  then
                          low:=Num;

                          if Num>Hi then
                          Hi:=Num;

                     Range:= Hi-Low;

                      Sum:= Sum+Num;
                      Count:= Count+1;
                      St:= St+ IntToStr(Num) + ', ';
                           end;

         end;
   Average:=Sum/Count;
   ShowMessage('The mean value is: ' + FloatToStrF(Average,ffFixed,20,2) + ' The Range Is: '+IntToStr(Range)+ ' The Numbers you entered were: ' + St);        {Shows the mean}
end;

end.
