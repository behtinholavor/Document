unit ufrmPesquisar;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  ufrmBase, FMX.Controls.Presentation, FMX.Layouts, FMX.ListBox, FMX.Edit, StrUtils;

type
  TfrmPesquisar = class(TfrmBase)
    lsbPesquisar: TListBox;
    lblPesquisar: TLabel;
    pnlPesquisar: TPanel;
    edtArquivo: TEdit;
    spbArquivo: TSpeedButton;
    procedure spbArquivoClick(Sender: TObject);
    procedure edtArquivoTyping(Sender: TObject);
    procedure layBaseResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisar: TfrmPesquisar;

implementation

{$R *.fmx}

procedure TfrmPesquisar.edtArquivoTyping(Sender: TObject);
begin
  inherited;
  spbArquivoClick(Sender);
end;

procedure TfrmPesquisar.layBaseResize(Sender: TObject);
begin
  inherited;
  lblPesquisar.Text := '';
  lblPesquisar.TextSettings.BeginUpdate;
  lblPesquisar.TextSettings.FontColor := TAlphaColors.Black;
  lblPesquisar.TextSettings.EndUpdate;

  lblPesquisar.Visible := lsbPesquisar.Items.Count > 0;
  lsbPesquisar.Visible := lsbPesquisar.Items.Count > 0;
end;

procedure TfrmPesquisar.spbArquivoClick(Sender: TObject);
var
  I, Idx: Integer;
  name: String;
begin
  inherited;
  lsbPesquisar.Items.Clear;
  Idx := Main.lsbMain.Items.IndexOf(edtArquivo.Text);
  if (Trim(edtArquivo.Text) <> '') and (Main.lsbMain.Items.Count > 0) then
  begin
    for I := 0 to Main.lsbMain.Items.Count - 1 do
    begin
      name := Main.lsbMain.Items.Strings[I];
      if Pos(edtArquivo.Text, name) > 0 then
        lsbPesquisar.Items.Add(Main.lsbMain.Items.Strings[I]);
    end;
  end;
  lsbPesquisar.Visible := lsbPesquisar.Items.Count > 0;
  lblPesquisar.Visible := True;
  lblPesquisar.TextSettings.BeginUpdate;
  if lsbPesquisar.Items.Count > 0  then
  begin
    lblPesquisar.TextSettings.FontColor := TAlphaColors.Cornflowerblue;
    lblPesquisar.Text := lsbPesquisar.Items.Count.ToString() + ' Arquivo(s) encontrado(s)';
  end
  else
  begin
    lblPesquisar.TextSettings.FontColor := TAlphaColors.Crimson;
    lblPesquisar.Text := 'Nenhum arquivo encontrado!';
  end;
  lblPesquisar.TextSettings.EndUpdate;
  lblPesquisar.Repaint;
end;

end.
