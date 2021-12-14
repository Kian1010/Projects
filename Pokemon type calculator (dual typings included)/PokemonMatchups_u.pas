unit PokemonMatchups_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    ComboBox2: TComboBox;
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  ArrTypes: Array[1..18] of string = ('Normal','Fighting','Flying','Poison'
,'Ground','Rock','Bug','Ghost','Steel','Fire','Water','Grass','Electric','Psychic'
,'Ice','Dragon','Dark','Fairy');

ArrOutput1: Array[1..18] of real;
ArrOutput2: Array[1..18] of real;

Normal,Fighting,Flying,Poison,Ground,Rock,Bug,Ghost,Steel,Fire,Water,
Grass,Electric,Psychic,Ice,Dragon,Dark,Fairy:integer;
implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
PriType,SecType,resistant,weak,neutral,Immune: string;
I,count1,count2:Integer;
begin
Memo1.Clear;
count1:=0;
count2:=0;
Immune:= 'This typing is immune to: ' ;
resistant:='This typing is resistant against: ';
weak:='This typing is weak against: ';
neutral:='This typing is damaged normally by: ';
     if ComboBox1.ItemIndex > -1 then
 PriType:= ComboBox1.Text
 else
 begin
 ShowMessage('Please Enter a primary type');
 ComboBox1.SetFocus;
 Exit;
 end;

 if Uppercase(ComboBox1.Text) = Uppercase(ComboBox2.Text) then
 begin
   ShowMessage('cannot Have same type twice');
   Exit;
 end;

if ComboBox2.ItemIndex > -1 then
SecType:= ComboBox2.Text
else
ComboBox2.ItemIndex:= 0;   //if there is no secondary type, automatically becomes none

Normal:= 1;         //1
Fighting:= 2;       //2
Flying := 3;        //3
Poison:= 4;         //4
Ground:= 5;         //5
Rock:= 6;           //6
Bug:= 7;            //7
Ghost:= 8;          //8
Steel:= 9;          //9
Fire:= 10;           //10
Water:= 11;          //11
Grass := 12;         //12
Electric:= 13;       //13
Psychic:= 14;        //14
Ice := 15;           //15
Dragon:= 16;         //16
Dark:= 17;           //17
Fairy:= 18;          //18

                        for I := 1 to 18 do
                        begin
                        ArrOutput1[i]:=1;
                        ArrOutput2[i]:=1;
                        end;


           for I := 1 to 18 do
           begin
