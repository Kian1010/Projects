unit DMUnit;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDataModule2 = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule2: TDataModule2;

implementation

{$R *.dfm}

procedure TDataModule2.DataModuleCreate(Sender: TObject);
begin
   ADOConnection1.Close;

   ADOConnection1.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' + ExtractFilePath(ParamStr(0)) + 'Mydatabase.mdb' + ';Persist Security Info=FALSE';

   ADOConnection1.LoginPrompt := FALSE;
   ADOConnection1.Open;

   ADOTable1.Connection := ADOConnection1;

   ADOQuery1.Connection := ADOConnection1;
   ADOTable1.TableName := 'Candy';

   DataSource1.DataSet := ADOQuery1;
end;

end.
