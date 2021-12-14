object FrmRegister: TFrmRegister
  Left = 0
  Top = 0
  Caption = 'Registration'
  ClientHeight = 530
  ClientWidth = 752
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 227
    Top = 8
    Width = 275
    Height = 37
    Caption = 'Registration page'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'Lucida Calligraphy'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 192
    Top = 59
    Width = 334
    Height = 25
    Caption = 'First time here? you'#39'll love this app!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Image1: TImage
    Left = 448
    Top = 103
    Width = 296
    Height = 410
    Stretch = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 103
    Width = 433
    Height = 410
    Color = clActiveCaption
    ParentBackground = False
    TabOrder = 0
    object Label3: TLabel
      Left = 32
      Top = 59
      Width = 164
      Height = 25
      Caption = 'Enter your name:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 32
      Top = 267
      Width = 152
      Height = 25
      Caption = 'Enter password:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 32
      Top = 163
      Width = 137
      Height = 25
      Caption = 'Email address:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 91
      Top = 9
      Width = 266
      Height = 25
      Caption = 'Enter your details to sign up'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 32
      Top = 110
      Width = 193
      Height = 25
      Caption = 'Enter your surname:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 32
      Top = 313
      Width = 183
      Height = 25
      Caption = 'Re-enter password:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 32
      Top = 216
      Width = 156
      Height = 25
      Caption = 'Enter username:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object EdtName: TEdit
      Left = 243
      Top = 56
      Width = 174
      Height = 33
      Hint = 'Enter your name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TextHint = 'Enter Name'
    end
    object EdtPassword: TEdit
      Left = 243
      Top = 264
      Width = 174
      Height = 33
      Hint = 'Enter your password'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      PasswordChar = '*'
      ShowHint = True
      TabOrder = 4
    end
    object EdtEmail: TEdit
      Left = 243
      Top = 163
      Width = 174
      Height = 33
      Hint = 'Enter your email'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      TextHint = 'Enter Email'
    end
    object btnRegister: TButton
      Left = 284
      Top = 360
      Width = 113
      Height = 33
      Hint = 'Click to register!'
      Caption = 'Sign up!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = btnRegisterClick
    end
    object BtnBack: TButton
      Left = 16
      Top = 359
      Width = 113
      Height = 33
      Hint = 'Return to login'
      Caption = '<-- Back'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = BtnBackClick
    end
    object EdtSUrname: TEdit
      Left = 243
      Top = 110
      Width = 174
      Height = 33
      Hint = 'Enter your surname'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TextHint = 'Enter Surname'
    end
    object EdtVerify: TEdit
      Left = 243
      Top = 313
      Width = 174
      Height = 33
      Hint = 'Type the same password again'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      PasswordChar = '*'
      ShowHint = True
      TabOrder = 5
    end
    object BitBtnRetry: TBitBtn
      Left = 144
      Top = 360
      Width = 113
      Height = 33
      Hint = 'Clears all fields'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      Kind = bkRetry
      ParentDoubleBuffered = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = BitBtnRetryClick
    end
    object EdtUsername: TEdit
      Left = 243
      Top = 216
      Width = 174
      Height = 33
      Hint = 'Enter a username'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      TextHint = 'Enter Username'
    end
  end
  object BitBtnHelp: TBitBtn
    Left = 642
    Top = 8
    Width = 102
    Height = 33
    DoubleBuffered = True
    Kind = bkHelp
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = BitBtnHelpClick
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
  end
end
