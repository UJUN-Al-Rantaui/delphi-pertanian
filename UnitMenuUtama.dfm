object FormMenuUtama: TFormMenuUtama
  Left = 0
  Top = 0
  Caption = 'Aplikasi Pertanian'
  ClientHeight = 478
  ClientWidth = 787
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  WindowState = wsMaximized
  TextHeight = 15
  object MainMenu1: TMainMenu
    Left = 208
    Top = 24
    object Petani1: TMenuItem
      Caption = 'Petani'
      OnClick = Petani1Click
    end
    object Panen1: TMenuItem
      Caption = 'Panen'
      OnClick = Panen1Click
    end
    object Gudang1: TMenuItem
      Caption = 'Gudang'
      OnClick = Gudang1Click
    end
    object PenjualanPanen1: TMenuItem
      Caption = 'Penjualan Panen'
      OnClick = PenjualanPanen1Click
    end
  end
  object PertanianConnection: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;User ID=root;Data' +
      ' Source=pertanian'
    LoginPrompt = False
    Left = 120
    Top = 248
  end
end
