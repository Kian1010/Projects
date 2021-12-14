unit MainPage_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, Grids, DBGrids, ExtCtrls, jpeg, Buttons,Validate_u,
  pngimage;

type
  TFrmMainPage = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    SpnEdtQuantityWanted: TSpinEdit;
    EdtBiddingNo: TEdit;
    BtnConfirmBid: TButton;
    EdtAmountBidding: TEdit;
    Image1: TImage;
    Label5: TLabel;
    EdtSearch: TEdit;
    BitBtnHelp: TBitBtn;
    BtnClear: TButton;
    lblHighestBid: TLabel;
    procedure BtnChangeColourClick(Sender: TObject);
    procedure BtnConfirmBidClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EdtSearchChange(Sender: TObject);
    procedure BitBtnHelpClick(Sender: TObject);
    procedure MyButtonClick(Sender:TObject);
    procedure BtnClearClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ClearAll;
    procedure MyCellClick(Column: TColumn);
    procedure SpnEdtQuantityWantedChange(Sender: TObject);
  private
    { Private declarations }
    MyButton:TButton;
    MyDBGrid: TDBGrid;
  public
    { Public declarations }
  end;

var
  FrmMainPage: TFrmMainPage;
      highest:Real;
      SpnEdtValue:Integer;

implementation

uses
DM_U, Help_U,Login_U;

{$R *.dfm}



procedure TFrmMainPage.BitBtnHelpClick(Sender: TObject);
begin
frmhelp.ShowModal;  {shows help}
end;

procedure TFrmMainPage.BtnConfirmBidClick(Sender: TObject);
var
Ssql,sbiddingNo:String;
 iquantity:integer;
 rbiddingPrice,rnewprice:Real;
begin
{valdation}
if (EdtBiddingNo.Text = '') or (EdtAmountBidding.Text ='') then
begin
 ShowMessage('One or more fields are blank. Please fill them all in');
 Exit;
end;//if

if IsRealNum(EdtAmountBidding.Text)  = False then
begin
  ShowMessage('Please omit all letters from the amount you are bidding');
  Exit;
end;   //if

sbiddingNo:= EdtBiddingNo.Text;
iquantity:= SpnEdtQuantityWanted.Value;
rBiddingPrice:= StrToFloat(EdtAmountBidding.Text);
//rbiddingPrice:= rbiddingPrice;
rnewprice:= highest * iquantity;

//If the user enters the wrong amount of characters then a message pops up and the edit box is focused on
  if (Length(sBiddingNo) > 6) OR (Length(sBiddingNo) <6 ) then
    Begin
    ShowMessage('Incorrect bidding number length, ensure it is 6 characters long');
    Exit;
    End;

    //Refers to the function created, and stops the program if the format is wrong
If IsValidNum(SbiddingNo) = False then
begin
  ShowMessage('Format of the Bidding number is wrong e.g XX11xx');
  Exit;
end;

if (rbiddingPrice) <= (highest * SpnEdtQuantityWanted.Value) then
begin
  ShowMessage('Bid too low! You need to bid ' +FloatToStrF(rNewprice,ffFixed,20,2)+ ' to get this item!' + sLineBreak +' or lower your quantity if possible');
  Exit;
end;

if SpnEdtQuantityWanted.Value >  MyDBGrid.Fields[3].AsInteger  then
begin
  ShowMessage('Not enough items! please lower the quantity');
  Exit;
end;
        {end of validating}

