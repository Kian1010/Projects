unit List;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin;

type
  TForm1 = class(TForm)
    LstBx: TListBox;
    EdtFoods: TEdit;
    Button1: TButton;
    MemDisplay: TMemo;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure LstBxClick(Sender: TObject);
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
Var
 Food: String;
begin
        if EdtFoods.Text= '' then
                      begin
   ShowMessage('Type In something First');
   exit;
                      end
          else
  Food :=EdtFoods.Text;
   LstBx.Items.Add(Food);
   ShowMessage('Record added');



end;

procedure TForm1.LstBxClick(Sender: TObject);
var
P: Integer;
st : String;
begin
 P:= LstBx.ItemIndex;
 MemDisplay.Clear;
 if (P= 0)or (P=1) or (P=2) or (P=5) or (P=7) then
 Begin
 MemDisplay.Lines.Add('Drinks');
 End;

    if (P=3) or (P=4) or (P=6) then
     begin
   MemDisplay.Lines.Add('Foods')
  end;
  if (P=8) then
  begin
    MemDisplay.Lines.Add('Best Option Here');
  end;
  if P  > 8 then
  begin
    MemDisplay.Lines.Add('Your Own Opinion');
  end;
  //MemDisplay.Lines.Add(St);
end;

end.
