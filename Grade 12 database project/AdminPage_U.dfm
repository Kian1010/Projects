object FrmAdmin: TFrmAdmin
  Left = 0
  Top = 0
  Caption = 'Admin'
  ClientHeight = 529
  ClientWidth = 782
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 290
    Top = 0
    Width = 173
    Height = 40
    Caption = 'Admin Page'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 13
    Top = 291
    Width = 109
    Height = 23
    Caption = 'Bidder Name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 13
    Top = 243
    Width = 34
    Height = 23
    Caption = 'Bids'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 13
    Top = 339
    Width = 76
    Height = 23
    Caption = 'Surname'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 13
    Top = 395
    Width = 109
    Height = 23
    Caption = 'Bidding Price'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 448
    Top = 243
    Width = 138
    Height = 23
    Caption = 'Quantity wanted'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 448
    Top = 291
    Width = 92
    Height = 23
    Caption = 'Bidding No'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 448
    Top = 339
    Width = 96
    Height = 23
    Caption = 'Date Of Bid'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 281
    Top = 169
    Width = 154
    Height = 23
    Caption = 'Search for bidder:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object SpnEdtBids: TSpinEdit
    Left = 152
    Top = 240
    Width = 121
    Height = 33
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxValue = 0
    MinValue = 0
    ParentFont = False
    TabOrder = 1
    Value = 0
  end
  object EdtBidderName: TEdit
    Left = 152
    Top = 291
    Width = 121
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object EdtSurname: TEdit
    Left = 152
    Top = 339
    Width = 121
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object EdtBiddingPrice: TEdit
    Left = 152
    Top = 395
    Width = 121
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object SpnEdtQuantityWanted: TSpinEdit
    Left = 624
    Top = 240
    Width = 121
    Height = 33
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxValue = 0
    MinValue = 0
    ParentFont = False
    TabOrder = 5
    Value = 0
  end
  object EdtDoBid: TEdit
    Left = 624
    Top = 339
    Width = 121
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object EdtBiddingNo: TEdit
    Left = 624
    Top = 291
    Width = 121
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object BtnBack: TButton
    Left = 17
    Top = 488
    Width = 105
    Height = 33
    Caption = '<--- Back'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = BtnBackClick
  end
  object EdtSearch: TEdit
    Left = 256
    Top = 198
    Width = 201
    Height = 31
    Hint = 'Displays bidders as you type'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnChange = EdtSearchChange
  end
  object BtnCLear: TButton
    Left = 184
    Top = 488
    Width = 97
    Height = 33
    Caption = 'Clear'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = BtnCLearClick
  end
  object BtnUpdate: TButton
    Left = 320
    Top = 488
    Width = 97
    Height = 33
    Caption = 'Update'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    OnClick = BtnUpdateClick
  end
  object BtnDelete: TButton
    Left = 624
    Top = 488
    Width = 97
    Height = 33
    Caption = 'Delete'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    OnClick = BtnDeleteClick
  end
  object BtnAdd: TButton
    Left = 478
    Top = 488
    Width = 97
    Height = 33
    Caption = 'Add'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    OnClick = BtnAddClick
  end
  object BtnHighestBid: TButton
    Left = 290
    Top = 243
    Width = 145
    Height = 28
    Caption = 'Sort by highest bid'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 13
    OnClick = BtnHighestBidClick
  end
  object BtnProfit: TButton
    Left = 290
    Top = 290
    Width = 145
    Height = 30
    Caption = 'Profit made'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 14
    OnClick = BtnProfitClick
  end
  object BtnChangeTbl: TButton
    Left = 17
    Top = 190
    Width = 105
    Height = 27
    Hint = 'Shows the collectibles table'
    Caption = 'Collectibles'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 18
    Visible = False
    OnClick = BtnChangeTblClick
  end
  object DBGBidders: TDBGrid
    Left = 8
    Top = 37
    Width = 764
    Height = 126
    DataSource = DataModule1.dsBidders
    TabOrder = 19
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGBiddersCellClick
  end
  object BtnAverage: TButton
    Left = 290
    Top = 339
    Width = 145
    Height = 28
    Caption = 'Average sold'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 15
    OnClick = BtnAverageClick
  end
  object BtnRemoveLowBids: TButton
    Left = 290
    Top = 387
    Width = 145
    Height = 31
    Caption = 'Remove low bids'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 16
    OnClick = BtnRemoveLowBidsClick
  end
  object BtnQuality: TButton
    Left = 266
    Top = 440
    Width = 191
    Height = 31
    Caption = 'Find good quality antiques'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 17
    OnClick = BtnQualityClick
  end
  object btnprintwinners: TButton
    Left = 512
    Top = 169
    Width = 217
    Height = 32
    Caption = 'Print winners && end bids'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 20
    OnClick = btnprintwinnersClick
  end
  object BtnStats: TButton
    Left = 573
    Top = 205
    Width = 117
    Height = 29
    Caption = 'Show Stats'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 21
    Visible = False
  end
  object MainMenu1: TMainMenu
    object File2: TMenuItem
      Caption = 'File'
      object Back1: TMenuItem
        Caption = 'Go back'
        OnClick = Back1Click
      end
      object Close1: TMenuItem
        Caption = 'Close '
        OnClick = Close1Click
      end
      object PrintWinnersendbids1: TMenuItem
        Caption = 'Print Winners and end bids'
        OnClick = PrintWinnersendbids1Click
      end
    end
    object File1: TMenuItem
      Caption = 'Find'
      object HighestBid1: TMenuItem
        Caption = 'Highest Bid'
        OnClick = HighestBid1Click
      end
      object ProfitMade1: TMenuItem
        Caption = 'Profit Made'
        OnClick = ProfitMade1Click
      end
      object AverageSold1: TMenuItem
        Caption = 'Average Sold'
        OnClick = AverageSold1Click
      end
      object Goodqualityantiques1: TMenuItem
        Caption = 'Good quality antiques'
        OnClick = Goodqualityantiques1Click
      end
    end
    object Update1: TMenuItem
      Caption = 'Edit'
      object AddBidder1: TMenuItem
        Caption = 'Add Bidder'
        OnClick = AddBidder1Click
      end
      object ClearFields1: TMenuItem
        Caption = 'Clear Fields'
        ShortCut = 16451
        OnClick = ClearFields1Click
      end
      object Updaterecord1: TMenuItem
        Caption = 'Update record'
        ShortCut = 16469
        OnClick = Updaterecord1Click
      end
      object DeleteRecord1: TMenuItem
        Caption = 'Delete Record'
        ShortCut = 16452
        OnClick = DeleteRecord1Click
      end
      object Removelowbids1: TMenuItem
        Caption = 'Remove low bids'
        OnClick = Removelowbids1Click
      end
    end
  end
end
