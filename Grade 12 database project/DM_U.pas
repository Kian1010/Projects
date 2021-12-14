unit DM_U;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDataModule1 = class(TDataModule)
    ADOConnection1: TADOConnection;
    TblBidders: TADOTable;
    TblCollectibles: TADOTable;
    dsBidders: TDataSource;
    dsCollectibles: TDataSource;
    DataSource3: TDataSource;
    ADOQuery1: TADOQuery;
    TblCollectiblesSellingprice: TBCDField;
    TblCollectiblesBiddingNo: TWideStringField;
    TblCollectiblesItem: TWideStringField;
    TblCollectiblesItemType: TWideStringField;
    TblCollectiblesDateCreated: TDateTimeField;
    TblCollectiblesManufacturedBy: TWideStringField;
    TblCollectiblesItemstatus: TWideStringField;
    TblCollectiblesAntique: TBooleanField;
    TblBiddersBids: TAutoIncField;
    TblBiddersBidderName: TWideStringField;
    TblBiddersSurname: TWideStringField;
    TblBiddersBiddingPrice: TBCDField;
    TblBiddersQuantitywanted: TIntegerField;
    TblBiddersBiddingNo: TWideStringField;
    TblBiddersDateOfBid: TDateTimeField;
    TblCollectiblesQuantityLeft: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
   ADOConnection1.Close;

   ADOConnection1.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='
   + ExtractFilePath(ParamStr(0)) + 'Collectibles.mdb' + ';Persist Security Info=FALSE';

   ADOConnection1.LoginPrompt := FALSE;
   ADOConnection1.Open;

   TblBidders.Connection := ADOConnection1;
   TblCollectibles.Connection := ADOConnection1;
   ADOQuery1.Connection:= ADOConnection1;

   TblBidders.TableName := 'Bidders';
   TblCollectibles.TableName := 'Collectibles' ;

   dsBidders.DataSet:= TblBidders;
   dsCollectibles.DataSet:= TblCollectibles;
   DataSource3.DataSet:= ADOQuery1;

   TblBidders.Active:= True;
   TblCollectibles.Active:= True;
end;

end.
