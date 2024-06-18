object FormMenuUtama: TFormMenuUtama
  Left = 0
  Top = 0
  Caption = 'Aplikasi Pertanian'
  ClientHeight = 442
  ClientWidth = 628
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
    Left = 440
    Top = 248
    object Petani1: TMenuItem
      Caption = 'Petani'
    end
    object Panen1: TMenuItem
      Caption = 'Panen'
    end
    object Gudang1: TMenuItem
      Caption = 'Gudang'
    end
    object PenjualanPanen1: TMenuItem
      Caption = 'Penjualan Panen'
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
