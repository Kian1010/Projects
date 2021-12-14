object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 471
  Width = 680
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=E:\GRADE 12 PAT KIA' +
      'N NAIDU\Collectibles.mdb;Persist Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 336
    Top = 112
  end
  object TblBidders: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Bidders'
    Left = 200
    Top = 200
    object TblBiddersBids: TAutoIncField
      FieldName = 'Bids'
      ReadOnly = True
    end
    object TblBiddersBidderName: TWideStringField
      FieldName = 'BidderName'
      Size = 50
    end
    object TblBiddersSurname: TWideStringField
      FieldName = 'Surname'
      Size = 50
    end
    object TblBiddersBiddingPrice: TBCDField
      FieldName = 'BiddingPrice'
      DisplayFormat = '"R0.00"'
      currency = True
      Precision = 19
    end
    object TblBiddersQuantitywanted: TIntegerField
      FieldName = 'Quantitywanted'
    end
    object TblBiddersBiddingNo: TWideStringField
      FieldName = 'BiddingNo'
      Size = 6
    end
    object TblBiddersDateOfBid: TDateTimeField
      FieldName = 'DateOfBid'
    end
  end
  object TblCollectibles: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Collectibles'
    Left = 344
    Top = 200
    object TblCollectiblesBiddingNo: TWideStringField
      FieldName = 'BiddingNo'
      Size = 6
    end
    object TblCollectiblesItem: TWideStringField
      FieldName = 'Item'
    end
    object TblCollectiblesItemType: TWideStringField
      FieldName = 'ItemType'
      Size = 40
    end
    object TblCollectiblesSellingprice: TBCDField
      FieldName = 'Sellingprice'
      currency = True
      Precision = 19
    end
    object TblCollectiblesDateCreated: TDateTimeField
      FieldName = 'DateCreated'
    end
    object TblCollectiblesManufacturedBy: TWideStringField
      FieldName = 'ManufacturedBy'
      Size = 30
    end
    object TblCollectiblesQuantityLeft: TIntegerField
      FieldName = 'QuantityLeft'
    end
    object TblCollectiblesItemstatus: TWideStringField
      FieldName = 'Item status'
      Size = 9
    end
    object TblCollectiblesAntique: TBooleanField
      FieldName = 'Antique'
    end
  end
  object dsBidders: TDataSource
    Left = 200
    Top = 264
  end
  object dsCollectibles: TDataSource
    Left = 344
    Top = 264
  end
  object DataSource3: TDataSource
    Left = 472
    Top = 264
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 472
    Top = 200
  end
end
