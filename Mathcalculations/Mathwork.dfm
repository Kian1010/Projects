object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 460
  ClientWidth = 781
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
    Left = 512
    Top = 144
    Width = 210
    Height = 24
    Caption = 'Enter An Integer Value:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object RedOutput: TRichEdit
    Left = 16
    Top = 120
    Width = 465
    Height = 265
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      
        'Integer Value                    Even Or Odd                    ' +
        'No Of Digits                     Sum Of Factors')
    ParentFont = False
    TabOrder = 0
  end
  object PnlDescription: TPanel
    Left = 64
    Top = 8
    Width = 601
    Height = 89
    Caption = 'Mathematic Integer Processor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object BtBtnReset: TBitBtn
    Left = 24
    Top = 408
    Width = 145
    Height = 33
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = bkRetry
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 2
    OnClick = BtBtnResetClick
  end
  object BtBtnClose: TBitBtn
    Left = 232
    Top = 408
    Width = 169
    Height = 33
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = bkClose
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 3
  end
  object BtnCalc: TButton
    Left = 536
    Top = 233
    Width = 145
    Height = 41
    Caption = 'Calculate'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = BtnCalcClick
  end
  object BtnLarge: TButton
    Left = 536
    Top = 288
    Width = 145
    Height = 41
    Caption = 'Large'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = BtnLargeClick
  end
  object EdtNumber: TEdit
    Left = 496
    Top = 184
    Width = 241
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
end
