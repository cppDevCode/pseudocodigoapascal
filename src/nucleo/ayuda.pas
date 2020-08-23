(**************************************************************)
{PROGRAMACION: ALEJANDRO LUCAS BALDRÉS                         }
{FECHA: 25/09/06                                               }
{LICENCIA: GNU/GPL                                             }
{--------------------------------------------------------------}
{Unidad de procedimientos de ayuda			       }
{--------------------------------------------------------------}
{COMPILADO CON FREEPASCAL                                      }

unit Ayuda;

interface
Function Man (Cad,Fecha_crea,Plataforma,Version:String):Boolean;

Implementation
uses
crt,SysUtils;
////////////////////////////////////////////////////////////////////////AYUDA///
procedure Visualizo (Arch:String);
 var
 aux:String;
 a:text;
 count:integer;
 
 begin
 count:=1;
 Assign (a,Arch);
 {$I-}
 reset(a);
 {$I+}
 if ioresult<>0 then 
 	begin
 	writeln('NO SE ENCUENTRA EL DOCUMENTO: "/doc/DocUnidades"!!!');
	exit
	end
  else begin
       readln(a,aux);
       writeln(aux);
       while not eof(a) do
       		begin
       		readln(a,aux);
   	        writeln(aux);
   	        count:=count+1;
   	        if count=23 then
   	        	begin
   	        	readkey;
   	        	count:=1;
   	        	end;
   	        end;
       readkey;
       Clrscr;	         
       end;
end;
 		     
Function Man (Cad,Fecha_crea,Plataforma,Version:String):Boolean;

 procedure Opero (Ruta:String);
  begin
  Man:=false;
  Visualizo(ruta);//ExtractFilePath(paramstr(0))+
  end;
  
 begin
 Man:=true;
 Cad:=uppercase(Cad);
 if Cad='MANUNIDADES' then
     begin
     {$IFDEF LINUX}
     Opero('/usr/share/pseudotrans/doc/DocUnidades');
     {$ELSE}
     Opero('C:\Pseudotrans\doc\DocUnidades');
     {$ENDIF}
     man:=false;
     end
   else if Cad='MANCONCEPTOS' then
   	   begin
	   {$IFDEF LINUX}
           Opero('/usr/share/pseudotrans/doc/conceptos');
	   {$ELSE}
	   Opero('C:\Pseudotrans\doc\conceptos');
	   {$ENDIF}
	    man:=false;
           end
          else if Cad='MANREGLAS' then
          	  begin         
 		  {$IFDEF LINUX}
        	  Opero('/usr/share/pseudotrans/doc/ArchivoReglas');
 		  {$ELSE}
		  Opero('C:\Pseudotrans\doc\ArchivoReglas');
		  {$ENDIF}
		   man:=false;
        	  end
        	 else if Cad='MANPSEUDOCODIGO' then
        	 	begin
			{$IFDEF LINUX}
		        Opero('/usr/share/pseudotrans/doc/pseudocodigo');
			{$ELSE}
			Opero('C:\Pseudotrans\doc\pseudocodigo');
			{$ENDIF}
			 man:=false;
		        end
		      else if Cad='--VERSION' then
				begin
				writeln ('Versión del Nucleo: '+Version);
				writeln ('Compilado el: '+Fecha_crea);
				writeln ('Plataforma: '+Plataforma);
				man:=false;
				end
			  else if Cad='MANNUCLEO' then
		       	 	begin
				{$IFDEF LINUX}
		        	Opero('/usr/share/pseudotrans/doc/nucleo');
				{$ELSE}
				Opero('C:\Pseudotrans\doc\nucleo');
				{$ENDIF}
				 man:=false;
			        end;
 end;
end.
