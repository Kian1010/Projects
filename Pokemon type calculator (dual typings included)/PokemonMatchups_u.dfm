object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 489
  ClientWidth = 687
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
    Left = 112
    Top = 8
    Width = 323
    Height = 33
    Caption = 'Select First Pokemon Type:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 112
    Top = 146
    Width = 240
    Height = 33
    Caption = 'Select Second Type:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ComboBox1: TComboBox
    Left = 112
    Top = 69
    Width = 387
    Height = 41
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = 'Choose Primary Type'
    Items.Strings = (
      'Normal'
      'Fighting'
      'Flying'
      'Poison'
      'Ground'
      'Rock'
      'Bug'
      'Ghost'
      'Steel'
      'Fire'
      'Water'
      'Grass'
      'Electric'
      'Psychic'
      'Ice'
      'Dragon'
      'Dark'
      'Fairy')
  end
  object ComboBox2: TComboBox
    Left = 112
    Top = 197
    Width = 387
    Height = 41
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = 'Choose Secondary Type'
    Items.Strings = (
      'None'
      'Normal'
      'Fighting'
      'Flying'
      'Poison'
      'Ground'
      'Rock'
      'Bug'
      'Ghost'
      'Steel'
      'Fire'
      'Water'
      'Grass'
      'Electric'
      'Psychic'
      'Ice'
      'Dragon'
      'Dark'
      'Fairy')
  end
  object Button1: TButton
    Left = 240
    Top = 256
    Width = 137
    Height = 49
    Caption = 'Calculate'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 24
    Top = 311
    Width = 633
    Height = 162
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
end
