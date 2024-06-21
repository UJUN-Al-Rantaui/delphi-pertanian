program ProjectPertanian;

uses
  Vcl.Forms,
  UnitMenuUtama in 'UnitMenuUtama.pas' {FormMenuUtama},
  Upetani in 'Upetani.pas' {Petani},
  Ugudang in 'Ugudang.pas' {Gudang},
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMenuUtama, FormMenuUtama);
  Application.CreateForm(TPetani, Petani);
  Application.CreateForm(TGudang, Gudang);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
