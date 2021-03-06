(**************************************************************)
{PROGRAMACION: ALEJANDRO LUCAS BALDRÉS                         }
{FECHA: 1/10/06                                                }
{LICENCIA: GNU/GPL                                             }
{--------------------------------------------------------------}
{Unidad Principal del programa  			       }
{--------------------------------------------------------------}
{COMPILADO CON FREEPASCAL                                      }
unit Main;

interface
procedure Aplicacion_run;

implementation
uses
crt,SysUtils,ayuda,Op_principal;

const //Declaro Constantes
Version='0.2.1.31';
Plataforma='Linux';
Fecha_Crea='1/10/06';

var
Creo_Archivo:Boolean=true;//ESTABLESCO SI CREO EL ARCHIVO O AGREGO LINEAS
Directorio_pto,Directorio_pse:String; //ALMACENO LA RUTA DEL PSEUDOCÓDIGO
Origen,Destino:String;//Path de Archivo en pseudocodigo y Path de Archivo fuente

procedure Aplicacion_run;
 begin
 //determino el directorio del programa
Origen:=paramStr(1);
//VERIFICO QUE NO SEA AYUDA
if paramStr(1)='' then Origen:='mannucleo';
if man (Origen,Fecha_crea,Plataforma,Version) then
 begin
 Destino:=paramStr(2);//ESTABLESCO EL SEGUNDO PARAMETRO COMO ARCHIVO DE DESTINO
 while Destino='' do
	begin
	clrscr;
	write('Ingrese el nombre de archivo de Salida: ');
	readln(Destino);
	end;
 if FileExists(ParamStr(3)) then //ESTABLESCO DICCIONARIOS
 	begin
 	Directorio_pse:=ParamStr(3);
 	Directorio_pto:=ParamStr(3)+'_pto';
 	end
   else begin
	{$IFDEF LINUX}
   	Directorio_pse:='/usr/share/pseudotrans/datos/unp';
   	Directorio_pto:='/usr/share/pseudotrans/datos/unp_pto';
	{$ELSE}
	Directorio_pse:='C:\pseudotrans\datos\unp';
   	Directorio_pto:='C:\pseudotrans\datos\unp_pto';
	{$ENDIF}   	
   	end;
 if FileExists(Origen) then //Si el Archivo fuente (Pseudo) existe procedo a realizar las opera
	 Cargo_y_traduzco (Origen,Version,fecha_crea,plataforma,destino,directorio_pse,directorio_pto)
  else writeln ('No existe el archivo: '+Origen);
 end;
end;
end.
