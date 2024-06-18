object Petani: TPetani
  Left = 0
  Top = 0
  Align = alBottom
  Caption = 'Petani'
  ClientHeight = 437
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIChild
  Visible = True
  WindowState = wsMaximized
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 19
    Height = 15
    Caption = 'NIP'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 8
    Top = 64
    Width = 32
    Height = 15
    Caption = 'Nama'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 8
    Top = 112
    Width = 40
    Height = 15
    Caption = 'telepon'
    FocusControl = DBEdit3
  end
  object Label5: TLabel
    Left = 8
    Top = 208
    Width = 70
    Height = 15
    Caption = 'Tanggal Lahir'
  end
  object Label4: TLabel
    Left = 8
    Top = 160
    Width = 36
    Height = 15
    Caption = 'alamat'
    FocusControl = DBEdit4
  end
  object DBGrid1: TDBGrid
    Left = 264
    Top = 8
    Width = 512
    Height = 353
    DataSource = dsPetani
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 32
    Width = 250
    Height = 23
    DataField = 'nip'
    DataSource = dsPetani
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 8
    Top = 80
    Width = 250
    Height = 23
    DataField = 'nama'
    DataSource = dsPetani
    TabOrder = 2
  end
  object DBEdit3: TDBEdit
    Left = 8
    Top = 128
    Width = 250
    Height = 23
    DataField = 'telepon'
    DataSource = dsPetani
    TabOrder = 3
  end
  object DateTimePicker1: TDateTimePicker
    Left = 8
    Top = 229
    Width = 250
    Height = 23
    Date = 45461.000000000000000000
    Time = 45461.000000000000000000
    TabOrder = 4
  end
  object Button1: TButton
    Left = 8
    Top = 384
    Width = 75
    Height = 25
    Caption = 'Tambah'
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 104
    Top = 384
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 6
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 199
    Top = 384
    Width = 75
    Height = 25
    Caption = 'Ubah'
    TabOrder = 7
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 296
    Top = 384
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 8
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 488
    Top = 384
    Width = 75
    Height = 25
    Caption = 'Keluar'
    TabOrder = 9
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 392
    Top = 384
    Width = 75
    Height = 25
    Caption = 'Hapus'
    TabOrder = 10
    OnClick = Button6Click
  end
  object DBEdit4: TDBEdit
    Left = 8
    Top = 176
    Width = 250
    Height = 23
    DataField = 'alamat'
    DataSource = dsPetani
    TabOrder = 11
  end
  object TablePetani: TADOTable
    Active = True
    Connection = FormMenuUtama.PertanianConnection
    CursorType = ctStatic
    TableName = 'petani'
    Left = 632
    Top = 384
    object TablePetaniid: TAutoIncField
      DisplayLabel = 'ID'
      DisplayWidth = 4
      FieldName = 'id'
      ReadOnly = True
    end
    object TablePetaninip: TStringField
      DisplayLabel = 'NIP'
      DisplayWidth = 15
      FieldName = 'nip'
      Size = 25
    end
    object TablePetaninama: TStringField
      DisplayLabel = 'Nama'
      DisplayWidth = 18
      FieldName = 'nama'
      Size = 255
    end
    object TablePetanitelepon: TStringField
      DisplayWidth = 13
      FieldName = 'telepon'
    end
    object TablePetanialamat: TStringField
      DisplayWidth = 15
      FieldName = 'alamat'
      Size = 255
    end
    object TablePetanitanggal_lahir: TDateField
      DisplayLabel = 'Tanggal Lahir'
      DisplayWidth = 12
      FieldName = 'tanggal_lahir'
    end
  end
  object dsPetani: TDataSource
    DataSet = TablePetani
    Left = 680
    Top = 384
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = TablePetani
    ScopeMappings = <>
    Left = 720
    Top = 384
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 588
    Top = 381
    object LinkControlToField1: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'tanggal_lahir'
      Control = DateTimePicker1
      Track = True
    end
  end
end
