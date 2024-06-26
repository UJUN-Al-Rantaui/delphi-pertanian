object FormGudang: TFormGudang
  Left = 0
  Top = 0
  Caption = 'Gudang'
  ClientHeight = 442
  ClientWidth = 805
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
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 789
    Height = 329
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object Cetak: TButton
    Left = 32
    Top = 360
    Width = 75
    Height = 25
    Caption = 'Cetak'
    TabOrder = 1
    OnClick = CetakClick
  end
  object GudangQuery: TADOQuery
    Active = True
    Connection = FormMenuUtama.PertanianConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT '
      '    g.nip       AS NIP,'
      '    p.nama      AS '#39'Nama Petani'#39', '
      '    g.tanaman   AS '#39'Nama Tanaman'#39', '
      '    g.panen_kg  AS KG,'
      '    p.telepon   AS '#39'Telp. Petani'#39','
      '    p.alamat    AS '#39'Alamat Petani'#39
      'FROM gudang AS g'
      'LEFT JOIN petani AS p '
      '    ON(g.nip = p.nip);')
    Left = 144
    Top = 360
    object GudangQueryNIP: TStringField
      DisplayWidth = 15
      FieldName = 'NIP'
    end
    object GudangQueryNamaPetani: TStringField
      DisplayWidth = 25
      FieldName = 'Nama Petani'
      Size = 255
    end
    object GudangQueryNamaTanaman: TStringField
      DisplayWidth = 25
      FieldName = 'Nama Tanaman'
      Size = 255
    end
    object GudangQueryKG: TIntegerField
      FieldName = 'KG'
    end
    object GudangQueryTelpPetani: TStringField
      FieldName = 'Telp. Petani'
    end
    object GudangQueryAlamatPetani: TStringField
      DisplayWidth = 30
      FieldName = 'Alamat Petani'
      Size = 255
    end
  end
  object DataSource1: TDataSource
    DataSet = GudangQuery
    Left = 224
    Top = 360
  end
  object PrintDialog1: TPrintDialog
    Left = 312
    Top = 368
  end
end
