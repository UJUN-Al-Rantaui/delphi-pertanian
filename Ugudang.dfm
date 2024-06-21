object Gudang: TGudang
  Left = 0
  Top = 0
  Caption = 'Gudang'
  ClientHeight = 442
  ClientWidth = 726
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object GudangQuery: TADOQuery
    Connection = FormMenuUtama.PertanianConnection
    Parameters = <>
    Left = 96
    Top = 376
  end
end