if Uppercase(ArrTypes[i]) = Uppercase(ComboBox1.Text) then
begin

     case I of
    1:      begin                //normal
            ArrOutput1[Fighting]:= 2;
            ArrOutput1[Ghost]:= 0;
            end;
    2:      begin                   //fighting
            ArrOutput1[Psychic]:=2;
            ArrOutput1[Flying]:= 2;
            ArrOutput1[Fairy]:=2;
            ArrOutput1[Bug]:=0.5;
            ArrOutput1[Rock]:=0.5;
            ArrOutput1[Dark]:=0.5;
            end;
    3:      begin   //    Flying
           ArrOutput1[electric]:=2;
           ArrOutput1[ice]:=2;
           ArrOutput1[rock]:=2;
           ArrOutput1[grass]:=0.5;
           ArrOutput1[fighting]:=0.5;
           ArrOutput1[bug]:=0.5;
           ArrOutput1[ground]:=0;
            end;
    4:      begin     // Poison
            ArrOutput1[Grass]:=0.5;
            ArrOutput1[Fighting]:=0.5;
            ArrOutput1[Poison]:=0.5;
            ArrOutput1[Ground]:=2;
            ArrOutput1[Psychic]:=2;
            ArrOutput1[Bug]:=0.5;
            ArrOutput1[Fairy]:=0.5;
            end;
    5:      begin     // Ground
            ArrOutput1[Water]:=2;
            ArrOutput1[Electric]:=0;
            ArrOutput1[Grass]:=2;
            ArrOutput1[Ice]:=2;
            ArrOutput1[Poison]:=0.5;
            ArrOutput1[Rock]:=0.5;
            end;
    6:      begin    //   Rock
            ArrOutput1[Normal]:=0.5;
            ArrOutput1[Fire]:=0.5;
            ArrOutput1[Water]:=2;
            ArrOutput1[Grass]:=2;
            ArrOutput1[Fighting]:=2;
            ArrOutput1[Poison]:=0.5;
            ArrOutput1[Ground]:=2;
            ArrOutput1[Flying]:=0.5;
            ArrOutput1[Steel]:=2;
            end;
    7:      begin     //    Bug
            ArrOutput1[Fire]:=2;
            ArrOutput1[Grass]:=0.5;
            ArrOutput1[Fighting]:=0.5;
            ArrOutput1[Ground]:=0.5;
            ArrOutput1[Flying]:=2;
            ArrOutput1[Rock]:=2;
            end;
    8:      begin    //    Ghost
            ArrOutput1[Normal]:=0;
            ArrOutput1[Fighting]:=0;
            ArrOutput1[Poison]:=0.5;
            ArrOutput1[Bug]:=0.5;
            ArrOutput1[Ghost]:=2;
            ArrOutput1[Dark]:=2;
            end;
    9:      begin  //  Steel
            ArrOutput1[Normal]:=0.5;
            ArrOutput1[Fire]:=2;
            ArrOutput1[Grass]:=0.5;
            ArrOutput1[Ice]:=0.5;
            ArrOutput1[Fighting]:=2;
            ArrOutput1[Ground]:=2;
            ArrOutput1[Poison]:=0;
            ArrOutput1[Flying] :=0.5;
            ArrOutput1[Psychic] :=0.5;
            ArrOutput1[Bug] :=0.5;
            ArrOutput1[Rock]:=0.5;
            ArrOutput1[Dragon]:=0.5;
            ArrOutput1[Steel]:=0.5 ;
            ArrOutput1[Fairy]:=0.5;
            end;
    10:     begin     //   Fire
            ArrOutput1[Fire]:=0.5;
            ArrOutput1[Water]:=2;
            ArrOutput1[Grass]:=0.5;
            ArrOutput1[Ice]:=0.5;
            ArrOutput1[Ground]:=2;
            ArrOutput1[Bug]:=0.5;
            ArrOutput1[Rock]:=2;
            end;
    11:     begin   //   Water
            ArrOutput1[Fire]:=0.5;
            ArrOutput1[Water]:=0.5;
            ArrOutput1[Electric]:=2;
            ArrOutput1[Grass]:=2;
            ArrOutput1[Ice]:=0.5;
            ArrOutput1[Steel]:=0.5;

            end;
    12:     begin  //    Grass
            ArrOutput1[Fire]:=2;
            ArrOutput1[Water]:=0.5;
            ArrOutput1[Electric]:=0.5;
            ArrOutput1[Grass]:=0.5;
            ArrOutput1[Ice]:=2;
            ArrOutput1[Poison]:=2;
            ArrOutput1[Flying]:=2;
            ArrOutput1[Ground]:=0.5;
            ArrOutput1[Bug]:=2;
            end;
    13:     begin     //   Electric
            ArrOutput1[Electric]:=0.5;
            ArrOutput1[Ground]:=2;
            ArrOutput1[Flying]:=0.5;
            ArrOutput1[Steel]:=0.5;
            end;
    14:     begin   //     Psychic
            ArrOutput1[Fighting]:=0.5;
            ArrOutput1[Psychic]:=0.5;
            ArrOutput1[Bug]:=2;
            ArrOutput1[Ghost]:=2;
            ArrOutput1[Dark]:=2;
            end;
    15:     begin     //   Ice
            ArrOutput1[Fire]:=2;
            ArrOutput1[Ice]:=0.5;
            ArrOutput1[Fighting]:=2;
            ArrOutput1[Rock]:=2;
            ArrOutput1[Steel]:=2;
            end;
    16:     begin       //  Dragon
            ArrOutput1[Dragon]:=2;
            ArrOutput1[Fairy]:=2;
            ArrOutput1[Ice]:=2;
            ArrOutput1[Fire]:=0.5;
            ArrOutput1[Electric]:=0.5;
            ArrOutput1[Water]:= 0.5;
            ArrOutput1[Grass]:= 0.5;
            end;
    17:     begin     //   Dark
            ArrOutput1[Fighting]:=2;
            ArrOutput1[Psychic]:=0;
            ArrOutput1[Bug]:=2;
            ArrOutput1[Ghost]:=0.5;
            ArrOutput1[Dark]:=0.5;
            ArrOutput1[Fairy]:=2;
            end;
    18:     begin    //   Fairy
            ArrOutput1[Fighting]:=0.5;
            ArrOutput1[Poison]:=2;
            ArrOutput1[Bug]:=0.5;
            ArrOutput1[Dragon]:=0;
            ArrOutput1[Dark]:= 0.5;
            ArrOutput1[Steel]:=2;
            end;
    end;//case

