unit UnitDestruccion;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, StrUtils, dialogs, controls;

procedure Salvo_no_guardado (Index:integer);

implementation

uses
UnitMain,Unitfunciones;

procedure Salvo_no_guardado (Index:integer);
 var
 aux:string;
 
 begin
 with Form1 do
   begin
   if (findpart('*',Notebook1.Page[index].Caption)>0) then
    begin
    if (Dialogs.MessageDlg('Desea Guardarlo?','Desea Guardar los cambios en '+DelChars(Notebook1.Page[index].Caption,'*')+'?',mtConfirmation,TMsgDlgButtons(Mbyesno),0)=mryes) then
     begin
     if (archivo.count>0)and(fileExists(UnitMain.Archivo[form1.Notebook1.PageIndex])) then
         Guardo_Pse (UnitMain.Archivo[form1.Notebook1.PageIndex])
             else Guardo_Pseudocodigo;
     end;
    end;
   if Notebook1.PageCount>1 then
     begin
      Notebook1.Pages.Delete(Index);
      hojas.Delete(Index);
      Notebook1.Update;
      Archivo.delete(index);
      end
     else begin
          SynEdit1.ClearAll;
          hojas.Strings[0]:='';
          if Archivo.count=1 then
              Archivo.Strings[0]:='';
          Notebook1.Page[0].Caption:='Sin Titulo 0';
          end;
  end;
 end;

end.

