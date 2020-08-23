unit UnitCreditos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Buttons;

type

  { TFrmCreditos }

  TFrmCreditos = class(TForm)
    BtnCerrar: TButton;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    LabVersion: TLabel;
    Memo1: TMemo;
    procedure BtnCerrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image2MouseEnter(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  FrmCreditos: TFrmCreditos;

implementation

{ TFrmCreditos }
uses
UnitMain;

procedure TFrmCreditos.BtnCerrarClick(Sender: TObject);
begin
FrmCreditos.Close;
end;

procedure TFrmCreditos.FormShow(Sender: TObject);
begin
 LabVersion.Caption:='Version: '+UnitMain.Version;
end;

procedure TFrmCreditos.Image2Click(Sender: TObject);
 var
 h:String;
 
begin
  Form1.HTMLHelpDatabase1.ShowURL('http://www.freepascal.org','Freepascal',h);
end;

procedure TFrmCreditos.Image2MouseEnter(Sender: TObject);
begin

end;

initialization
  {$I unitcreditos.lrs}

end.

