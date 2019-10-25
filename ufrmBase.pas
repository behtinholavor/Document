unit ufrmBase;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, ufrmMain;

type
  TfrmBase = class(TForm)
    layBase: TLayout;
  private
    { Private declarations }
    FMain: TfrmMain;
    procedure SetMain(Main: TfrmMain);
  public
    { Public declarations }
    property Main : TfrmMain read FMain write SetMain;
  end;

var
  frmBase: TfrmBase;

implementation

{$R *.fmx}

{ TfrmBase }


procedure TfrmBase.SetMain(Main: TfrmMain);
begin
  FMain := Main;
end;

end.
