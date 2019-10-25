program Document;

uses
  System.StartUpCopy,
  FMX.Forms,
  ufrmMain in 'ufrmMain.pas' {frmMain},
  ufrmBase in 'ufrmBase.pas' {frmBase},
  ufrmEnviar in 'ufrmEnviar.pas' {frmEnviar},
  ufrmPesquisar in 'ufrmPesquisar.pas' {frmPesquisar},
  ufrmAutenticar in 'ufrmAutenticar.pas' {frmAutenticar};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
