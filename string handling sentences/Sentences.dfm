object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 514
  ClientWidth = 772
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
    Left = 232
    Top = 8
    Width = 257
    Height = 25
    Caption = 'String Handling Data Types'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object BtnChar: TButton
    Left = 104
    Top = 104
    Width = 113
    Height = 41
    Caption = 'Amount of Characters'
    TabOrder = 0
    OnClick = BtnCharClick
  end
  object MemDisplay: TMemo
    Left = 104
    Top = 224
    Width = 521
    Height = 225
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object EdtWord: TEdit
    Left = 104
    Top = 48
    Width = 521
    Height = 32
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object BtnLines: TButton
    Left = 104
    Top = 161
    Width = 113
    Height = 41
    Caption = 'Letters on each line'
    TabOrder = 3
    OnClick = BtnLinesClick
  end
  object BtnWords: TButton
    Left = 376
    Top = 161
    Width = 113
    Height = 41
    Caption = 'Amount Of Words'
    TabOrder = 4
    OnClick = BtnWordsClick
  end
  object BtnBkwards: TButton
    Left = 240
    Top = 161
    Width = 113
    Height = 41
    Caption = 'Backwards'
    TabOrder = 5
    OnClick = BtnBkwardsClick
  end
  object BtnVowel: TButton
    Left = 240
    Top = 104
    Width = 113
    Height = 41
    Caption = 'Vowels'
    TabOrder = 6
    OnClick = BtnVowelClick
  end
  object BtnPall: TButton
    Left = 376
    Top = 104
    Width = 113
    Height = 41
    Caption = 'Pallendium?'
    TabOrder = 7
    OnClick = BtnPallClick
  end
  object BtnBkward: TButton
    Left = 512
    Top = 104
    Width = 113
    Height = 41
    Caption = 'Backwards'
    TabOrder = 8
    OnClick = BtnBkwardClick
  end
  object BitBtn1: TBitBtn
    Left = 512
    Top = 161
    Width = 113
    Height = 41
    DoubleBuffered = True
    Kind = bkClose
    ParentDoubleBuffered = False
    TabOrder = 9
  end
  object Button1: TButton
    Left = 640
    Top = 104
    Width = 105
    Height = 41
    Caption = 'Clear'
    TabOrder = 10
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 640
    Top = 161
    Width = 105
    Height = 41
    Caption = '3 letters forward'
    TabOrder = 11
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 12
    OnClick = Button3Click
  end
end
