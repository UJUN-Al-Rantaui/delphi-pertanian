program ProjectPertanian;

uses
  Vcl.Forms,
  UnitMenuUtama in 'UnitMenuUtama.pas' {FormMenuUtama},
  Upetani in 'Upetani.pas' {Petani};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMenuUtama, FormMenuUtama);
  Application.CreateForm(TPetani, Petani);
  Application.Run;
end.