end;//if
    end;//for

    for I := 1 to 18 do
           begin
if Uppercase(ArrTypes[i]) = Uppercase(ComboBox2.Text) then
begin

     case I of
    1:      begin                //normal
            ArrOutput2[Fighting]:= 2;
            ArrOutput2[Ghost]:= 0;
            end;
    2:      begin                   //fighting
            ArrOutput2[Psychic]:=2;
            ArrOutput2[Flying]:= 2;
            ArrOutput2[Fairy]:=2;
            ArrOutput2[Bug]:=0.5;
            ArrOutput2[Rock]:=0.5;
            ArrOutput2[Dark]:=0.5;
            end;
    3:      begin   //    Flying
           ArrOutput2[electric]:=2;
           ArrOutput2[ice]:=2;
           ArrOutput2[rock]:=2;
           ArrOutput2[grass]:=0.5;
           ArrOutput2[fighting]:=0.5;
           ArrOutput2[bug]:=0.5;
           ArrOutput2[ground]:=0;
            end;
    4:      begin     // Poison
            ArrOutput2[Grass]:=0.5;
            ArrOutput2[Fighting]:=0.5;
            ArrOutput2[Poison]:=0.5;
            ArrOutput2[Ground]:=2;
            ArrOutput2[Psychic]:=2;
            ArrOutput2[Bug]:=0.5;
            ArrOutput2[Fairy]:=0.5;
            end;
    5:      begin     // Ground
            ArrOutput2[Water]:=2;
            ArrOutput2[Electric]:=0;
            ArrOutput2[Grass]:=2;
            ArrOutput2[Ice]:=2;
            ArrOutput2[Poison]:=0.5;
            ArrOutput2[Rock]:=0.5;
            end;
    6:      begin    //   Rock
            ArrOutput2[Normal]:=0.5;
            ArrOutput2[Fire]:=0.5;
            ArrOutput2[Water]:=2;
            ArrOutput2[Grass]:=2;
            ArrOutput2[Fighting]:=2;
            ArrOutput2[Poison]:=0.5;
            ArrOutput2[Ground]:=2;
            ArrOutput2[Flying]:=0.5;
            ArrOutput2[Steel]:=2;
            end;
    7:      begin     //    Bug
            ArrOutput2[Fire]:=2;
            ArrOutput2[Grass]:=0.5;
            ArrOutput2[Fighting]:=0.5;
            ArrOutput2[Ground]:=0.5;
            ArrOutput2[Flying]:=2;
            ArrOutput2[Rock]:=2;
            end;
    8:      begin    //    Ghost
            ArrOutput2[Normal]:=0;
            ArrOutput2[Fighting]:=0;
            ArrOutput2[Poison]:=0.5;
            ArrOutput2[Bug]:=0.5;
            ArrOutput2[Ghost]:=2;
            ArrOutput2[Dark]:=2;
            end;
    9:      begin  //  Steel
            ArrOutput2[Normal]:=0.5;
            ArrOutput2[Fire]:=2;
            ArrOutput2[Grass]:=0.5;
            ArrOutput2[Ice]:=0.5;
            ArrOutput2[Fighting]:=2;
            ArrOutput2[Ground]:=2;
            ArrOutput2[Poison]:=0;
            ArrOutput2[Flying] :=0.5;
            ArrOutput2[Psychic] :=0.5;
            ArrOutput2[Bug] :=0.5;
            ArrOutput2[Rock]:=0.5;
            ArrOutput2[Dragon]:=0.5;
            ArrOutput2[Steel]:=0.5 ;
            ArrOutput2[Fairy]:=0.5;
            end;
    10:     begin     //   Fire
            ArrOutput2[Fire]:=0.5;
            ArrOutput2[Water]:=2;
            ArrOutput2[Grass]:=0.5;
            ArrOutput2[Ice]:=0.5;
            ArrOutput2[Ground]:=2;
            ArrOutput2[Bug]:=0.5;
            ArrOutput2[Rock]:=2;
            end;
    11:     begin   //   Water
            ArrOutput2[Fire]:=0.5;
            ArrOutput2[Water]:=0.5;
            ArrOutput2[Electric]:=2;
            ArrOutput2[Grass]:=2;
            ArrOutput2[Ice]:=0.5;
            ArrOutput2[Steel]:=0.5;

            end;
    12:     begin  //    Grass
            ArrOutput2[Fire]:=2;
            ArrOutput2[Water]:=0.5;
            ArrOutput2[Electric]:=0.5;
            ArrOutput2[Grass]:=0.5;
            ArrOutput2[Ice]:=2;
            ArrOutput2[Poison]:=2;
            ArrOutput2[Flying]:=2;
            ArrOutput2[Ground]:=0.5;
            ArrOutput2[Bug]:=2;
            end;
    13:     begin     //   Electric
            ArrOutput2[Electric]:=0.5;
            ArrOutput2[Ground]:=2;
            ArrOutput2[Flying]:=0.5;
            ArrOutput2[Steel]:=0.5;
            end;
    14:     begin   //     Psychic
            ArrOutput2[Fighting]:=0.5;
            ArrOutput2[Psychic]:=0.5;
            ArrOutput2[Bug]:=2;
            ArrOutput2[Ghost]:=2;
            ArrOutput2[Dark]:=2;
            end;
    15:     begin     //   Ice
            ArrOutput2[Fire]:=2;
            ArrOutput2[Ice]:=0.5;
            ArrOutput2[Fighting]:=2;
            ArrOutput2[Rock]:=2;
            ArrOutput2[Steel]:=2;
            end;
    16:     begin       //  Dragon
            ArrOutput2[Dragon]:=2;
            ArrOutput2[Fairy]:=2;
            ArrOutput2[Ice]:=2;
            ArrOutput2[Fire]:=0.5;
            ArrOutput2[Electric]:=0.5;
            ArrOutput2[Water]:= 0.5;
            ArrOutput2[Grass]:= 0.5;
            end;
    17:     begin     //   Dark
            ArrOutput2[Fighting]:=2;
            ArrOutput2[Psychic]:=0;
            ArrOutput2[Bug]:=2;
            ArrOutput2[Ghost]:=0.5;
            ArrOutput2[Dark]:=0.5;
            ArrOutput2[Fairy]:=2;
            end;
    18:     begin    //   Fairy
            ArrOutput2[Fighting]:=0.5;
            ArrOutput2[Poison]:=2;
            ArrOutput2[Bug]:=0.5;
            ArrOutput2[Dragon]:=0;
            ArrOutput2[Dark]:= 0.5;
            ArrOutput2[Steel]:=2;
            end;
    end;//case

