unit SweetsProj;
//THIS WAS DONE BY KIAN NAIDU 10 GDB- Do Not Steal
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DMUnit, ExtCtrls, jpeg, MPlayer, Buttons;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    EdtSearch: TEdit;
    dbgData: TDBGrid;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    EdtBarCode: TEdit;
    Label2: TLabel;
    EdtTOfCandy: TEdit;
    EdtBrand: TEdit;
    EdtQuantity: TEdit;
    EdtOrigin: TEdit;
    EdtNameOfCandy: TEdit;
    EdtExpiryDate: TEdit;
    EdtFlavour: TEdit;
    BtnClear: TButton;
    BtnAdd: TButton;
    BtnDelete: TButton;
    BtnUpdate: TButton;
    Label10: TLabel;
    EdtManuDate: TEdit;
    ChkBxMilk: TCheckBox;
    ChkbxFat: TCheckBox;
    ChkbxVegan: TCheckBox;
    Image1: TImage;
    Label11: TLabel;
    EdtPrice: TEdit;
    BtnClose: TButton;
    Label12: TLabel;
    edtSQL: TEdit;
    Label13: TLabel;
    BtnSQL: TButton;
    procedure FormCreate(Sender: TObject);
    procedure dbgDataCellClick(Column: TColumn);
    procedure EdtSearchChange(Sender: TObject);
    procedure BtnClearClick(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
    procedure dbgDataDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BtnUpdateClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnSQLClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.BtnAddClick(Sender: TObject);
var
     BarCode,TypeOCandy,NameOCandy,Brand, CountryOrigin, ManuDate,ExpDate,Flavour, Sql: String;
    Price:Real;
    Quantity, len : Integer;
    Milk,Fat,Vegan, START:Bool;
begin
Start:= TRUE;
barcode:= EdtBarCode.Text;
len:= Length(BarCode);
if len <> 4 then
begin
MessageDlg('Enter a 4 digit Barcode', mtWarning, [mbClose],0);
EdtBarCode.Clear;
EdtBarCode.SetFocus;
Start:= FALSE;
end;


Milk:= FALSE;
Fat:= FALSE;
Vegan:= FALSE;

     Barcode := EdtBarCode.Text;
     TypeOCandy:= EdtTOfCandy.Text;
     NameOCandy:= EdtNameOfCandy.Text;
     Brand:= EdtTOfCandy.Text;
     CountryOrigin:= EdtOrigin.Text;
     Quantity:= StrToInt(EdtQuantity.Text);
     ManuDate:= EdtManuDate.Text;
     ExpDate:= EdtExpiryDate.Text;
     Flavour:= EdtFlavour.Text;
     Price:= StrToFloat(EdtPrice.Text);

     if ChkBxMilk.Checked then
   Milk:= TRUE;
   if ChkbxFat.Checked then
   Fat:= TRUE;
   if ChkbxVegan.Checked then
   Vegan:= TRUE;
                                 if start = true then
                                 BEGIN
     sql := 'INSERT INTO Candy(Barcode,TypeOfCandy,NameOfCandy,Brand,CountryOrigin,Quantity,ManufactoryDate,ExpiryDate,Flavour,Price,Containsmilk,FatFree,VeganFriendly) VALUES("'+BarCode+'", "'+TypeOCandy+'", "'+NameOCandy+'", "'+Brand+'", "'+CountryOrigin+'", '+IntToStr(Quantity)+', #'+ManuDate+'#, #'+ExpDate+'#, "'+Flavour+'", '+FloatToStr(Price)+',  '+BoolToStr(Milk)+', '+BoolToStr(Fat)+', '+BoolToStr(Vegan)+' )';
     WITH DataModule2 DO
       BEGIN
             ADOQuery1.Close;
             ADOQuery1.SQL.Clear;
             ADOQuery1.SQL.Add(sql);
              ADOQuery1.ExecSQL;
             ShowMessage('Record Added');
       END;
                                 END;
end;

procedure TForm1.BtnClearClick(Sender: TObject);
begin
EdtSearch.Text:='';
EdtBarCode.Text:='';
EdtTOfCandy.Text:= '';
EdtNameOfCandy.Text:= '';
EdtBrand.Text:='';
EdtQuantity.Text:='';
EdtOrigin.Text:='';
EdtExpiryDate.Text:= '';
EdtFlavour.Text:='';
EdtManuDate.Text:= '';
EdtPrice.Text:= '';

ChkBxMilk.Checked:= FALSE;
ChkbxFat.Checked:= FALSE;
ChkbxVegan.Checked:= FALSE;
ShowMessage('You Have Cleared All The fields');
end;

procedure TForm1.BtnCloseClick(Sender: TObject);
begin
if  MessageDlg('Are you sure you want to exit?', mtConfirmation, [mbYes, mbNo],0) = mrYes then
begin
ShowMessage('Thank You for Viewing the project done by Kian Naidu, Have a good day');
close;
end;
end;

procedure TForm1.BtnDeleteClick(Sender: TObject);
VAR
    Barcode,sql : String;
begin
    Barcode := EdtBarCode.Text;
    if MessageDlg('Are You Sure You Want To Delete This Record',mtConfirmation,[mbYes,mbNo],0) = mrYes then
       begin
            sql := 'DELETE FROM Candy WHERE Barcode = "'+Barcode+'"';
            WITH DataModule2 DO
              BEGIN
                    ADOQuery1.Close;
                    ADOQuery1.SQL.Clear;
                    ADOQuery1.SQL.Add(sql);
                    ADOQuery1.ExecSQL;
                    ShowMessage('Record Deleted');
                    //Refresh DBGrid
                    sql := 'SELECT * FROM Candy';
                    ADOQuery1.Close;
                    ADOQuery1.SQL.Clear;
                    ADOQuery1.SQL.Add(sql);
                    ADOQuery1.Open;
              END;
       end;
end;

procedure TForm1.BtnSQLClick(Sender: TObject);
Var
SQL:string;
begin
Sql:= edtSQL.Text;
if edtSQL.Text <> '' then
                       begin
            WITH DataModule2 DO
              BEGIN
                    ADOQuery1.Close;
                    ADOQuery1.SQL.Clear;
                    ADOQuery1.SQL.Add(sql);
                    ADOQuery1.ExecSQL;


                    ADOQuery1.Close;
                    ADOQuery1.SQL.Clear;
                    ADOQuery1.SQL.Add(sql);
                    ADOQuery1.Open;
              END;
                       end
    else
    ShowMessage('You cannot run a blank SQL');

end;

procedure TForm1.BtnUpdateClick(Sender: TObject);
var
Sql:String;
 BarCode,TypeOCandy,NameOCandy,Brand, CountryOrigin, ManuDate,ExpDate,Flavour: String;
 Price:Real;
 Quantity : Integer;
 Milk,Fat,Vegan:Bool;
begin

Milk:= FALSE;
Fat:= FALSE;
Vegan:= FALSE;

   if ChkBxMilk.Checked then
   Milk:= TRUE;
   if ChkbxFat.Checked then
   Fat:= TRUE;
   if ChkbxVegan.Checked then
   Vegan:= TRUE;

     Barcode := EdtBarCode.Text;
     TypeOCandy:= EdtTOfCandy.Text;
     NameOCandy:= EdtNameOfCandy.Text;
     Brand:= EdtTOfCandy.Text;
     Quantity:= StrToInt(EdtQuantity.Text);
     CountryOrigin:= EdtOrigin.Text;
     ManuDate:= EdtManuDate.Text;
     ExpDate:= EdtExpiryDate.Text;
     Flavour:= EdtFlavour.Text;
     Price:= StrToFloat(EdtPrice.Text);


Sql:= 'UPDATE Candy SET Barcode= "'+BarCode+'", TypeOfCandy= "'+TypeOCandy+'", NameOfCandy=  "'+NameOCandy+'", Brand= "'+Brand+'", CountryOrigin= "'+CountryOrigin+'", Quantity= '+IntToStr(Quantity)+', ManufactoryDate= #'+ManuDate+'#, ExpiryDate= #'+ExpDate+'#, Flavour= "'+Flavour+'",  Price= '+FloatToStr(Price)+', ContainsMilk= '+BoolToStr(Milk)+', FatFree= '+BoolToStr(Fat)+', VeganFriendly= '+BoolToStr(Vegan)+' WHERE Barcode= "'+BarCode+'" ';

With DataModule2 Do
                 Begin
             ADOQuery1.Close;
             ADOQuery1.SQL.Clear;
             ADOQuery1.SQL.Add(sql);
             ADOQuery1.ExecSQL;
             ShowMessage('Updated');
                 End;

end;

procedure TForm1.dbgDataCellClick(Column: TColumn);
var
    st,sql,srch, Barcode : String;
begin
Label12.Visible:= FALSE;
ChkBxMilk.Checked:= FALSE;
ChkbxFat.Checked:= FALSE;
ChkbxVegan.Checked:= FALSE;

     st := dbgData.fields[0].AsString;
     edtSearch.Text := st;
    sql := 'SELECT * FROM Candy WHERE Barcode = "'+st+'"';
     WITH DataModule2 DO
       BEGIN
            ADOQuery1.Close;
            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add(sql);
            ADOQuery1.Open;
            ADOQuery1.First;
           EdtTOfCandy.Text := IntToStr(ADOQuery1.MaxRecords);
           while NOT(ADOQuery1.Eof) do
              begin
                   EdtBarCode.Text :=  ADOQuery1.FindField('Barcode').AsString;
                   EdtTOfCandy.Text :=  ADOQuery1.FindField('TypeOfCandy').AsString;
                   EdtNameOfCandy.Text := ADOQuery1.FindField('NameOfCandy').AsString;
                   EdtBrand.Text :=  ADOQuery1.FindField('Brand').AsString;
                   EdtOrigin.Text :=  ADOQuery1.FindField('CountryOrigin').AsString;
                   EdtQuantity.Text :=  ADOQuery1.FindField('Quantity').AsString;
                   EdtManuDate.Text:= ADOQuery1.FindField('ManufactoryDate').AsString;


                   EdtExpiryDate.Text := ADOQuery1.FindField('ExpiryDate').AsString;
                   EdtFlavour.Text := ADOQuery1.FindField('Flavour').AsString;
                EdtPrice.Text:= ADOQuery1.FindField('Price').AsString;
                 if ADOQuery1.FindField('ContainsMilk').AsBoolean then
                 ChkBxMilk.Checked := True;

                 if ADOQuery1.FindField('Fatfree').AsBoolean then
                     ChkbxFat.Checked := True;

                      if ADOQuery1.FindField('VeganFriendly').AsBoolean then
                     ChkbxVegan.Checked := True;

                  ADOQuery1.Next;
                   End;


       END;

           srch := edtSearch.Text;
     sql := 'SELECT * FROM Candy WHERE Barcode LIKE "'+srch+'%"';
     WITH DataModule2 DO
       BEGIN
            ADOQuery1.Close;
            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add(sql);
            ADOQuery1.Open;
            DataSource1.DataSet := ADOQuery1;
            dbgData.DataSource := DataSource1;
       END;


    { sql := 'SELECT * FROM Candy WHERE Barcode= "'+barcode+'"';
                  DataModule2.ADOQuery1.Close;
                    DataModule2.ADOQuery1.SQL.Clear;
                    DataModule2.ADOQuery1.SQL.Add(sql);
                    DataModule2.ADOQuery1.Open; }
     //EdtSearch.Clear;
     Label12.Visible:= TRUE;
    EdtSearch.SetFocus;
end;


procedure TForm1.dbgDataDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
  Var
  St:String;
begin
 if (Column.Field.FieldName = 'NameOfCandy') then
      Begin
  if dbgData.Fields[0].AsString = '6000' then
     Image1.Picture.LoadFromFile('astros.jpeg')
     else
    if dbgData.Fields[0].AsString = '6001' then
     Image1.Picture.LoadFromFile('barone_peanut.jpeg')
     else
      if dbgData.Fields[0].AsString = '6002' then
     Image1.Picture.LoadFromFile('Snickers.jpeg')
     else
      if dbgData.Fields[0].AsString = '6003' then
     Image1.Picture.LoadFromFile('5 star.jpeg')
     else
      if dbgData.Fields[0].AsString = '6004' then
     Image1.Picture.LoadFromFile('Eclairs.jpeg')
     else
      if dbgData.Fields[0].AsString = '6005' then
     Image1.Picture.LoadFromFile('Kit Kat.jpeg')
     else
      if dbgData.Fields[0].AsString = '6006' then
     Image1.Picture.LoadFromFile('Manhattan Sour Worms.jpeg')
     else
      if dbgData.Fields[0].AsString = '6007' then
     Image1.Picture.LoadFromFile('MENTOS.jpeg')
     else
      if dbgData.Fields[0].AsString = '6008' then
     Image1.Picture.LoadFromFile('Milkybar.jpeg')
     else
      if dbgData.Fields[0].AsString = '6009' then
     Image1.Picture.LoadFromFile('Rolo.jpeg')
     else
      if dbgData.Fields[0].AsString = '6010' then
     Image1.Picture.LoadFromFile('Skittles.jpeg')
     else
      if dbgData.Fields[0].AsString = '6011' then
     Image1.Picture.LoadFromFile('smoothies.jpeg')
     else
      if dbgData.Fields[0].AsString = '6012' then
     Image1.Picture.LoadFromFile('sparkles.jpeg')
     else
      if dbgData.Fields[0].AsString = '6013' then
     Image1.Picture.LoadFromFile('Yoguetta.jpeg')
     else
     Image1.Picture.LoadFromFile('default.jpeg');
     //Image1.Picture.LoadFromFile('');
  {St:=dbgData.Fields[4].AsString;
  if Column.Field.FieldName = St then
  begin
    Image1.Picture.LoadFromFile('00-11.jpg');
  end;  }
       end;
end;

procedure TForm1.EdtSearchChange(Sender: TObject);
var
    srch,sql : String;
begin
       srch := EdtSearch.Text;
       if srch = '' then
       Label12.Visible:= FALSE;

     sql := 'SELECT * FROM Candy WHERE NameOfCandy LIKE "'+srch+'%"';
     WITH DataModule2 DO
       BEGIN
            ADOQuery1.Close;
            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add(sql);
            ADOQuery1.Open;
            DataSource1.DataSet := ADOQuery1;
            dbgData.DataSource := DataSource1;
       END;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
Barcode,sql:String;
begin
DataModule2.ADOTable1.Open;

   WITH DataModule2 DO
       BEGIN
            ADOQuery1.Close;
            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add('SELECT * FROM Candy');
            ADOQuery1.Open;
            DataSource1.DataSet := ADOQuery1;
            dbgData.DataSource := DataSource1;
       END;

end;

end.
