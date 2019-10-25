unit ufrmEnviar;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  ufrmBase, FMX.Layouts, FMX.Controls.Presentation, FMX.Edit, Vcl.Clipbrd;

type
  TfrmEnviar = class(TfrmBase)
    dlgArquivo: TOpenDialog;
    prbEnviar: TProgressBar;
    lblEnviar: TLabel;
    tmrEnviar: TTimer;
    pnlEnviar: TPanel;
    spbArquivo: TSpeedButton;
    edtArquivo: TEdit;
    procedure spbArquivoClick(Sender: TObject);
    procedure layBaseResize(Sender: TObject);
    procedure spbEnviarClick(Sender: TObject);
    procedure tmrEnviarTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtArquivoKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
  private
    { Private declarations }
    FCount: Integer;
    FGuid: String;
  public
    { Public declarations }
  end;

var
  frmEnviar: TfrmEnviar;

implementation

{$R *.fmx}

procedure TfrmEnviar.edtArquivoKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  inherited;
  if (Key = 13) and (edtArquivo.IsFocused) then
    spbArquivoClick(Sender);
end;

procedure TfrmEnviar.FormShow(Sender: TObject);
begin
  inherited;
  FCount := 0;
  tmrEnviar.Enabled := False;
  edtArquivo.Text := '';
end;

procedure TfrmEnviar.layBaseResize(Sender: TObject);
begin
  inherited;
  prbEnviar.Visible := False;
  lblEnviar.Visible := False;
end;

procedure TfrmEnviar.spbArquivoClick(Sender: TObject);
begin
  inherited;
  if (Trim(edtArquivo.Text) = '') then
  begin
    if dlgArquivo.Execute then
      edtArquivo.Text := dlgArquivo.FileName;
  end;
  spbEnviarClick(Sender);
end;

procedure TfrmEnviar.spbEnviarClick(Sender: TObject);
begin
  inherited;
  if (Trim(edtArquivo.Text) <> '') and FileExists(Trim(edtArquivo.Text)) then
  begin
    layBase.Repaint;
    edtArquivo.Enabled := False;
    spbArquivo.Enabled := False;

    lblEnviar.Text := 'Arquivo carregado, por favor aguarde ... ';
    lblEnviar.Visible := True;
    lblEnviar.Repaint;

    prbEnviar.Value := 0;
    prbEnviar.Visible := True;
    prbEnviar.Repaint;

    tmrEnviar.Enabled := True;
  end
  else
    ShowMessage('Selecione um arquivo válido ou um caminho completo antes de enviar!');
end;

procedure TfrmEnviar.tmrEnviarTimer(Sender: TObject);
var
  F: TextFile;
  P, G: String;
begin
  inherited;
  Inc(FCount);
  case FCount of
    1 : prbEnviar.Value := 0;
    2 : prbEnviar.Value := 25;
    3 : prbEnviar.Value := 50;
    4 : prbEnviar.Value := 75;
    5 : prbEnviar.Value := 100;
  end;

  if FCount > 5 then
  begin
    tmrEnviar.Enabled := False;

    lblEnviar.Visible := False;
    prbEnviar.Visible := False;

    edtArquivo.Enabled := True;
    spbArquivo.Enabled := True;

    Main.lsbMain.Items.Add(edtArquivo.Text);
    Main.lsbAuth.Items.Add(FGuid);

    edtArquivo.Text := '';

    FCount := 0;
    Main.CloseForm(TfrmEnviar);
  end
  else
  begin
    lblEnviar.Text := 'Enviando arquivo, progesso em '+prbEnviar.Value.ToString()+ ' %';
    lblEnviar.Repaint;

    if FCount = 5 then
    begin
      Sleep(100);
      FGuid := Main.GuidBase.NewGuid.ToString();
      Clipboard.AsText := FGuid;
      P := 'C:\_temporarios\Document\temp';
      G := P+'\'+FGuid+'.txt';
      if not DirectoryExists(P) then
      begin
        if not CreateDir(P) then
          ForceDirectories(P);
      end;
      AssignFile(F,P+'\'+FGuid+'.txt');
      Rewrite(F);
      Write(F, FGuid);
      Closefile(F);
      lblEnviar.Text := 'Arquivo enviado com sucesso!';
      lblEnviar.Repaint;
      if FileExists(G) then
        ShowMessage('Use o código salvo em:  '+P+#13+'para autenticar o arquivo enviado!');
    end
  end;
end;

end.
