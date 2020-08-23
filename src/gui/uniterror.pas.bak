unit UnitError;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Buttons;

type

  { TFrmError }

  TFrmError = class(TForm)
    BtnCerrar: TButton;
    BtnOk: TButton;
    Image1: TImage;
    Memo1: TMemo;
    procedure BtnCerrarClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  FrmError: TFrmError;

implementation

uses
UnitMain;

{ TFrmError }

procedure TFrmError.BtnCerrarClick(Sender: TObject);
begin
  FrmError.Close;
end;

procedure TFrmError.BtnOkClick(Sender: TObject);
begin
  FrmError.Caption:='Error';
  FrmError.BtnOk.Visible:=false;
  FrmError.BtnCerrar.Caption:='Cerrar';
  frmError.close;
  Guardo_pseudocodigo;
end;

initialization
  {$I uniterror.lrs}

end.

