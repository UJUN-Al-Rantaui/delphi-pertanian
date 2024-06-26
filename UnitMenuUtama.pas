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
    procedure Petani1Click(Sender: TObject);
    procedure Panen1Click(Sender: TObject);
    procedure Gudang1Click(Sender: TObject);
    procedure PenjualanPanen1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMenuUtama: TFormMenuUtama;

implementation

{$R *.dfm}

uses Ugudang, Upanen, Upetani, Upenjualanpanen;

procedure TFormMenuUtama.Gudang1Click(Sender: TObject);
begin
  FormGudang.Show;
end;

procedure TFormMenuUtama.Panen1Click(Sender: TObject);
begin
  FormPanen.Show;
end;

procedure TFormMenuUtama.PenjualanPanen1Click(Sender: TObject);
begin
  FormPenjualanPanen.Show;
end;

procedure TFormMenuUtama.Petani1Click(Sender: TObject);
begin
  Petani.show;
end;

end.