end;//if
           end;//for
                               //ytest
           for I := 1 to 18 do
             begin
             ArrOutput1[I]:= Arroutput1[I] * ArrOutput2[I];
             end;

    for I := 1 to 18 do
    begin
              if ArrOutput1[i] = 0 then
                begin
              Immune:= Immune + ArrTypes[i] + ', ' ;
              count1:= count1+1;
                end;

              if ArrOutput1[i]= 2  then
                begin
              weak:= weak + ArrTypes[i]+ ',' ;
                end;

              if ArrOutput1[i] = 4 then
                begin
               weak:= weak + ArrTypes[i] + '(Quad weakness), ';
                end;

              if ArrOutput1[i] = 0.5 then
                begin
              resistant:= resistant + ArrTypes[i] + ', ';
              count2:= count2+1;
                end;

              if ArrOutput1[i] = 0.25 then
                begin
                resistant:= resistant + ArrTypes[i] + '(Quad resistance), ';
                end;


              if ArrOutput1[i] =1 then
                begin
              neutral:= neutral + ArrTypes[i]+ ', ';
                end;
    end;//for

    if count1 =0 then
    Immune:= Immune + ' None';

    if count2 =0 then
    resistant:= resistant + ' None';

Memo1.Lines.Add(Immune+ sLineBreak +resistant + sLineBreak + weak + sLineBreak + neutral);

end;

end.
