unit Ugudang;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids;

type
  TFormGudang = class(TForm)
    GudangQuery: TADOQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    GudangQueryNIP: TStringField;
    GudangQueryNamaPetani: TStringField;
    GudangQueryNamaTanaman: TStringField;
    GudangQueryKG: TIntegerField;
    GudangQueryTelpPetani: TStringField;
    GudangQueryAlamatPetani: TStringField;
    Cetak: TButton;
    PrintDialog1: TPrintDialog;
    procedure CetakClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormGudang: TFormGudang;

implementation

{$R *.dfm}

uses UnitMenuUtama, Vcl.Printers;

procedure TFormGudang.CetakClick(Sender: TObject);
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
        Title := 'Laporan Data Gudang';

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
          if DBGrid1.Columns[i].Title.Caption = 'NIP' then
            ColumnWidths[i] := ColumnWidths[i] + 150
          else if DBGrid1.Columns[i].Title.Caption = 'Nama Petani' then
            ColumnWidths[i] := ColumnWidths[i] + 100
          else if DBGrid1.Columns[i].Title.Caption = 'Nama Tanaman' then
            ColumnWidths[i] := ColumnWidths[i] + 100
          else if DBGrid1.Columns[i].Title.Caption = 'KG' then
            ColumnWidths[i] := ColumnWidths[i] + 200
          else if DBGrid1.Columns[i].Title.Caption = 'Telp. Petani' then
            ColumnWidths[i] := ColumnWidths[i] + 50
          else if DBGrid1.Columns[i].Title.Caption = 'Alamat Petani' then
            ColumnWidths[i] := ColumnWidths[i] + 200;

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


end.
