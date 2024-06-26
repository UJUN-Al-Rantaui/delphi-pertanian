program ProjectPertanian;

uses
  Vcl.Forms,
  UnitMenuUtama in 'UnitMenuUtama.pas' {FormMenuUtama},
  Upetani in 'Upetani.pas' {Petani},
  Ugudang in 'Ugudang.pas' {FormGudang},
  Upanen in 'Upanen.pas' {FormPanen},
  Upenjualanpanen in 'Upenjualanpanen.pas' {FormPenjualanPanen};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMenuUtama, FormMenuUtama);
  Application.CreateForm(TPetani, Petani);
  Application.CreateForm(TFormGudang, FormGudang);
  Application.CreateForm(TFormPanen, FormPanen);
  Application.CreateForm(TFormPenjualanPanen, FormPenjualanPanen);
  Application.Run;
end.
