unit UnitValidacion;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils; 

procedure Valido_Identificadores (Var Cadena:String);

var
Error_Validacion:boolean=false;

implementation

procedure Valido_Identificadores (Var Cadena:String);

 function Comparo (Cadena:String;index:Integer):String;
   begin
   if (Cadena[index] in ['0'..'9']) then
   	Begin
   	Comparo:='ERROR: IDENTIFICADORES NO PUEDEN COMENZAR CON UN NUMERO, EN LINEA ';//+IntToStr(Nro_linea);
   	//Error_Validacion:=true;
   	end
       else
         begin
         Comparo:=Cadena;
      //   Error_Validacion:=false;
         end;
   end;

 begin
 //VALIDO QUE NO COMIENCE CON UN NÚMERO
 if Cadena[1]<>' ' then Cadena:=Comparo(Cadena,1)
   else Comparo(Cadena,2);
 end;
end.

