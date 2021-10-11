object Form2: TForm2
  Left = 225
  Top = 129
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Images Copyright'
  ClientHeight = 537
  ClientWidth = 745
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object Label6: TLabel
    Left = 245
    Top = 4
    Width = 54
    Height = 16
    Caption = #1060#1072#1081#1083#1099':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 10
    Top = 4
    Width = 110
    Height = 16
    Caption = #1044#1080#1089#1082#1080' '#1080' '#1087#1072#1087#1082#1080':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 448
    Top = 20
    Width = 95
    Height = 16
    Caption = #1042#1089#1077#1075#1086' '#1092#1072#1081#1083#1086#1074':'
  end
  object Label3: TLabel
    Left = 448
    Top = 39
    Width = 138
    Height = 16
    Caption = #1042#1099#1076#1077#1083#1077#1085#1085#1099#1093' '#1092#1072#1081#1083#1086#1074':'
  end
  object Label8: TLabel
    Left = 656
    Top = 136
    Width = 81
    Height = 16
    Alignment = taRightJustify
    Caption = #1057#1078#1072#1090#1080#1077': 91%'
  end
  object Button1: TButton
    Left = 448
    Top = 64
    Width = 289
    Height = 25
    Caption = #1042#1089#1090#1072#1074#1080#1090#1100' '#1074#1086#1076#1103#1085#1091#1102' '#1087#1086#1076#1087#1080#1089#1100
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object FileListBox1: TFileListBox
    Left = 232
    Top = 55
    Width = 209
    Height = 346
    ItemHeight = 16
    Mask = '*.jpg'
    MultiSelect = True
    TabOrder = 6
    OnChange = FileListBox1Change
    OnClick = FileListBox1Click
  end
  object DirectoryListBox1: TDirectoryListBox
    Left = 0
    Top = 55
    Width = 225
    Height = 346
    FileList = FileListBox1
    ItemHeight = 16
    TabOrder = 5
    OnChange = DirectoryListBox1Change
  end
  object DriveComboBox1: TDriveComboBox
    Left = 0
    Top = 23
    Width = 225
    Height = 22
    DirList = DirectoryListBox1
    TabOrder = 3
  end
  object FilterComboBox1: TFilterComboBox
    Left = 232
    Top = 23
    Width = 209
    Height = 24
    FileList = FileListBox1
    Filter = 'JPEG files (*.jpg)|*.jpg|All files (*.*)|*.*'
    TabOrder = 4
  end
  object Button2: TButton
    Left = 448
    Top = 96
    Width = 289
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 0
    OnClick = Button2Click
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 408
    Width = 729
    Height = 121
    Caption = '  '#1057#1074#1086#1081#1089#1090#1074#1072' '#1090#1077#1082#1089#1090#1072' '
    TabOrder = 2
    object Label4: TLabel
      Left = 16
      Top = 32
      Width = 149
      Height = 16
      Caption = #1050#1086#1086#1088#1076#1080#1085#1072#1090#1099': X = 0, Y = 0'
    end
    object Label5: TLabel
      Left = 16
      Top = 57
      Width = 66
      Height = 16
      Caption = 'Font name:'
    end
    object Label9: TLabel
      Left = 176
      Top = 57
      Width = 56
      Height = 16
      Caption = 'Font size:'
    end
    object Label10: TLabel
      Left = 336
      Top = 56
      Width = 62
      Height = 16
      Caption = 'Font color:'
    end
    object Label1: TLabel
      Left = 424
      Top = 32
      Width = 99
      Height = 16
      Caption = #1058#1077#1082#1089#1090' '#1087#1086#1076#1087#1080#1089#1080':'
    end
    object ComboBox1: TComboBox
      Left = 16
      Top = 81
      Width = 153
      Height = 24
      Style = csDropDownList
      ItemHeight = 16
      TabOrder = 0
      OnChange = ComboBox1Change
    end
    object SpinEdit1: TSpinEdit
      Left = 176
      Top = 79
      Width = 153
      Height = 26
      MaxValue = 0
      MinValue = 0
      TabOrder = 1
      Value = 10
      OnChange = SpinEdit1Change
    end
    object ColorBox1: TColorBox
      Left = 336
      Top = 80
      Width = 145
      Height = 22
      ItemHeight = 16
      TabOrder = 2
      OnChange = ColorBox1Change
    end
    object CheckBox3: TCheckBox
      Left = 496
      Top = 64
      Width = 57
      Height = 17
      Caption = 'Bold'
      Checked = True
      State = cbChecked
      TabOrder = 3
      OnClick = CheckBox3Click
    end
    object CheckBox4: TCheckBox
      Left = 496
      Top = 88
      Width = 57
      Height = 17
      Caption = 'Italic'
      TabOrder = 4
      OnClick = CheckBox4Click
    end
    object Edit1: TEdit
      Left = 536
      Top = 24
      Width = 185
      Height = 24
      TabOrder = 5
      Text = 'Delphi Sources . RU'
      OnChange = Edit1Change
    end
  end
  object CheckBox1: TCheckBox
    Left = 448
    Top = 136
    Width = 97
    Height = 17
    Caption = 'Stretch'
    TabOrder = 7
    OnClick = CheckBox1Click
  end
  object ScrollBox1: TScrollBox
    Left = 448
    Top = 168
    Width = 289
    Height = 233
    TabOrder = 8
    object Image1: TImage
      Left = 0
      Top = 0
      Width = 217
      Height = 161
      Stretch = True
      OnMouseDown = Image1MouseDown
    end
  end
  object TrackBar1: TTrackBar
    Left = 520
    Top = 136
    Width = 121
    Height = 25
    Max = 100
    Min = 1
    PageSize = 1
    Frequency = 5
    Position = 91
    TabOrder = 9
    ThumbLength = 14
    OnChange = TrackBar1Change
  end
  object OpenDialog1: TOpenDialog
    Filter = 'JPEG files (*.jpg)|*.jpg|All files (*.*)|*.*'
    Left = 240
    Top = 64
  end
end
