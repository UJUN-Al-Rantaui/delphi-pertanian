object FormPenjualanPanen: TFormPenjualanPanen
  Left = 0
  Top = 0
  Caption = 'Penjualan Panen'
  ClientHeight = 520
  ClientWidth = 787
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
    Width = 83
    Height = 15
    Caption = 'Nama Tanaman'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 8
    Top = 112
    Width = 14
    Height = 15
    Caption = 'KG'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 8
    Top = 160
    Width = 126
    Height = 15
    Caption = 'Tanggal Penjulan Panen'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 216
    Width = 771
    Height = 296
    DataSource = dsPenjualanPanen
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
    Width = 334
    Height = 23
    DataField = 'nip'
    DataSource = dsPenjualanPanen
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 8
    Top = 80
    Width = 334
    Height = 23
    DataField = 'tanaman'
    DataSource = dsPenjualanPanen
    TabOrder = 2
  end
  object DBEdit3: TDBEdit
    Left = 8
    Top = 128
    Width = 334
    Height = 23
    DataField = 'jumlah_kg'
    DataSource = dsPenjualanPanen
    TabOrder = 3
  end
  object Tambah: TButton
    Left = 360
    Top = 141
    Width = 75
    Height = 25
    Caption = 'Tambah'
    TabOrder = 4
    OnClick = TambahClick
  end
  object Simpan: TButton
    Left = 448
    Top = 141
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 5
    OnClick = SimpanClick
  end
  object Ubah: TButton
    Left = 534
    Top = 141
    Width = 75
    Height = 25
    Caption = 'Ubah'
    TabOrder = 6
    OnClick = UbahClick
  end
  object Hapus: TButton
    Left = 621
    Top = 141
    Width = 75
    Height = 25
    Caption = 'Hapus'
    TabOrder = 7
    OnClick = HapusClick
  end
  object Batal: TButton
    Left = 706
    Top = 141
    Width = 75
    Height = 25
    Caption = 'Batal'
    TabOrder = 8
    OnClick = BatalClick
  end
  object Keluar: TButton
    Left = 360
    Top = 175
    Width = 75
    Height = 25
    Caption = 'Keluar'
    TabOrder = 9
    OnClick = KeluarClick
  end
  object Cetak: TButton
    Left = 448
    Top = 175
    Width = 75
    Height = 25
    Caption = 'Cetak'
    TabOrder = 10
    OnClick = CetakClick
  end
  object DateTimePicker1: TDateTimePicker
    Left = 8
    Top = 181
    Width = 334
    Height = 23
    Date = 45469.000000000000000000
    Time = 45469.000000000000000000
    TabOrder = 11
  end
  object TablePenjualanPanen: TADOTable
    Active = True
    Connection = FormMenuUtama.PertanianConnection
    CursorType = ctStatic
    TableName = 'penjualan_panen'
    Left = 664
    Top = 8
    object TablePenjualanPanenid: TAutoIncField
      DisplayLabel = 'ID'
      DisplayWidth = 5
      FieldName = 'id'
      ReadOnly = True
    end
    object TablePenjualanPanennip: TStringField
      DisplayLabel = 'NIP'
      DisplayWidth = 22
      FieldName = 'nip'
    end
    object TablePenjualanPanentanaman: TStringField
      DisplayLabel = 'Nama Tanaman'
      DisplayWidth = 35
      FieldName = 'tanaman'
      Size = 255
    end
    object TablePenjualanPanenjumlah_kg: TIntegerField
      DisplayLabel = 'KG'
      DisplayWidth = 30
      FieldName = 'jumlah_kg'
    end
    object TablePenjualanPanentanggal: TDateField
      DisplayLabel = 'Tanggal Penjulan Panen'
      DisplayWidth = 30
      FieldName = 'tanggal'
    end
  end
  object dsPenjualanPanen: TDataSource
    DataSet = TablePenjualanPanen
    Left = 680
    Top = 80
  end
  object PrintDialog1: TPrintDialog
    Left = 472
    Top = 40
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = TablePenjualanPanen
    ScopeMappings = <>
    Left = 560
    Top = 16
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 612
    Top = 13
    object LinkControlToField1: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'tanggal'
      Control = DateTimePicker1
      Track = True
    end
  end
end
