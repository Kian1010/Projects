object DataModule2: TDataModule2
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 183
  Width = 345
  object ADOConnection1: TADOConnection
    Left = 24
    Top = 32
  end
  object ADOTable1: TADOTable
    Left = 24
    Top = 88
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 152
    Top = 32
  end
  object DataSource1: TDataSource
    Left = 152
    Top = 88
  end
end
