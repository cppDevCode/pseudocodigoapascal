program pseudotrans;

{$mode objfpc}{$H+}

uses
  cthreads,
  Interfaces, // this includes the LCL widgetset
  Forms
  { add your units here }, UnitMain, UnitCreditos, Unitopciones, UnitError,
  UnitFunciones, UnitValidacion, Unitvalido, UnitDestruccion;

begin
  Application.Title:='PseudoTrans';
  Application.Initialize;
  Application.CreateForm(TFrmMensajes, FrmMensajes);
  Application.CreateForm(TFrmCreditos, FrmCreditos);
  Application.CreateForm(TFrmError, FrmError);
  Application.Run;
end.