//the sql is stored on a string which will let the users information(Bid)
//to be sent to the database
sSql := 'INSERT INTO Bidders(BidderName,Surname,BiddingPrice,Quantitywanted,BiddingNo,DateOfBid) VALUES("'+FrmLogin.Name+'", "'+FrmLogin.Surname+'",'+FloatToStr(rBiddingPrice)+', "'+IntToStr(iquantity)+'" , "'+SbiddingNo+'" , "'+DateToStr(Now)+'")';
     WITH DataModule1 DO
       begin
             ADOQuery1.Close;{closes the Query in case an old one is open.}
             ADOQuery1.SQL.Clear;{clears any previous sql statements}
             ADOQuery1.SQL.Add(sSql);{adds the sql created}
             ADOQuery1.ExecSQL;{excecutes the sql}

             ShowMessage('Record Added'); {shows a message that the users record was added}
             TblBidders.Refresh;
             TblBidders.Close;
             TblBidders.Open;

             ADOQuery1.Close;
             ADOQuery1.SQL.Clear;
             ADOQuery1.SQL.Add('SELECT BiddingNo,Item,ItemType,QuantityLeft,Antique FROM Collectibles');
             ADOQuery1.Open;
         end;

      ShowMessage('Your bid has been sucessfully placed'); //shows an additional confirmation to tell the user that the bid was placed
       SpnEdtQuantityWanted.Value:=1;
      EdtBiddingNo.Clear;
      EdtAmountBidding.Clear;
      EdtSearch.Clear;

      end;

procedure TFrmMainPage.BtnClearClick(Sender: TObject);
begin
EdtSearch.Clear;
EdtBiddingNo.Text:= 'Click on a field';
lblHighestBid.Caption:='';
end;

procedure TFrmMainPage.ClearAll;
begin
EdtSearch.Clear;
EdtBiddingNo.Clear;
lblHighestBid.Caption:='';
SpnEdtQuantityWanted.Value:=1;
end;

procedure TFrmMainPage.BtnChangeColourClick(Sender: TObject);
begin
//changes the form colour to a light silver, for those with eye irritation
FrmMainPage.Color:=clSilver;
end;

procedure TFrmMainPage.EdtSearchChange(Sender: TObject);
var
    sSrch,sSql : String;
begin
       sSrch := EdtSearch.Text;
       if sSrch = '' then
       begin
      Image1.Picture.LoadFromFile('Defaultpic.jpg');
       lblHighestBid.Caption:='';
       EdtBiddingNo.Clear;
       end;//if

     sSql := 'SELECT BiddingNo,Item,ItemType,QuantityLeft,Antique FROM '
     + 'Collectibles WHERE Item LIKE "'+sSrch+'%"';

     WITH DataModule1 DO
       BEGIN
            ADOQuery1.Close;
            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add(sSql);
            ADOQuery1.Open;
            dsBidders.DataSet := ADOQuery1;
            MyDBGrid.DataSource := dsBidders;
       END;

end;

procedure TFrmMainPage.FormActivate(Sender: TObject);
begin
SpnEdtValue:= SpnEdtQuantityWanted.Value;
   //Displays the table of the collectibles when the form activates
   WITH DataModule1 DO
       BEGIN
            ADOQuery1.Close;
            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add('SELECT BiddingNo,Item,ItemType,QuantityLeft,Antique FROM Collectibles');
            ADOQuery1.Open;
            dsCollectibles.DataSet := ADOQuery1;
            MyDBGrid.DataSource := dsCollectibles;

       END;
end;

procedure TFrmMainPage.FormCreate(Sender: TObject);
begin
       MyButton:= TButton.Create(FrmMainPage);
       MyDBGrid:= TDBGrid.Create(FrmMainPage);
with MyButton do
begin
Parent:= FrmMainPage;
Left:= 16;
Top:= 496;
Caption:= '<-- Back';
Font.Size:= 16;
Width:= 105;
Height:=33;
OnClick:= MyButtonClick;
end;//with

with MyDBGrid do
  begin
  Parent:= FrmMainPage;
  Left:= 24;
  Top:=117;
  DataSource:= DataModule1.dsCollectibles;
  Height:=150;
  Name:= 'DBGCollectibles';
  Font.Size:= 8;
  Width:=719;
  OnCellClick:= MyCellClick;
  end;//with

end;


