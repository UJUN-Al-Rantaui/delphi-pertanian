object FormPanen: TFormPanen
  Left = 0
  Top = 0
  Caption = 'Panen'
  ClientHeight = 535
  ClientWidth = 780
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
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 19
    Height = 15
    Caption = 'NIP'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 8
    Top = 56
    Width = 48
    Height = 15
    Caption = 'Tanaman'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 8
    Top = 104
    Width = 14
    Height = 15
    Caption = 'KG'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 8
    Top = 155
    Width = 41
    Height = 15
    Caption = 'Tanggal'
  end
  object DBGrid1: TDBGrid
    Left = 9
    Top = 208
    Width = 763
    Height = 319
    DataSource = dsPanen
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object DBEdit2: TDBEdit
    Left = 8
    Top = 24
    Width = 304
    Height = 23
    DataField = 'nip'
    DataSource = dsPanen
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 8
    Top = 72
    Width = 304
    Height = 23
    DataField = 'tanaman'
    DataSource = dsPanen
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 8
    Top = 120
    Width = 304
    Height = 23
    DataField = 'jumlah_kg'
    DataSource = dsPanen
    TabOrder = 3
  end
  object DateTimePicker1: TDateTimePicker
    Left = 8
    Top = 173
    Width = 304
    Height = 23
    Date = 45469.000000000000000000
    Time = 45469.000000000000000000
    TabOrder = 4
  end
  object Tambah: TButton
    Left = 328
    Top = 135
    Width = 75
    Height = 25
    Caption = 'Tambah'
    TabOrder = 5
    OnClick = TambahClick
  end
  object Simpan: TButton
    Left = 414
    Top = 135
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 6
    OnClick = SimpanClick
  end
  object Ubah: TButton
    Left = 499
    Top = 135
    Width = 75
    Height = 25
    Caption = 'Ubah'
    TabOrder = 7
    OnClick = UbahClick
  end
  object Batal: TButton
    Left = 667
    Top = 135
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 8
    OnClick = BatalClick
  end
  object Keluar: TButton
    Left = 328
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Keluar'
    TabOrder = 9
    OnClick = KeluarClick
  end
  object Hapus: TButton
    Left = 582
    Top = 135
    Width = 75
    Height = 25
    Caption = 'Hapus'
    TabOrder = 10
    OnClick = HapusClick
  end
  object Cetak: TButton
    Left = 414
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Cetak'
    TabOrder = 11
    OnClick = CetakClick
  end
  object TablePanen: TADOTable
    Active = True
    Connection = FormMenuUtama.PertanianConnection
    CursorType = ctStatic
    TableName = 'panen'
    Left = 608
    Top = 72
    object TablePanenid: TAutoIncField
      DisplayLabel = 'ID'
      DisplayWidth = 5
      FieldName = 'id'
      ReadOnly = True
    end
    object TablePanennip: TStringField
      DisplayLabel = 'NIP'
      DisplayWidth = 30
      FieldName = 'nip'
    end
    object TablePanentanaman: TStringField
      DisplayLabel = 'Tanaman'
      DisplayWidth = 35
      FieldName = 'tanaman'
      Size = 255
    end
    object TablePanenjumlah_kg: TIntegerField
      DisplayLabel = 'KG'
      DisplayWidth = 30
      FieldName = 'jumlah_kg'
    end
    object TablePanentanggal: TDateField
      DisplayLabel = 'Tanggal'
      DisplayWidth = 20
      FieldName = 'tanggal'
    end
  end
  object dsPanen: TDataSource
    DataSet = TablePanen
    Left = 680
    Top = 80
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = TablePanen
    ScopeMappings = <>
    Left = 704
    Top = 16
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 604
    Top = 5
    object LinkControlToField1: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'tanggal'
      Control = DateTimePicker1
      Track = True
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 544
    Top = 8
  end
end
