unit Ugudang;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB;

type
  TGudang = class(TForm)
    GudangQuery: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Gudang: TGudang;

implementation

{$R *.dfm}

uses UnitMenuUtama;

end.
