(**************************************************************)
{PROGRAMACION: ALEJANDRO LUCAS BALDRÉS                         }
{FECHA: 17/09/06                                               }
{LICENCIA: GNU/GPL                                             }
{--------------------------------------------------------------}
{Unidad de agregado de Punto y coma			       }
{--------------------------------------------------------------}
{COMPILADO CON FREEPASCAL                                      }

unit Agrego_Pto;

interface
uses
SysUtils,Classes,StrUtils;
 
procedure Agrego (var Cadena:TStrings;Directorio_pto:String);

implementation
//Agrego pto y coma
procedure Agrego (var Cadena:TStrings;Directorio_pto:String);
 var
 Pal_Sin_pto,aux,aux2:String[130];
 LlevaPto_Coma:Boolean=true;//VARIABLE QUE DETERMINA SI LLEVA O NO PTO Y COMA
 archivo:text;
 i:integer;

 begin
 for i:=0 to Cadena.count-1 do //RECORRO EL FUENTE EN PSEUDOCODIGO
     begin
     aux:=uppercase(Cadena.Strings[i]);
     if i=Cadena.count-1 then //SI ES LA ULTIMO REGLON O SEA END O FIN LE AGREGO EL PUNTO
        Cadena.Strings[i]:=Cadena.Strings[i]+'.'
        else
        begin
        aux2:=uppercase(Cadena.Strings[i+1]);
        assign(archivo,Directorio_pto);//ABRO EL ARCHIVO DE PALABRAS SIN PUNTO
        reset(archivo);
        while (not eof(archivo))and(llevaPto_coma) do //SI NO TERMINA EL FILE Y VERDAD DE LA VAR
       	   begin
 	   readln(archivo,Pal_Sin_pto); 
           if (FindPart(uppercase(Pal_Sin_pto),aux)>0)or ((Length(aux)=0)
        	or((Length(aux)=1)and(aux=#0)))or(FindPart('SINO ',aux2)>0) then 
        	begin
        	LlevaPto_Coma:=false;
        	end
              else begin
	         LlevaPto_Coma:=true;
                  end;
 	      end;
	//SI LlevaPto_coma = verdadero LE AGREGO EL PUNTO Y COMA
        if LlevaPto_Coma then Cadena.Strings[i]:=Cadena.Strings[i]+';' 
          else LlevaPto_Coma:=true;
        close(Archivo);
        end;
    end;
end;
////////////////////////////////////////////////////////////////////fin agrego ;    
end.
