unit Upetani;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.ExtCtrls;

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
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
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

end.
