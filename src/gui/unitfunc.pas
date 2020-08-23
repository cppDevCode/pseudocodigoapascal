unit UnitFunciones;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils; 

Procedure Guardo_Pse (Arch:String);
Procedure Inicializo_Rutas (var rutaFpc:String;var RUtaTools:String;var RutaDiccionario:String;
                             var RutaEj:String;var RutaDoc:String);

implementation
uses
UnitMain,UnitValido;

Procedure Guardo_Pse (Arch:String);
 var
 i:Integer;
 
 begin
  assign (Output,Arch);
  rewrite(Output);
  for i:=0 to form1.synedit1.Lines.Count-1 do
    writeln(Output,form1.synEdit1.lines[i]);
  close(Output);
 end;
 
Procedure Inicializo_Rutas (var rutaFpc:String;var RUtaTools:String;var RutaDiccionario:String;
                             var RutaEj:String;var RutaDoc:String);
 begin
 {$IFDEF LINUX}
  rutafpc:='/usr/bin/fpc';
  rutaTools:='/usr/share/pseudotrans/tools/upx';
  rutaDiccionario:='/usr/share/pseudotrans/datos/unp';
  rutaej:='/usr/share/pseudotrans/ejemplos';
  rutadoc:='/usr/share/pseudotrans/doc';
 {$ELSE}
  rutafpc:='C:\FPC\BIN';
  rutaTools:='C:\pseudotrans\tools\upx.exe';
  rutaDiccionario:='C:\pseudotrans\datos\unp';
  rutaej:='C:\pseudotrans\ejemplos';
  rutadoc:='C:\pseudotrans\doc';
 {$ENDIF}
 end;

end.

