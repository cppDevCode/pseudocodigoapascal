(**************************************************************)
{PROGRAMACION: ALEJANDRO LUCAS BALDRÉS                         }
{FECHA: 25/09/06                                               }
{LICENCIA: GNU/GPL                                             }
{--------------------------------------------------------------}
{Esta unida tiene los procedimiento de busqueda de instrucciones}
{--------------------------------------------------------------}
{COMPILADO CON FREEPASCAL                                      }
unit Func_Busqueda;

interface
uses
Classes,operadores,SysUtils;

procedure Busco (var Cadena:TStrings;Directorio_pse:String);

implementation
/////////////////////////////PSEUDOCODIGO UNPSJB (UNIV. NAC. PAT. SAN JUAN BOSCO
procedure Busco (var Cadena:TStrings;Directorio_pse:String);
 type
 // TREGISTRO = [INTRUCCION_PASCAL],[INSTRUCCION_PSEUDOCODIGO],[OPCION1],[OPCION2],[OPCION3]
 Tregistro=record
 	     InstPascal:String;
 	     InstPseudo:String;
 	     BorrarCar:Integer;
 	     Valido1:Boolean;
 	     Valido2:Boolean;
 	   end;
 var
 Arch_Pse:text;
 aux2,auxStr:ShortString;
 i:Integer;
 aux:Tregistro;

 begin
 for i:=0 to cadena.count-1 do //RECORRO EL PSEUDOCODIGO
 begin
 assign(Arch_Pse,Directorio_pse);
 {$I-}
 reset(Arch_Pse);
 {$I+}
 if ioresult<>0 then
 	begin
 	writeln('ERROR EL ARCHIVO DEL PROGRAMA: '+Directorio_pse+' NO EXISTE!!!');
 	end
   else begin
   	while not eof(Arch_pse) do
   		begin
		//COMIENZO A LEER EL REGISTRO
   		readln(Arch_pse,aux.InstPascal);
   		readln(Arch_pse,aux.InstPseudo);
   		readln(Arch_pse,auxStr);
   		aux.BorrarCar:=StrToInt(auxStr);
   		readln(Arch_pse,auxStr);
   		aux.Valido1:=StrToBool(auxStr);
   		readln(Arch_pse,auxStr);
   		aux.Valido2:=StrToBool(AuxStr);
                aux2:=Cadena.Strings[i];
		//FIN DE LECTURA DEL REGISTRO Y ASGINACION
        	Cambio_Operadores (aux2,aux.InstPascal,Aux.InstPseudo,aux.BorrarCar,aux.Valido1,aux.valido2);
                Cadena.Strings[i]:=aux2; //ASIGNO LA PALABRA TRADUCIDA
   		end;
   	close(Arch_pse);
   	end;
  end;
 end;
/////////////////////////FIN PSEUDOCODIGO UNPSJB (UNIV. NAC. PAT. SAN JUAN BOSCO 
end.
