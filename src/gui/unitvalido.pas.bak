unit Unitvalido;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TFrmMensajes }

  TFrmMensajes = class(TForm)
    Memtrad: TMemo;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  FrmMensajes: TFrmMensajes;

implementation

{ TFrmMensajes }
uses
UnitMain;

procedure TFrmMensajes.FormCreate(Sender: TObject);
begin
  Application.CreateForm(TForm1, Form1);
end;

procedure TFrmMensajes.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  Form1.MITMensajes.Checked:=false;
end;

procedure TFrmMensajes.FormShow(Sender: TObject);
begin
  if onventana=false then FrmMensajes.Visible:=false;
end;

initialization
  {$I unitvalido.lrs}

end.

