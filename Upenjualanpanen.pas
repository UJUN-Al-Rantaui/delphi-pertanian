unit Upenjualanpanen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, Vcl.ComCtrls;

type
  TFormPenjualanPanen = class(TForm)
    DBGrid1: TDBGrid;
    TablePenjualanPanen: TADOTable;
    dsPenjualanPanen: TDataSource;
    TablePenjualanPanenid: TAutoIncField;
    TablePenjualanPanennip: TStringField;
    TablePenjualanPanentanaman: TStringField;
    TablePenjualanPanenjumlah_kg: TIntegerField;
    TablePenjualanPanentanggal: TDateField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Tambah: TButton;
    Simpan: TButton;
    Ubah: TButton;
    Hapus: TButton;
    Batal: TButton;
    Keluar: TButton;
    Cetak: TButton;
    PrintDialog1: TPrintDialog;
    DateTimePicker1: TDateTimePicker;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    procedure TambahClick(Sender: TObject);
    procedure SimpanClick(Sender: TObject);
    procedure UbahClick(Sender: TObject);
    procedure HapusClick(Sender: TObject);
    procedure BatalClick(Sender: TObject);
    procedure KeluarClick(Sender: TObject);
    procedure CetakClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPenjualanPanen: TFormPenjualanPanen;

implementation

{$R *.dfm}

uses UnitMenuUtama, Vcl.Printers, Ugudang;

procedure TFormPenjualanPanen.BatalClick(Sender: TObject);
begin
  TablePenjualanPanen.Cancel;
end;

procedure TFormPenjualanPanen.CetakClick(Sender: TObject);
const
  FONT_SIZE_TITLE = 14;
  FONT_SIZE_HEADER = 12;
  FONT_SIZE_DATA = 10;
  CELL_PADDING = 60;
  LINE_THICKNESS = 1;
var
  i, j, LineHeight, PageWidth, PageHeight,
  CurrentY, TotalWidth, LeftMargin,
  CurrentX, CellWidth: Integer;
  ColumnWidths: array of Integer;
  Title: String;
  SavedFont: TFont;
begin
  if PrintDialog1.Execute then
  begin
    SavedFont := TFont.Create;
    try
      SavedFont.Assign(Printer.Canvas.Font);
      Printer.BeginDoc;
      try
        Title := 'Laporan Data Penjualan Panen';

        Printer.Canvas.Font.Size := FONT_SIZE_TITLE;
        Printer.Canvas.Font.Style := [fsBold];
        LineHeight := Printer.Canvas.TextHeight('W') + CELL_PADDING * 2;
        PageWidth := Printer.PageWidth;
        PageHeight := Printer.PageHeight;

        TotalWidth := Printer.Canvas.TextWidth(Title);
        LeftMargin := (PageWidth - TotalWidth) div 2;
        Printer.Canvas.TextOut(LeftMargin, LineHeight, Title);

        CurrentY := LineHeight * 3;

        Printer.Canvas.Font.Size := FONT_SIZE_HEADER;
        Printer.Canvas.Font.Style := [fsBold];

        SetLength(ColumnWidths, DBGrid1.Columns.Count);
        TotalWidth := 0;
        for i := 0 to DBGrid1.Columns.Count - 1 do
        begin
          ColumnWidths[i]:=Printer.Canvas.TextWidth(DBGrid1.Columns[i].Title.Caption) + CELL_PADDING*2;
          if DBGrid1.Columns[i].Title.Caption = 'ID' then
            ColumnWidths[i] := ColumnWidths[i] + 100
          else if DBGrid1.Columns[i].Title.Caption = 'NIP' then
            ColumnWidths[i] := ColumnWidths[i] + 250
          else if DBGrid1.Columns[i].Title.Caption = 'Nama Tanaman' then
            ColumnWidths[i] := ColumnWidths[i] + 300
          else if DBGrid1.Columns[i].Title.Caption = 'KG' then
            ColumnWidths[i] := ColumnWidths[i] + 200
          else if DBGrid1.Columns[i].Title.Caption = 'Tanggal Penjualan Panen' then
            ColumnWidths[i] := ColumnWidths[i] + 300;

          TotalWidth := TotalWidth + ColumnWidths[i];
        end;

        LeftMargin := (PageWidth - TotalWidth) div 2;

        CurrentX := LeftMargin;
        for i := 0 to DBGrid1.Columns.Count - 1 do
        begin
          CellWidth := ColumnWidths[i];
          Printer.Canvas.Rectangle(CurrentX, CurrentY, CurrentX + CellWidth, CurrentY + LineHeight);
          Printer.Canvas.TextOut(
              CurrentX + CELL_PADDING,
              CurrentY + CELL_PADDING,
              DBGrid1.Columns[i].Title.Caption);
          CurrentX := CurrentX + CellWidth;
        end;

        CurrentY := CurrentY + LineHeight;

        Printer.Canvas.Font.Size := FONT_SIZE_DATA;
        Printer.Canvas.Font.Style := [];

        DBGrid1.DataSource.DataSet.First;
        while not DBGrid1.DataSource.DataSet.Eof do
        begin
          if CurrentY > PageHeight - LineHeight then
          begin
            Printer.NewPage;
            CurrentY := LineHeight;
          end;

          CurrentX := LeftMargin;
          for j := 0 to DBGrid1.Columns.Count - 1 do
          begin
            CellWidth := ColumnWidths[j];
            Printer.Canvas.Rectangle(CurrentX, CurrentY, CurrentX + CellWidth, CurrentY + LineHeight);
            Printer.Canvas.TextOut(
                CurrentX + CELL_PADDING,
                CurrentY + CELL_PADDING,
                DBGrid1.Columns[j].Field.AsString);
            CurrentX := CurrentX + CellWidth;
          end;

          CurrentY := CurrentY + LineHeight;
          DBGrid1.DataSource.DataSet.Next;
        end;

        Printer.Canvas.MoveTo(LeftMargin, CurrentY);
        Printer.Canvas.LineTo(LeftMargin + TotalWidth, CurrentY);

      finally
        Printer.EndDoc;
      end;
    finally
      Printer.Canvas.Font.Assign(SavedFont);
      SavedFont.Free;
    end;
  end;
end;


procedure TFormPenjualanPanen.HapusClick(Sender: TObject);
begin
  TablePenjualanPanen.Delete;
end;

procedure TFormPenjualanPanen.KeluarClick(Sender: TObject);
begin
  FormPenjualanPanen.Close;
end;

procedure TFormPenjualanPanen.SimpanClick(Sender: TObject);
begin
  TablePenjualanPanen.Post;
  FormGudang.GudangQuery.Requery();
end;

procedure TFormPenjualanPanen.TambahClick(Sender: TObject);
begin
  TablePenjualanPanen.Insert;
end;

procedure TFormPenjualanPanen.UbahClick(Sender: TObject);
begin
  TablePenjualanPanen.Edit;
end;

end.
