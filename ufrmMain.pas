unit ufrmMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.MultiView, FMX.Layouts, System.Actions,
  FMX.ActnList, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, FMX.ListBox,
  Winapi.Windows;

type
  TfrmMain = class(TForm)
    stbMain: TStyleBook;
    layMain: TLayout;
    aclMain: TActionList;
    tbrMain: TToolBar;
    spbMenu: TSpeedButton;
    spbFechar: TSpeedButton;
    lblMain: TLabel;
    mvwMain: TMultiView;
    spbAjuda: TSpeedButton;
    lsbMain: TListBox;
    lsbAuth: TListBox;
    spbConfigurar: TSpeedButton;
    spbAutenticar: TSpeedButton;
    spbPesquisar: TSpeedButton;
    spbEnviar: TSpeedButton;
    actEnviar: TAction;
    actAutenticar: TAction;
    actSair: TAction;
    actAjuda: TAction;
    actConfigurar: TAction;
    actPesquisar: TAction;
    spbSobre: TSpeedButton;
    actSobre: TAction;
    procedure actSairExecute(Sender: TObject);
    procedure actAutenticarExecute(Sender: TObject);
    procedure actEnviarExecute(Sender: TObject);
    procedure actAjudaExecute(Sender: TObject);
    procedure actConfigurarExecute(Sender: TObject);
    procedure actPesquisarExecute(Sender: TObject);
    procedure spbMenuClick(Sender: TObject);
    procedure actSobreExecute(Sender: TObject);
  private
    { Private declarations }
    FActiveForm: TForm;
    procedure OpenForm(AFormClass: TComponentClass);
    function FindForm(AForm: TForm): Boolean;
    procedure ClickForm(SpeedButton: TSpeedButton);
  public
    { Public declarations }
    GuidBase: TGUID;
    procedure CloseForm(AFormClass: TComponentClass);
  end;

var
  frmMain: TfrmMain;
  LayoutBase: TComponent;

implementation

{$R *.fmx}

uses ufrmBase, ufrmEnviar, ufrmPesquisar, ufrmAutenticar;

procedure TfrmMain.actPesquisarExecute(Sender: TObject);
begin
  OpenForm(TfrmPesquisar);
  ClickForm(spbPesquisar);
end;

procedure TfrmMain.actEnviarExecute(Sender: TObject);
begin
  OpenForm(TfrmEnviar);
  ClickForm(spbEnviar);
end;

procedure TfrmMain.actAutenticarExecute(Sender: TObject);
begin
  OpenForm(TfrmAutenticar);
  ClickForm(spbAutenticar);
end;

procedure TfrmMain.actSairExecute(Sender: TObject);
begin
  if Assigned(FActiveForm) then
  begin
    if FActiveForm.Name = 'frmEnviar' then
      CloseForm(TfrmEnviar)
    else if FActiveForm.Name = 'frmPesquisar' then
      CloseForm(TfrmPesquisar)
    else if FActiveForm.Name = 'frmAutenticar' then
      CloseForm(TfrmAutenticar);
  end
  else
    Close;
end;

procedure TfrmMain.actSobreExecute(Sender: TObject);
var
  Exe,
  Version: string;
  Size, Handle: DWORD;
  Buffer: TBytes;
  FixedPtr: PVSFixedFileInfo;
