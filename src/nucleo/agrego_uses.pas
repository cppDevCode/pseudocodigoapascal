(**************************************************************)
{PROGRAMACION: ALEJANDRO LUCAS BALDRÉS                         }
{FECHA: 1/10/06                                                }
{LICENCIA: GNU/GPL                                             }
{--------------------------------------------------------------}
{Unidad que agrega las units en el pseudocodigo		       }
{--------------------------------------------------------------}
{COMPILADO CON FREEPASCAL                                      }

unit Agrego_uses;

interface
uses
Classes;

procedure Agrego_Unit (var File_Pseudo:TStringList);


implementation
uses
StrUtils,SysUtils;

type
str40=String[40];

const 
Funciones_crt:array[1..12] of str40 =('LIMPIARLINEA','LIMPIARPANTALLA','CURSORGRANDE','OCULTARCURSOR','MOSTRARCURSOR','BORRARLINEA','IRA','INSERTARLINEA','TECLAPRESIONADA','FONDOTXT','COLORTXT','VENTANA');

function Busco_uses (pseudocodigo:TStringList):Boolean;
 var
 x:integer;

 begin
 Busco_uses:=false;
 for x:=0 to pseudocodigo.count-1 do //recorro el pseudocodigo
    if findPart('USAR',uppercase(pseudocodigo.strings[x]))>0 then
	begin
        Busco_uses:=false;
	break;
	end;
 end;

procedure agrego_unit (var File_Pseudo:TStringList);
 var
 i,b,insertar_uses:integer;
 Inserto_uses:boolean=false;

 begin
 inserto_uses:=false;
 if Busco_uses(File_Pseudo) then
	 for i:=0 to File_Pseudo.count-1 do //recorro el pseudocodigo
	     begin
             if FindPart('PROGRAMA ',uppercase(File_pseudo.strings[i]))>0 then
			insertar_uses:=i+1;
	     for b:=1 to 12 do
		if FindPart(Funciones_crt[b],uppercase(File_Pseudo.Strings[i]))>0 then
			begin
			inserto_uses:=true;
			break;
			end;
	      end;
 if inserto_uses then
	begin
	File_Pseudo.Insert(insertar_uses,'usar');
	File_Pseudo.Insert(insertar_uses+1,'crt');
        end;
 end;

end.
