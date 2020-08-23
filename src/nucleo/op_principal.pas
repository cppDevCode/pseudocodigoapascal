(**************************************************************)
{PROGRAMACION: ALEJANDRO LUCAS BALDRÉS                         }
{FECHA: 25/09/06                                               }
{LICENCIA: GNU/GPL                                             }
{--------------------------------------------------------------}
{Unidad que contiene los procedimiento principales	       }
{--------------------------------------------------------------}
{COMPILADO CON FREEPASCAL                                      }

unit Op_principal;

interface
procedure Cargo_y_traduzco (Archivo,Version,fecha_crea,plataforma,destino,directorio_pse,directorio_pto:String);

implementation
uses
StrUtils,agrego_pto,Func_Busqueda,archivos,Classes,agrego_uses;
////////////////////PROCEDIMIENTO PRINCIPAL QUE DIBUJA LA PANTALLA, CARGA ARCH, ETC
procedure Cargo_y_traduzco (Archivo,Version,fecha_crea,plataforma,destino,directorio_pse,directorio_pto:String);
 var
 i:integer;
 arc:file of byte;
 aux:TStringList;

 begin
 aux:=TStringList.create; //CREO EL OBJETO DE TIPO LISTA DE CADENAS
 //IMPRIMO ENCABEZADO EN LA PANTALLA
 writeln ('PseudoTrans traductor de pseudocodigo Version '+Version+' ['+fecha_crea+'] para '+Plataforma);
 writeln('Copyright (C) 2006 by Alejandro Lucas Baldres, Nicolas Secreto');
 writeln;
 //CARGO EL ARCHIVO EN LA LISTA DE CADENAS Y RECORRO LA MISMA, CONVIRTIENDO LOS TAB EN 
 //ESPACIOS Y LUEGO CONVIERTO VARIOS ESPACIOS EN 1 E INCREMENTO EL NRO DE LINEAS
   aux.LoadFromFile(Archivo);
   for i:=0 to aux.Count-1 do  
    begin
    aux.Strings[i]:=Tab2Space(aux.strings[i],0);
    aux.Strings[i]:=DelSpace1(aux.Strings[i]); //REDUZCO LA CANTIDAD DE ESPACIOS A 1
    end;
   //AGREGO ; O .
   Agrego_Unit (aux);
   Agrego (aux,Directorio_pto);
   //TRADUZCO
   Busco(aux,Directorio_pse);
   //GUARDO EL ARCHIVO FUENTE
   aux.SaveToFile(Destino);
   //COMIENZA DE IMPRESION DE RESULTADOS EN PANTALLA
   writeln('RESULTADO');
   writeln ('El codigo fuente fue generado en: '+Destino);
   assign(Arc,Destino);
   reset(arc);
   writeln ('Tamaño del Archivo Generado: ',fileSize(Arc),' Bytes');
   close(Arc);
   writeln ('Total de lineas: ',aux.count-1);
   writeln;
   writeln ('GRACIAS POR UTILIZAR EL PROGRAMA!!!!!!');
   //FIN DE IMPRESION DE RESULTADOS EN PANTALLA
   //GENERO LOG SI ES QUE SE ENVIO EL PARAMETRO
   Genero_logs(aux.count-1,Destino);
 end;
end.