procedure TFrmMainPage.MyButtonClick(Sender: TObject);
begin
//Takes the user back to the main page, Dynamic component
EdtBiddingNo.Text:= 'Click on a field';
EdtAmountBidding.Clear;
EdtSearch.Clear;
SpnEdtQuantityWanted.Value:=1;
Self.Hide;
FrmLogin.Show;
end;


procedure TFrmMainPage.MyCellClick(Column: TColumn);  {Dynamic}
var
    sItem,sSql,sBidNo: String;
begin
highest:=0;
//When a row is clicked, the item is placed in the search box and
//the item is shown with a select query.
     sBidNo:= MyDBGrid.Fields[0].AsString;
     sitem := MyDBGrid.fields[1].AsString;
     edtSearch.Text := sItem;
     EdtBiddingNo.Text:= sBidNo;
    sSql := 'SELECT BiddingNo,Item,ItemType,QuantityLeft,Antique'+
    ' FROM Collectibles WHERE Item = "'+SItem+'"';

     WITH DataModule1 DO
       BEGIN
            ADOQuery1.Close;
            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add(sSql);
            ADOQuery1.Open;

            TblBidders.First;

          while NOT TblBidders.Eof do
          begin
          if TblBidders['BiddingNo'] = sBidNo then
                   begin
               if highest < (TblBidders['BiddingPrice']/TblBidders['Quantitywanted']) then
               highest:= (TblBidders['BiddingPrice']/TblBidders['Quantitywanted']);
                    end;//if
          TblBidders.Next;
          end;//while

       END;//with

       if highest = 0 then
       begin
        lblHighestBid.Caption:='There has been no bid placed for this item!';
        Exit;
       end;

      lblHighestBid.Caption:= 'Highest Bid for this item is: ' + FloatToStrF((highest),ffCurrency,20,2);

//a photo is loaded from the TImage each time they change a record,
///according to the biddingNo which will display the picture which is stored
//in the file. The image has the extension JPG If new information is inserted
//a default image shows up instead.
  if MyDBGrid.Fields[0].AsString = 'AA11aa' then
     Image1.Picture.LoadFromFile('1938 Chev.jpg')
     else
    if MyDBGrid.Fields[0].AsString = 'BB11bb' then
     Image1.Picture.LoadFromFile('Edwardian.jpg')
     else
      if MyDBGrid.Fields[0].AsString = 'CC11cc' then
     Image1.Picture.LoadFromFile('Pikachu Illustrator.jpg')
     else
      if MyDBGrid.Fields[0].AsString = 'EE33ee' then
     Image1.Picture.LoadFromFile('Action 52.jpg')
     else
      if MyDBGrid.Fields[0].AsString = 'RR33rr' then
     Image1.Picture.LoadFromFile('KenGriffeyJr.jpg')
     else
      if MyDBGrid.Fields[0].AsString = 'DD11dd' then
     Image1.Picture.LoadFromFile('Hulk.jpg')
     else
      if MyDBGrid.Fields[0].AsString = 'EE11ee' then
     Image1.Picture.LoadFromFile('CMO.jpg')
     else
      if MyDBGrid.Fields[0].AsString = 'FF11ff' then
     Image1.Picture.LoadFromFile('Coin.jpg')
     else
      if MyDBGrid.Fields[0].AsString = 'GG11gg' then
     Image1.Picture.LoadFromFile('RRare.jpg')
     else
     if MyDBGrid.Fields[0].AsString = 'HH11hh' then
     Image1.Picture.LoadFromFile('Sword.jpg')
     else
     Image1.Picture.LoadFromFile('default.jpeg');

end;

procedure TFrmMainPage.SpnEdtQuantityWantedChange(Sender: TObject);
begin
if SpnEdtQuantityWanted.Value =1 then
Exit;

if EdtAmountBidding.Text='' then
begin
ShowMessage('Please set the amount you''re bidding first');
SpnEdtQuantityWanted.Value:=1;
Exit;
end;

lblHighestBid.Caption:= 'Highest Bid for this item is: ' + FloatToStrF((highest* SpnEdtQuantityWanted.Value),ffCurrency,20,2)
end;

end.
