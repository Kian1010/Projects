unit One_Two_Three;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Label2: TLabel;
    EdtNum: TEdit;
    MemDisplay: TMemo;
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
Num : Integer;
St : String;
begin
Num := StrToInt(EdtNum.Text);
St := 'Three';
if Num = 1 then
St := 'One'
else if Num = 2 then
     St := 'Two';
     if Num > 3 then
     St := 'Not a valid number, learn to read';
     MemDisplay.Lines.Clear;
     MemDisplay.Lines.Add(St);



end;

end.