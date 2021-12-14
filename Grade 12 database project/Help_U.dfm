object FrmHelp: TFrmHelp
  Left = 0
  Top = 0
  Caption = 'Help'
  ClientHeight = 441
  ClientWidth = 680
  Color = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TabbedNotebook1: TTabbedNotebook
    Left = 55
    Top = 0
    Width = 626
    Height = 441
    TabFont.Charset = DEFAULT_CHARSET
    TabFont.Color = clBtnText
    TabFont.Height = -15
    TabFont.Name = 'Tahoma'
    TabFont.Style = []
    TabOrder = 0
    OnClick = TabbedNotebook1Click
    object TTabPage
      Left = 4
      Top = 24
      Caption = 'Welcome'
      object RedWelcome: TRichEdit
        Left = 16
        Top = 16
        Width = 593
        Height = 388
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object TTabPage
      Left = 4
      Top = 24
      Caption = 'Not loging in?'
      object RedLogging: TRichEdit
        Left = 16
        Top = 8
        Width = 593
        Height = 396
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object TTabPage
      Left = 4
      Top = 24
      Caption = 'Bids not showing up?'
      object RedBids: TRichEdit
        Left = 16
        Top = 24
        Width = 593
        Height = 380
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object TTabPage
      Left = 4
      Top = 24
      Caption = 'Error messages?'
      object RedErr: TRichEdit
        Left = 16
        Top = 8
        Width = 593
        Height = 396
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  object BtnBack: TButton
    Left = 0
    Top = 0
    Width = 57
    Height = 441
    Caption = ' Back'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = BtnBackClick
  end
end
