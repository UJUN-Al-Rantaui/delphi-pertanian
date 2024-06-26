unit Upetani;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.Printers;

type
  TPetani = class(TForm)
    TablePetani: TADOTable;
    dsPetani: TDataSource;
    DBGrid1: TDBGrid;
    TablePetaniid: TAutoIncField;
    TablePetaninip: TStringField;
    TablePetaninama: TStringField;
    TablePetanitelepon: TStringField;
    TablePetanitanggal_lahir: TDateField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DateTimePicker1: TDateTimePicker;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    TablePetanialamat: TStringField;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Button7: TButton;
    PrintDialog1: TPrintDialog;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    procedure PrintDBGrid();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Petani: TPetani;

implementation

{$R *.dfm}

uses UnitMenuUtama;


procedure TPetani.Button1Click(Sender: TObject);
begin
  TablePetani.Insert;
end;

procedure TPetani.Button2Click(Sender: TObject);
begin
  TablePetani.Post;
end;

procedure TPetani.Button3Click(Sender: TObject);
begin
  TablePetani.Edit;
end;

procedure TPetani.Button4Click(Sender: TObject);
begin
  TablePetani.Cancel;
end;

procedure TPetani.Button5Click(Sender: TObject);
begin
  self.Close;
end;

procedure TPetani.Button6Click(Sender: TObject);
begin
  TablePetani.Delete;
end;

procedure TPetani.Button7Click(Sender: TObject);
begin
  if PrintDialog1.Execute then
  begin
    PrintDBGrid();
  end;
end;

procedure TPetani.PrintDBGrid();
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
  SavedFont := TFont.Create;
  try
    SavedFont.Assign(Printer.Canvas.Font);
    Printer.BeginDoc;
    try
      Title := 'Laporan Daftar Petani';

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
        else if DBGrid1.Columns[i].Title.Caption = 'Nama' then
          ColumnWidths[i] := ColumnWidths[i] + 300
        else if DBGrid1.Columns[i].Title.Caption = 'Telepon' then
          ColumnWidths[i] := ColumnWidths[i] + 40
        else if DBGrid1.Columns[i].Title.Caption = 'Alamat' then
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

end.
