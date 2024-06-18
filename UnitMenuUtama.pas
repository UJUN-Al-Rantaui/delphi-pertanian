unit UnitMenuUtama;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Menus;

type
  TFormMenuUtama = class(TForm)
    MainMenu1: TMainMenu;
    Petani1: TMenuItem;
    Gudang1: TMenuItem;
    Panen1: TMenuItem;
    PenjualanPanen1: TMenuItem;
    PertanianConnection: TADOConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMenuUtama: TFormMenuUtama;

implementation

{$R *.dfm}

end.