begin
  ClickForm(spbSobre);
  Exe := ParamStr(0);
  Size := GetFileVersionInfoSize(PChar(Exe), Handle);
  if Size = 0 then
    RaiseLastOSError;

  SetLength(Buffer, Size);

  if not GetFileVersionInfo(PChar(Exe), Handle, Size, Buffer) then
    RaiseLastOSError;

  if not VerQueryValue(Buffer, '\', Pointer(FixedPtr), Size) then
    RaiseLastOSError;

  Version := Format('%d.%d.%d.%d',
    [LongRec(FixedPtr.dwFileVersionMS).Hi,  //major
     LongRec(FixedPtr.dwFileVersionMS).Lo,  //minor
     LongRec(FixedPtr.dwFileVersionLS).Hi,  //release
     LongRec(FixedPtr.dwFileVersionLS).Lo]); //build
  ShowMessage('Versão do Sistema: '+Version);
end;

procedure TfrmMain.actAjudaExecute(Sender: TObject);
var
  I: Integer;
//  F: TextFile;
begin
  ClickForm(spbAjuda);
  ShowMessage('Ajuda do Sistema');
//  AssignFile(F,'C:\_temporarios\Document\lista.txt');
//  Rewrite(F);
//  if lsbMain.Items.Count > 0 then
//  begin
//    for I := 0 to lsbMain.Items.Count - 1 do
//      Writeln(F, lsbMain.Items.Strings[I] +' - '+ lsbAuth.Items.Strings[I]);
//  end;
//  Write(F,''+lsbMain.Items.Count.ToString());
//  Closefile(F);
end;

procedure TfrmMain.actConfigurarExecute(Sender: TObject);
begin
  ClickForm(spbConfigurar);
  ShowMessage('Configurações do Sistema');
//  lsbMain.Items.Clear;
//  lsbMain.Items.Add('C:\_temporarios\Document\0.txt');
//  lsbMain.Items.Add('C:\_temporarios\Document\1.txt');
//  lsbMain.Items.Add('C:\_temporarios\Document\2.txt');
//  lsbMain.Items.Add('C:\_temporarios\Document\3.txt');
//  lsbMain.Items.Add('C:\_temporarios\Document\4.txt');
//  lsbMain.Items.Add('C:\_temporarios\Document\5.txt');
//  lsbMain.Items.Add('C:\_temporarios\Document\6.txt');
//  lsbMain.Items.Add('C:\_temporarios\Document\7.txt');
//  lsbMain.Items.Add('C:\_temporarios\Document\8.txt');
//  lsbMain.Items.Add('C:\_temporarios\Document\9.txt');
//
//  lsbAuth.Items.Clear;
//  lsbAuth.Items.Add('3cc55c69-e9a8-4f5f-8072-088fe8f622ec');
//  lsbAuth.Items.Add('b8f75c89-9cdb-48d5-8da0-5f3d8c6a5e62');
//  lsbAuth.Items.Add('2c685e8d-c3a2-4590-9fe8-8acf520d0479');
//  lsbAuth.Items.Add('c3259c8f-c539-4ccc-aa89-de447eb72e52');
//  lsbAuth.Items.Add('f2ca6399-a0b9-44f4-9d51-80de57f1063a');
//  lsbAuth.Items.Add('5a022303-c33f-41b6-bc54-cbb4c309dff8');
//  lsbAuth.Items.Add('c2cc2a0d-04c7-473f-9416-81c696cba660');
//  lsbAuth.Items.Add('31b8a432-47a4-4e49-8a4f-a818b592c843');
//  lsbAuth.Items.Add('72f135d2-6aba-4911-bcc3-4b3503aa1662');
//  lsbAuth.Items.Add('2ad97e92-a9d0-4dc5-870a-8f813f67a176');
end;


procedure TfrmMain.OpenForm(AFormClass: TComponentClass);
begin
  if Assigned(FActiveForm) then
  begin
    if FActiveForm.ClassType = AFormClass then
      exit
    else
    begin
      FActiveForm.DisposeOf;
      FActiveForm := nil;
    end;
  end;

  Application.CreateForm(AFormClass, FActiveForm);
  TfrmBase(FActiveForm).Main := self;
  //Encontra o Layout Base no form a ser exibido para adicionar ao frmMain
  LayoutBase := FActiveForm.FindComponent('layBase');
  if Assigned(LayoutBase) then
    layMain.AddObject(TLayout(LayoutBase));
end;

procedure TfrmMain.CloseForm(AFormClass: TComponentClass);
begin
  if Assigned(FActiveForm) then
  begin
    if FActiveForm.ClassType = AFormClass then
    begin
      FindForm(FActiveForm);
      FActiveForm.DisposeOf;
      FActiveForm := nil;
    end;
  end;
end;

function TfrmMain.FindForm(AForm: TForm): Boolean;
begin
  Result := False;
  //Encontra o Layout Base no form que está sendo exibido para remover do frmMain
  LayoutBase := FActiveForm.FindComponent('layBase');
  if Assigned(LayoutBase) then
  begin
    layMain.RemoveObject(TLayout(LayoutBase));
    Result := True;
  end;
end;

procedure TfrmMain.ClickForm(SpeedButton: TSpeedButton);
begin
  spbMenuClick(nil);
  SpeedButton.IsPressed := True;
  SpeedButton.StaysPressed := True;
  if SpeedButton.CanFocus then
    SpeedButton.SetFocus;
end;

procedure TfrmMain.spbMenuClick(Sender: TObject);
begin
  spbPesquisar.IsPressed      := False;
  spbPesquisar.StaysPressed   := False;
  spbEnviar.IsPressed         := False;
  spbEnviar.StaysPressed      := False;
  spbAutenticar.IsPressed     := False;
  spbAutenticar.StaysPressed  := False;

  spbSobre.IsPressed          := False;
  spbSobre.StaysPressed       := False;
  spbAjuda.IsPressed          := False;
  spbAjuda.StaysPressed       := False;
  spbConfigurar.IsPressed     := False;
  spbConfigurar.StaysPressed  := False;
end;

end.
