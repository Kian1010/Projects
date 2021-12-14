object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 508
  ClientWidth = 763
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 56
    Top = 376
    Width = 96
    Height = 24
    Caption = 'Enter Food'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LstBx: TListBox
    Left = 192
    Top = 48
    Width = 273
    Height = 185
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 24
    Items.Strings = (
      'Coca Cola'
      'Red Bull'
      'Milkshake'
      'Chicken'
      'Beef'
      'Milk'
      'Eggs'
      'Water'
      'Sweets')
    ParentFont = False
    TabOrder = 0
    OnClick = LstBxClick
  end
  object EdtFoods: TEdit
    Left = 184
    Top = 376
    Width = 225
    Height = 32
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object Button1: TButton
    Left = 208
    Top = 288
    Width = 153
    Height = 49
    Caption = 'Add On'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button1Click
  end
  object MemDisplay: TMemo
    Left = 528
    Top = 56
    Width = 201
    Height = 161
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
end
