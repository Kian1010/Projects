unit AdminPage_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, jpeg, ExtCtrls, Spin, Menus,IOUtils;

type
  TFrmAdmin = class(TForm)
    Label1: TLabel;
    SpnEdtBids: TSpinEdit;
    Label2: TLabel;
    EdtBidderName: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    EdtSurname: TEdit;
    EdtBiddingPrice: TEdit;
    Label5: TLabel;
    SpnEdtQuantityWanted: TSpinEdit;
    Label6: TLabel;
    EdtDoBid: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    EdtBiddingNo: TEdit;
    BtnBack: TButton;
    EdtSearch: TEdit;
    Label9: TLabel;
    BtnCLear: TButton;
    BtnUpdate: TButton;
    BtnDelete: TButton;
    BtnAdd: TButton;
    BtnHighestBid: TButton;
    BtnProfit: TButton;
    BtnChangeTbl: TButton;
    DBGBidders: TDBGrid;
    BtnAverage: TButton;
    BtnRemoveLowBids: TButton;
    BtnQuality: TButton;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    HighestBid1: TMenuItem;
    ProfitMade1: TMenuItem;
    AverageSold1: TMenuItem;
    Goodqualityantiques1: TMenuItem;
    Update1: TMenuItem;
    Updaterecord1: TMenuItem;
    ClearFields1: TMenuItem;
    DeleteRecord1: TMenuItem;
    Removelowbids1: TMenuItem;
    File2: TMenuItem;
    Close1: TMenuItem;
    Back1: TMenuItem;
    AddBidder1: TMenuItem;
    btnprintwinners: TButton;
    PrintWinnersendbids1: TMenuItem;
    BtnStats: TButton;
    procedure BtnBackClick(Sender: TObject);
    procedure DBGBiddersCellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure EdtSearchChange(Sender: TObject);
    procedure BtnCLearClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnHighestBidClick(Sender: TObject);
    procedure BtnProfitClick(Sender: TObject);
    procedure BtnChangeTblClick(Sender: TObject);
    procedure BtnAverageClick(Sender: TObject);
    procedure BtnRemoveLowBidsClick(Sender: TObject);
    procedure BtnQualityClick(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure Back1Click(Sender: TObject);
    procedure HighestBid1Click(Sender: TObject);
    procedure ProfitMade1Click(Sender: TObject);
    procedure AverageSold1Click(Sender: TObject);
    procedure Removelowbids1Click(Sender: TObject);
    procedure Goodqualityantiques1Click(Sender: TObject);
    procedure ClearFields1Click(Sender: TObject);
    procedure Updaterecord1Click(Sender: TObject);
    procedure AddBidder1Click(Sender: TObject);
    procedure DeleteRecord1Click(Sender: TObject);
    function Cleared:Boolean;
    procedure FormActivate(Sender: TObject);
    procedure btnprintwinnersClick(Sender: TObject);
    procedure PrintWinnersendbids1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FrmAdmin: TFrmAdmin;

implementation
uses
login_U, DM_U;

{$R *.dfm}

procedure TFrmAdmin.AddBidder1Click(Sender: TObject);
var
     sSql,sBidderName,sSurname,sDateOfBid,sBiddingNo: String;
     iQuantitywanted,iBids:Integer;
     sbiddingPrice:String;
begin
 if Cleared = false then   {checks if all fields are filled, if not then false}
 begin
   ShowMessage('Please fill in all fields');
   Exit;
 end;

//Takes all components data and stores them into the correct variables
iBids:= StrToInt(SpnEdtBids.Text);
sBidderName:= EdtBidderName.Text;
sSurname:= EdtSurname.Text;
sbiddingPrice:= EdtBiddingPrice.Text;
iQuantitywanted :=SpnEdtQuantityWanted.Value;
sBiddingNo:= EdtBiddingNo.Text;
sDateOfBid:= EdtBiddingNo.Text;


    //An Insert SQL statement updates a record according to the Bids, by using the variables as the updated data
    sSql := 'INSERT INTO Bidders(BidderName,Surname,BiddingPrice,Quantitywanted,BiddingNo,DateOfBid) VALUES("'+sBidderName+'", "'+sSurname+'",'+sBiddingPrice+', "'+IntToStr(iQuantitywanted)+'" , "'+sbiddingNo+'" , "'+DateToStr(Now)+'")';

     WITH DataModule1 DO
       BEGIN
             ADOQuery1.Close;
             ADOQuery1.SQL.Clear;
             ADOQuery1.SQL.Add(sSql);
             ADOQuery1.ExecSQL;
             ShowMessage('Record Added');
             TblBidders.Refresh;

             ADOQuery1.Close;
            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add('SELECT * FROM Bidders');
            ADOQuery1.Open;
       END;

end;

procedure TFrmAdmin.AverageSold1Click(Sender: TObject);
begin
WITH DataModule1 DO
       BEGIN
       //calculates the Average sold by an SQL statement
             ADOQuery1.Close;
             ADOQuery1.SQL.Clear;
             ADOQuery1.SQL.Add( 'SELECT FORMAT(AVG(Sellingprice), "Currency") AS [Average Sold] FROM Collectibles');
             ADOQuery1.open;
       END;
end;

procedure TFrmAdmin.Back1Click(Sender: TObject);
begin
Self.Hide;
FrmLogin.Show;  //Goes back to the login form
end;

procedure TFrmAdmin.BtnAddClick(Sender: TObject);
var
     sSql,sBidderName,sSurname,sDateOfBid,sBiddingNo: String;
     iQuantitywanted,iBids:Integer;
     sbiddingPrice:String;
begin
 if Cleared = false then   {checks if all fields are filled, if not then false}
 begin
   ShowMessage('Please fill in all fields');
   Exit;
 end;

//Takes all components data and stores them into the correct variables
iBids:= StrToInt(SpnEdtBids.Text);
sBidderName:= EdtBidderName.Text;
sSurname:= EdtSurname.Text;
sbiddingPrice:= EdtBiddingPrice.Text;
iQuantitywanted :=SpnEdtQuantityWanted.Value;
sBiddingNo:= EdtBiddingNo.Text;
sDateOfBid:= EdtBiddingNo.Text;


    //An Insert SQL statement updates a record according to the Bids, by using the variables as the updated data
    sSql := 'INSERT INTO Bidders(BidderName,Surname,BiddingPrice,Quantitywanted,BiddingNo,DateOfBid) VALUES("'+sBidderName+'", "'+sSurname+'",'+sBiddingPrice+', "'+IntToStr(iQuantitywanted)+'" , "'+sbiddingNo+'" , "'+DateToStr(Now)+'")';

     WITH DataModule1 DO
       BEGIN
             ADOQuery1.Close;
             ADOQuery1.SQL.Clear;
             ADOQuery1.SQL.Add(sSql);
             ADOQuery1.ExecSQL;
             ShowMessage('Record Added');
             TblBidders.Refresh;

             ADOQuery1.Close;
            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add('SELECT * FROM Bidders');
            ADOQuery1.Open;
       END;

end;

procedure TFrmAdmin.BtnAverageClick(Sender: TObject);
begin
 WITH DataModule1 DO
       BEGIN
       //calculates the Average sold by an SQL statement
             ADOQuery1.Close;
             ADOQuery1.SQL.Clear;
             ADOQuery1.SQL.Add( 'SELECT FORMAT(AVG(Sellingprice), "Currency") AS [Average Sold] FROM Collectibles');
             ADOQuery1.open;
       END;
end;

procedure TFrmAdmin.BtnBackClick(Sender: TObject);
begin
Self.Hide;
FrmLogin.Show;  //Goes back to the login form
end;

procedure TFrmAdmin.BtnCLearClick(Sender: TObject);
begin

//Prompts user if they want to clear all components
if  MessageDlg('Are you sure you want to clear all components?', mtConfirmation, [mbYes, mbNo],0) = mrNo then
begin
  Exit;
end;
//clears all GUI components
SpnEdtBids.Value:= 0;
SpnEdtQuantityWanted.Value:=0;
EdtBidderName.Clear;
EdtSurname.Clear;
EdtBiddingPrice.Clear;
EdtDoBid.Clear;
EdtBiddingNo.Clear;
EdtSearch.Clear;

ShowMessage('All fields have been cleared');
end;

procedure TFrmAdmin.BtnDeleteClick(Sender: TObject);
var
sSql,sName:String;
iBids: Integer;
begin
if Cleared = false then    {checks if all fields are filled}
 begin
   ShowMessage('Please fill in all fields');
   Exit;
 end;
Name:= EdtBidderName.Text;
iBids:= SpnEdtBids.Value;

//if nothing is selected it tells the user to click on a record
if iBids = 0 then
begin
ShowMessage('Click on the user you want to delete first');
  Exit;
end;

//prompts the user if they want to relete the record
if  MessageDlg('Are you sure you want to delete ' + name +' with bidding number: ' + IntToStr(iBids), mtConfirmation, [mbYes, mbNo],0) = mrNo then
begin
Exit;
end;

  //deletes the record which the user has selected
sSql:='DELETE * FROM Bidders WHERE Bids = '+IntToStr(iBids)+' ';

  WITH DataModule1 DO
       BEGIN
             ADOQuery1.Close;
             ADOQuery1.SQL.Clear;
             ADOQuery1.SQL.Add(sSql);
             ADOQuery1.ExecSQL;
             ShowMessage('Record deleted');

             ADOQuery1.Close;
            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add('SELECT * FROM Bidders');
            ADOQuery1.Open;
       END;


end;

procedure TFrmAdmin.BtnUpdateClick(Sender: TObject);
var
     sSql,sBidderName,sSurname,sDateOfBid,sBiddingNo: String;
     iQuantitywanted,iBids:Integer;
     sbiddingPrice:String;
begin
if Cleared = false then   {checks if fields are filled }
 begin
   ShowMessage('Please fill in all fields');
   Exit;
 end;

//puts all data into variables
iBids:= StrToInt(SpnEdtBids.Text);
sBidderName:= EdtBidderName.Text;
sSurname:= EdtSurname.Text;
sbiddingPrice:= EdtBiddingPrice.Text;
iQuantitywanted :=SpnEdtQuantityWanted.Value;
sBiddingNo:= EdtBiddingNo.Text;
sDateOfBid:= EdtBiddingNo.Text;

      //updates all records according to the bids, with the data taken from the variables which come from the GUI components
    sSql := 'UPDATE Bidders SET BidderName = "'+sBidderName+'" , Surname = "'+sSurname+'" ,BiddingPrice = '+sBiddingPrice+' ,Quantitywanted = '+IntToStr(iQuantitywanted)+' , BiddingNo= "'+sBiddingNo+'" , DateOfBid = "'+DateToStr(Now)+'" WHERE Bids = '+IntToStr(iBids)+' ';
     WITH DataModule1 DO
       BEGIN
             ADOQuery1.Close;
             ADOQuery1.SQL.Clear;
             ADOQuery1.SQL.Add(sSql);
             ADOQuery1.ExecSQL;
             ShowMessage('Record Updated');

             ADOQuery1.Close;
            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add('SELECT * FROM Bidders');
            ADOQuery1.Open;
       END;

end;

procedure TFrmAdmin.btnprintwinnersClick(Sender: TObject);
var
myfile:TextFile;
ArrWinners: Array[1..10] of string;
rHighest:Real;
sBiddername,sBiddingNo,sSurname,sNextBidNo,sItem:String;
iAmount,iCount,iAmountItems,x:Integer;
Copied:Boolean;
begin
// Biddername#Biddersurname#AmountOfItems#Item#HighestBid#


  with DataModule1 do
        begin
        for X := 1 to 10 do
       BEGIN
         ArrWinners[x]:='';
       END;//for

        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add('SELECT BidderName,Surname,BiddingPrice,'+
        'BiddingNo,Quantitywanted FROM Bidders ORDER BY BiddingNo,BiddingPrice DESC');
        ADOQuery1.Open;
        ADOQuery1.First;
        icount:=0;
        iAmountItems:=1;
        sBiddingNo:= '';


        while not ADOQuery1.Eof do
                begin
                TblCollectibles.First;

           if ADOQuery1['BiddingNo'] <> sBiddingNo then
              begin
              icount:=0;
              end;//if

           if icount=0then
                  begin
           sBiddername:= ADOQuery1['BidderName'];
           sSurname:= ADOQuery1['Surname'];
           iAmount:= ADOQuery1['Quantitywanted'];
           rhighest:= ADOQuery1['BiddingPrice'];
           sBiddingNo:= ADOQuery1['BiddingNo'];

                 while not TblCollectibles.Eof do
                        begin
          if TblCollectibles['BiddingNo'] = sBiddingNo then
                          begin
                    sItem:= TblCollectibles['Item'];
                          end;//if
                    TblCollectibles.Next;
                        end;//while

              ArrWinners[iAmountItems]:= sBiddername+ '#'+ sSurname+'#'+IntToStr(iAmount)+'#'+ sItem+'#' +FloatToStrF(rHighest,ffCurrency,20,2) ;
                 iAmountItems:= iAmountItems+1;
                end; //if count=0

           iCount:=iCount+1;
           ADOQuery1.Next;
           end;//while
                end;//with
     Rewrite(myfile, 'Winners.txt');

       for x := 1 to 10 do
             begin
      Writeln(myfile,ArrWinners[x]);
             end;
       CloseFile(myfile);
       ShowMessage('Winners have been declared');

       if MessageDlg('Delete all bidders?',mtConfirmation,mbYesNo,0) = mrYes then
         begin
         With DataModule1 do
         begin
         ADOQuery1.Close;
         ADOQuery1.SQL.Clear;
         ADOQuery1.SQL.Add('DELETE * FROM Bidders');
         ADOQuery1.ExecSQL;
         ShowMessage('Bidders table cleared');

         end;//with

         end//if
         else
         begin
         {CopyFile(ExtractFilePath(ParamStr(0)) + 'Collectibles.mdb' , extractFilePath(ParamStr(0)) + 'Backup', Copied);
                           if Copied then
                             ShowMessage('sucessful')
                             else
                             ShowMessage('Failed');
          }
         end;///else

end;

function TFrmAdmin.Cleared: Boolean;
begin
Result:= True; {function to check if all fields are blank or not}

if (EdtBidderName.Text = '') or (EdtSurname.Text = '')or
 (EdtBiddingPrice.Text = '') or(EdtDoBid.Text = '') or
 (EdtBiddingNo.Text = '') or(SpnEdtQuantityWanted.Value = 0) then
 begin
 Result:= False;
 end;

end;

procedure TFrmAdmin.ClearFields1Click(Sender: TObject);
begin
//Prompts user if they want to clear all components
if  MessageDlg('Are you sure you want to clear all components?', mtConfirmation, [mbYes, mbNo],0) = mrNo then
begin
  Exit;
end;
//clears all GUI components
SpnEdtBids.Value:= 0;
SpnEdtQuantityWanted.Value:=0;
EdtBidderName.Clear;
EdtSurname.Clear;
EdtBiddingPrice.Clear;
EdtDoBid.Clear;
EdtBiddingNo.Clear;
EdtSearch.Clear;

ShowMessage('All fields have been cleared');
end;

procedure TFrmAdmin.Close1Click(Sender: TObject);
begin
{ User friendly message for the teacher viewing my project. }

if  MessageDlg('Are you sure you want to exit?', mtConfirmation, [mbYes, mbNo],0) = mrYes then
begin
ShowMessage('Thank You for Viewing the project done by Kian Naidu, Have a good day');
Close;
end;
end;

procedure TFrmAdmin.BtnQualityClick(Sender: TObject);
begin
  WITH DataModule1 DO
       BEGIN
       // Dsplays all the good quality items that are antiques
             ADOQuery1.Close;
             ADOQuery1.SQL.Clear;
           ADOQuery1.SQL.Add('SELECT BiddingNo,Item FROM Collectibles WHERE ([Item status] = "Good") AND (Antique = TRUE)');
             ADOQuery1.Open;
       END;
end;

procedure TFrmAdmin.BtnRemoveLowBidsClick(Sender: TObject);
begin
 WITH DataModule1 DO
       BEGIN
       // Deletes the bidders who have bid less than the selling price
             ADOQuery1.Close;
             ADOQuery1.SQL.Clear;
           ADOQuery1.SQL.Add('DELETE * FROM Bidders WHERE EXISTS(SELECT * FROM Collectibles WHERE (Bidders.BiddingNo = Collectibles.BiddingNo) AND (Bidders.BiddingPrice < Collectibles.Sellingprice) )');
             ADOQuery1.ExecSQL;
             ShowMessage('All obsolete records have been removed');

             ADOQuery1.Close;
            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add('SELECT * FROM Bidders');
            ADOQuery1.Open;
       END;
end;

procedure TFrmAdmin.BtnChangeTblClick(Sender: TObject);
begin
DBGBidders.DataSource:= DataModule1.dsCollectibles; //changes the DB Grids table to the collectibles table
end;

procedure TFrmAdmin.BtnHighestBidClick(Sender: TObject);
begin
//sorts the records in descending order
  WITH DataModule1 DO
       BEGIN
             ADOQuery1.Close;
             ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add('SELECT BidderName,Surname,BiddingPrice,BiddingNo,Quantitywanted FROM Bidders ORDER BY BiddingNo,BiddingPrice DESC');

             ADOQuery1.open;

       END;

end;

procedure TFrmAdmin.BtnProfitClick(Sender: TObject);
begin

 WITH DataModule1 DO
       BEGIN
       //calculates the total profit by subtracting the sellingprice by the original cost
             ADOQuery1.Close;
             ADOQuery1.SQL.Clear;
             ADOQuery1.SQL.Add('SELECT Format(Sum(Sellingprice - Originalcost), "Currency") AS Profit FROM Collectibles');
             ADOQuery1.open;
       END;
end;

procedure TFrmAdmin.DBGBiddersCellClick(Column: TColumn);
var
    sSt,sSql,sSrch,sTempName: String;
begin
    sSt := DBGBidders.fields[1].AsString;//Takes the value from the SECOND field of the row the user clicks and stores it into a variable
    edtSearch.Text := sSt; // Takes the value from the table and puts it into the GUI component
     // searches for all bidders according to the second field, which is the NAME
    sSql := 'SELECT * FROM Bidders WHERE BidderName = "'+sSt+'"';


     WITH DataModule1 DO
       BEGIN
            ADOQuery1.Close;
            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add(sSql);
            ADOQuery1.Open;
            ADOQuery1.First;
         EdtBiddingNo.Text := IntToSTr(ADOQuery1.MaxRecords);

           while NOT(ADOQuery1.Eof) do
              begin
              sTempName:= ADOQuery1['BidderName'];

//if the record matches what the user has clicked, then ALL the GUI components
//get filled with the information from the database
                      if UpperCase(sTempName) = Uppercase(sSt) then
                      begin

                   SpnEdtBids.Value :=  ADOQuery1.FindField('Bids').AsInteger;
                   EdtBidderName.Text:= ADOQuery1.FindField('BidderName').AsString;
                   EdtSurname.Text:= ADOQuery1.FindField('Surname').AsString;
                   EdtBiddingPrice.Text:= ADOQuery1.FindField('BiddingPrice').AsString;
                   SpnEdtQuantityWanted.Value:= ADOQuery1.FindField('Quantitywanted').AsInteger;
                   EdtBiddingNo.Text:= ADOQuery1.FindField('BiddingNo').AsString;
                   EdtDoBid.Text:= ADOQuery1.FindField('DateOfBid').AsString;
                   ADOQuery1.Last;
                      end;

                   ADOQuery1.Next;//Moves the pointer to the next row
                   End;//while
       END;//with

//takes what the user has typed in the search bar and assigns it to a variable
           sSrch := edtSearch.Text;

       //searches for whatever the user has typed, with a wildcard at the
       //end to show all possible bidders
     sSql := 'SELECT * FROM Bidders WHERE BidderName LIKE "'+sSrch+'%"';
     WITH DataModule1 DO
       BEGIN
            ADOQuery1.Close;
            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add(sSql);
            ADOQuery1.Open;
            dsBidders.DataSet := ADOQuery1;
            DBGBidders.DataSource := dsBidders;


            ADOQuery1.Close;
            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add('SELECT * FROM Bidders');
            ADOQuery1.Open;
       END;



end;

procedure TFrmAdmin.DeleteRecord1Click(Sender: TObject);
var
sSql,sName:String;
iBids: Integer;
begin
if Cleared = false then    {checks if all fields are filled}
 begin
   ShowMessage('Please fill in all fields');
   Exit;
 end;
Name:= EdtBidderName.Text;
iBids:= SpnEdtBids.Value;

//if nothing is selected it tells the user to click on a record
if iBids = 0 then
begin
ShowMessage('Click on the user you want to delete first');
  Exit;
end;

//prompts the user if they want to relete the record
if  MessageDlg('Are you sure you want to delete ' + name +' with bidding number: ' + IntToStr(iBids), mtConfirmation, [mbYes, mbNo],0) = mrNo then
begin
Exit;
end;

  //deletes the record which the user has selected
sSql:='DELETE * FROM Bidders WHERE Bids = '+IntToStr(iBids)+' ';

  WITH DataModule1 DO
       BEGIN
             ADOQuery1.Close;
             ADOQuery1.SQL.Clear;
             ADOQuery1.SQL.Add(sSql);
             ADOQuery1.ExecSQL;
             ShowMessage('Record deleted');

             ADOQuery1.Close;
            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add('SELECT * FROM Bidders');
            ADOQuery1.Open;
       END;

end;

procedure TFrmAdmin.EdtSearchChange(Sender: TObject);
var
    sSrch,sSql : String;
begin
       sSrch := EdtSearch.Text;

       //Each time the user types, the code executes to check for all users who
       //have those starting characters, with a wildcard at the end
     sSql := 'SELECT * FROM Bidders WHERE BidderName LIKE "'+sSrch+'%"';

     WITH DataModule1 DO
       BEGIN
            ADOQuery1.Close;
            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add(sSql);
            ADOQuery1.Open;
            dsBidders.DataSet := ADOQuery1;
            DBGBidders.DataSource := dsBidders;
       END;

end;

procedure TFrmAdmin.FormActivate(Sender: TObject);
begin
BtnStats.Enabled:= False;
 WITH DataModule1 DO {When form activates the bidders are loaded into the DBGrid}
       BEGIN
       ADOQuery1.Close;
            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add('SELECT * FROM Bidders');
            ADOQuery1.Open;
            dsCollectibles.DataSet := ADOQuery1;
            DBGBidders.DataSource := dsCollectibles;
       END;
end;

procedure TFrmAdmin.FormCreate(Sender: TObject);
begin
 DBGBidders.DataSource:= DataModule1.dsBidders;
end;

procedure TFrmAdmin.Goodqualityantiques1Click(Sender: TObject);
begin
WITH DataModule1 DO
       BEGIN
       // Dsplays all the good quality items that are antiques
             ADOQuery1.Close;
             ADOQuery1.SQL.Clear;
           ADOQuery1.SQL.Add('SELECT BiddingNo,Item FROM Collectibles WHERE ([Item status] = "Good") AND (Antique = TRUE)');
             ADOQuery1.Open;
       END;
end;

procedure TFrmAdmin.HighestBid1Click(Sender: TObject);
begin
//sorts the records in descending order
  WITH DataModule1 DO
       BEGIN
             ADOQuery1.Close;
             ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add('SELECT BidderName,Surname,BiddingPrice,BiddingNo,Quantitywanted FROM Bidders ORDER BY BiddingNo,BiddingPrice DESC');

             ADOQuery1.open;

       END;
end;

procedure TFrmAdmin.PrintWinnersendbids1Click(Sender: TObject);
var
myfile:TextFile;
ArrWinners: Array[1..10] of string;
rHighest:Real;
sBiddername,sBiddingNo,sSurname,sNextBidNo,sItem:String;
iAmount,iCount,iAmountItems,x:Integer;
begin
// Biddername#Biddersurname#AmountOfItems#Item#HighestBid#


  with DataModule1 do
        begin
        for X := 1 to 10 do
       BEGIN
         ArrWinners[x]:='';
       END;//for

        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add('SELECT BidderName,Surname,BiddingPrice,'+
        'BiddingNo,Quantitywanted FROM Bidders ORDER BY BiddingNo,BiddingPrice DESC');
        ADOQuery1.Open;
        ADOQuery1.First;
        icount:=0;
        iAmountItems:=1;
        sBiddingNo:= '';


        while not ADOQuery1.Eof do
                begin
                TblCollectibles.First;

           if ADOQuery1['BiddingNo'] <> sBiddingNo then
              begin
              icount:=0;
              end;//if

           if icount=0then
                  begin
           sBiddername:= ADOQuery1['BidderName'];
           sSurname:= ADOQuery1['Surname'];
           iAmount:= ADOQuery1['Quantitywanted'];
           rhighest:= ADOQuery1['BiddingPrice'];
           sBiddingNo:= ADOQuery1['BiddingNo'];

                 while not TblCollectibles.Eof do
                        begin
          if TblCollectibles['BiddingNo'] = sBiddingNo then
                          begin
                    sItem:= TblCollectibles['Item'];
                          end;//if
                    TblCollectibles.Next;
                        end;//while

              ArrWinners[iAmountItems]:= sBiddername+ '#'+ sSurname+'#'+IntToStr(iAmount)+'#'+ sItem+'#' +FloatToStrF(rHighest,ffCurrency,20,2) ;
                 iAmountItems:= iAmountItems+1;
                end; //if count=0

           iCount:=iCount+1;
           ADOQuery1.Next;
           end;//while
                end;//with
     Rewrite(myfile, 'Winners.txt');

       for x := 1 to 10 do
             begin
      Writeln(myfile,ArrWinners[x]);
             end;
       CloseFile(myfile);
       ShowMessage('Winners have been declared');

end;

procedure TFrmAdmin.ProfitMade1Click(Sender: TObject);
begin
WITH DataModule1 DO
       BEGIN
       //calculates the total profit by subtracting the sellingprice by the original cost
             ADOQuery1.Close;
             ADOQuery1.SQL.Clear;
             ADOQuery1.SQL.Add('SELECT Format(Sum(Sellingprice - Originalcost), "Currency") AS Profit FROM Collectibles');
             ADOQuery1.open;
       END;
end;

procedure TFrmAdmin.Removelowbids1Click(Sender: TObject);
begin
WITH DataModule1 DO
       BEGIN
       // Deletes the bidders who have bid less than the selling price
             ADOQuery1.Close;
             ADOQuery1.SQL.Clear;
           ADOQuery1.SQL.Add('DELETE * FROM Bidders WHERE EXISTS(SELECT * FROM Collectibles WHERE (Bidders.BiddingNo = Collectibles.BiddingNo) AND (Bidders.BiddingPrice < Collectibles.Sellingprice) )');
             ADOQuery1.ExecSQL;
             ShowMessage('All obsolete records have been removed');

             ADOQuery1.Close;
            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add('SELECT * FROM Bidders');
            ADOQuery1.Open;
       END;
end;

procedure TFrmAdmin.Updaterecord1Click(Sender: TObject);
var
     sSql,sBidderName,sSurname,sDateOfBid,sBiddingNo: String;
     iQuantitywanted,iBids:Integer;
     sBiddingPrice:String;
begin
if Cleared = false then   {checks if fields are filled }
 begin
   ShowMessage('Please fill in all fields');
   Exit;
 end;

//puts all data into variables
iBids:= StrToInt(SpnEdtBids.Text);
sBidderName:= EdtBidderName.Text;
sSurname:= EdtSurname.Text;
sbiddingPrice:= EdtBiddingPrice.Text;
iQuantitywanted :=SpnEdtQuantityWanted.Value;
sBiddingNo:= EdtBiddingNo.Text;
sDateOfBid:= EdtBiddingNo.Text;

      //updates all records according to the bids, with the data taken from the variables which come from the GUI components
    sSql := 'UPDATE Bidders SET BidderName = "'+sBidderName+'" , Surname = "'+sSurname+'" ,BiddingPrice = '+sBiddingPrice+' ,Quantitywanted = '+IntToStr(iQuantitywanted)+' , BiddingNo= "'+sBiddingNo+'" , DateOfBid = "'+DateToStr(Now)+'" WHERE Bids = '+IntToStr(iBids)+' ';
     WITH DataModule1 DO
       BEGIN
             ADOQuery1.Close;
             ADOQuery1.SQL.Clear;
             ADOQuery1.SQL.Add(sSql);
             ADOQuery1.ExecSQL;
             ShowMessage('Record Updated');

             ADOQuery1.Close;
            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add('SELECT * FROM Bidders');
            ADOQuery1.Open;
       END;

end;

end.
