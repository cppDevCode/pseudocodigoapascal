(**************************************************************)
{PROGRAMACION: ALEJANDRO LUCAS BALDRÉS                         }
{FECHA: 25/09/06                                               }
{LICENCIA: GNU/GPL                                             }
{--------------------------------------------------------------}
{Unidad de cambio de Operadores			       }
{--------------------------------------------------------------}
{COMPILADO CON FREEPASCAL                                      }

unit Operadores;

interface
uses
StrUtils,SysUtils;

procedure Cambio_Operadores (var Cadena:String;Op_Pascal,Operador:string;
				resta:integer;Valido,Val2_Pal_Res:boolean);

implementation
///////////////////////////////////////////////////PROCEDIMIENTOS DE OPERACIONES
procedure Cambio_Operadores (var Cadena:String;Op_Pascal,Operador:string;
				resta:integer;Valido,Val2_Pal_Res:boolean);
 var
 Pos_ope,i:Integer;
 aux:string;
 
 begin
 aux:=uppercase(Cadena);
 Pos_ope:=findPart(operador,aux);//BUSCO EL OPERADOR EN LA LINEA LEIDA
 delete(aux,Pos_ope,length(operador));//BORRO EL OPERADOR
 while Pos_ope>0 do
 	begin
	i:=(Pos_ope-1);
	//VALIDO ES UN BOOLEANO QUE DETERMINA SI ES UNA PALABRA RESERVADA O
	//PERTENECE A UNA PARTE DE UNA VARIABLE
 	if (Valido) and (i>0) then
 		if Cadena[i]<>' ' then
 			resta:=-100;
 	if Val2_Pal_Res then
 		if (length(cadena)<>length(operador)) then
 			resta:=-100;
	//FIN DE VALIDACION
 	if resta<>-100 then
	  Cadena:=Copy(Cadena,1,Pos_ope-resta)+Op_Pascal+Copy(Cadena,Pos_ope+length(operador),Length(Cadena)-(Pos_ope-1+length(operador)));
	if FindPart('(',Op_Pascal)>0 then
		insert(')',cadena,length(Cadena));
	//determino si se declara una cadena con longitud
        if Op_pascal='String' then
	  begin
	  for i:=0 to 9 do 
	   begin
	   Pos_ope:=findPart(IntToStr(i),Cadena);
	   if Pos_ope>0 then break;
	   end;
	  if Pos_ope>0 then
		begin
		insert('(',Cadena,FindPart('String',cadena)+7);
		insert(')',Cadena,Length(Cadena));
		end;
	  end;
	//fin de Determinación
 	Pos_ope:=findPart(operador,aux);
 	delete(aux,Pos_ope,length(operador));
 	end;
 end;
///////////////////////////////////////////////FIN PROCEDIMIENTOS DE OPERACIONES
end.
