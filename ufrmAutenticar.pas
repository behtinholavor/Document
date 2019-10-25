unit ufrmAutenticar;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  ufrmBase, FMX.Controls.Presentation, FMX.Layouts, FMX.Edit;

type
  TfrmAutenticar = class(TfrmBase)
    pnlPesquisar: TPanel;
    edtArquivo: TEdit;
    spbArquivo: TSpeedButton;
    lblAutenticar: TLabel;
    tmrPesquisar: TTimer;
    procedure edtArquivoKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure spbArquivoClick(Sender: TObject);
    procedure layBaseResize(Sender: TObject);
    procedure tmrPesquisarTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAutenticar: TfrmAutenticar;

implementation

{$R *.fmx}

procedure TfrmAutenticar.edtArquivoKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  inherited;
  if (Key = 13) and (edtArquivo.IsFocused) then
    spbArquivoClick(Sender);
end;

procedure TfrmAutenticar.layBaseResize(Sender: TObject);
begin
  inherited;
  lblAutenticar.Visible := False;
end;

procedure TfrmAutenticar.spbArquivoClick(Sender: TObject);
begin
  inherited;
  if (Trim(edtArquivo.Text) <> '') then
  begin
    lblAutenticar.Visible := True;
    lblAutenticar.TextSettings.BeginUpdate;
    if Main.lsbAuth.Items.IndexOf(Trim(edtArquivo.Text)) >= 0 then
    begin
      lblAutenticar.Text := 'Arquivo validado com sucesso!';
      lblAutenticar.TextSettings.FontColor := TAlphaColors.Cornflowerblue;
      tmrPesquisar.Enabled := True;
    end
    else
    begin
      lblAutenticar.Text := 'Código de autenticação inválido!';
      lblAutenticar.TextSettings.FontColor := TAlphaColors.Crimson;
      tmrPesquisar.Enabled := False;
    end;
    lblAutenticar.TextSettings.EndUpdate;
    lblAutenticar.Repaint;
  end;
end;

procedure TfrmAutenticar.tmrPesquisarTimer(Sender: TObject);
begin
  inherited;
  lblAutenticar.Text := '';
  lblAutenticar.TextSettings.BeginUpdate;
  lblAutenticar.TextSettings.FontColor := TAlphaColors.Black;
  lblAutenticar.TextSettings.EndUpdate;
  edtArquivo.Text := '';
  tmrPesquisar.Enabled := False;
end;

end.
