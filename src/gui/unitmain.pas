unit UnitMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, Menus,
  SynEdit, SynHighlighterAny,ComCtrls, Buttons, StrUtils, ExtCtrls,
  PairSplitter, StdCtrls,SynHighlighterPas, Process,dos, LazHelpHTML,
  HelpIntfs, SynCompletion;
  
Procedure Guardo_Pseudocodigo;

Const
Version='0.1.1.99l';
READ_BYTES = 2048;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtnZip: TBitBtn;
    BitBtnCompilar: TBitBtn;
    BitBtnConf: TBitBtn;
    BitBtnCred: TBitBtn;
    BitBtnGuardar: TBitBtn;
    BitBtnAbrir: TBitBtn;
    BitBtnTrad: TBitBtn;
    BitBtnNuevo: TBitBtn;
    HTMLBrowserHelpViewer1: THTMLBrowserHelpViewer;
    HTMLHelpDatabase1: THTMLHelpDatabase;
    Label2: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuAbrir: TMenuItem;
    MenuItem2: TMenuItem;
    MenuCreditos: TMenuItem;
    MenuGuardar: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuCompilo: TMenuItem;
    MenuGuardar1: TMenuItem;
    MenuConceptos: TMenuItem;
    MenuContenido: TMenuItem;
    MenuComprimir: TMenuItem;
    MenuCortar: TMenuItem;
    MenuCopiar: TMenuItem;
    MenuItem5: TMenuItem;
    MenuCortar1: TMenuItem;
    MenuCopiar1: TMenuItem;
    MenuDeshacer: TMenuItem;
    MenuItem6: TMenuItem;
    MITHistorial: TMenuItem;
    MIRoadto: TMenuItem;
    MITMensajes: TMenuItem;
    MenuRehacer: TMenuItem;
    MenuPegar1: TMenuItem;
    MenuPegar: TMenuItem;
    Menupseudocodigo: TMenuItem;
    Menurtl: TMenuItem;
    MenuTrad: TMenuItem;
    MenuOpciones: TMenuItem;
    MenuNuevo: TMenuItem;
    MenuSalir: TMenuItem;
    Notebook1: TNotebook;
    Page1: TPage;
    PairSplitter1: TPairSplitter;
    PairSplitterSide1: TPairSplitterSide;
    PairSplitterSide2: TPairSplitterSide;
    PopupMenu1: TPopupMenu;
    SaveDialog1: TSaveDialog;
    Barra_Estado: TStatusBar;
    SynAnySyn1: TSynAnySyn;
    SynAutoComplete1: TSynAutoComplete;
    SynEdit1: TSynEdit;
    SynEdit2: TSynEdit;
    ToolBar1: TToolBar;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtnCompilarClick(Sender: TObject);
    procedure BitBtnZipClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ImageList1Change(Sender: TObject);
    procedure MIRoadtoClick(Sender: TObject);
    procedure MITHistorialClick(Sender: TObject);
    procedure MITMensajesClick(Sender: TObject);
    procedure MenuAbrirClick(Sender: TObject);
    procedure MenuCompiladorClick(Sender: TObject);
    procedure MenuComprimirClick(Sender: TObject);
    procedure MenuConceptosClick(Sender: TObject);
    procedure MenuContenidoClick(Sender: TObject);
    procedure MenuCopiarClick(Sender: TObject);
    procedure MenuCortarClick(Sender: TObject);
    procedure MenuCreditosClick(Sender: TObject);
    procedure MenuDeshacerClick(Sender: TObject);
    procedure MenuGuardar1Click(Sender: TObject);
    procedure MenuGuardarClick(Sender: TObject);
    procedure MenuNuevoClick(Sender: TObject);
    procedure MenuOpcionesClick(Sender: TObject);
    procedure MenuPegarClick(Sender: TObject);
    procedure MenuRehacerClick(Sender: TObject);
    procedure MenuSalirClick(Sender: TObject);
    procedure MenupseudocodigoClick(Sender: TObject);
    procedure MenurtlClick(Sender: TObject);
    procedure Notebook1ChangeBounds(Sender: TObject);
    procedure Notebook1CloseTabClicked(Sender: TObject);
    procedure Notebook1Enter(Sender: TObject);
    procedure Notebook1MouseDown(Sender: TOBject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Notebook1MouseUp(Sender: TOBject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Notebook1PageChanged(Sender: TObject);
    procedure PairSplitter1MouseDown(Sender: TOBject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SynEdit1Change(Sender: TObject);
    procedure SynEdit1ClearBookmark(Sender: TObject; var Mark: TSynEditMark);
    procedure SynEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure SynEdit1KeyPress(Sender: TObject; var Key: char);
    procedure SynEdit1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { private declarations }
  public
    { public declarations }
 end;

 { HILOS }
   HiloCargaOpc=Class(TThread)
   private
   fStatusText: String;
   procedure showStatus;
   protected
   procedure Execute; override;
   public
   constructor create(CreateSuspended:boolean);
   end;
   
var
  Form1: TForm1; 
  Archivo:TStringList;
  CompilarArchivo:String;
  Argumentosfpc:String='';
  Argumentosupx:String='-1';
  GeneroLog:integer=-1;
  //Fechas
  Dias:Integer=0;
  Fecha_inicio:TDateTime=14/11/1984;
  //fin fechas
  //Graficos
  Hojas:TstringList;
  OnVentana:Boolean=true;
  //fin graficos
  //Rutas
  Ruta_Doc,Ruta_Ejemplos:String;
  Rutafpc:String;
  RutaCompresor:String;
  RutaDiccionario:String;
  //fin rutas
  //Booleanos
  ClickNueva:Boolean=false;


implementation

{ TForm1 }
uses
UnitFunciones,UnitCreditos,UnitOpciones,UnitError,Unitvalido,DateUtils,
UnitDestruccion;//Unidad que determina si se guardo o no lo que hay en las solapas

procedure Abro(arch:String;edit:TSynEdit);
 var
 aux:String;

 begin
 assign (Input,Arch);
 reset(Input);
 edit.ClearAll;
 while not eof(Input) do
       begin
       readln(Input,aux);
       edit.Lines.Add(aux);
       end;
 close(input);
 end;

 
 procedure Asigno_Booleano(bool:Boolean);
  begin
  with form1 do
   begin
   BitBtnGuardar.enabled:=bool;
   MenuGuardar.enabled:=bool;
   BitBtnTrad.enabled:=bool;
   Menutrad.enabled:=bool;
   MenuGuardar1.Enabled:=bool;
   end;
  end;

procedure Habilito_Botones;
 var
 aux:String;
 
 begin
 aux:=form1.synedit1.Lines[0];
 aux:=DelSpace(aux);
 if Length(aux)>0 then
                 Asigno_booleano(true)
        else Asigno_booleano(false);
 aux:=#0;
 end;
 
procedure TForm1.MenuAbrirClick(Sender: TObject);

begin
SaveDialog1.Title:='Abrir Pseudocodigo';
 SaveDialog1.Execute;
 try
   begin
   if (SynEdit1.Lines.Count>0) then
        begin
        Notebook1.Pages.Add(ExtractFilename(Savedialog1.FileName));
        abro(Savedialog1.FileName,SynEdit1);
        Synedit1.Lines.Delete(0);
        hojas.add(Synedit1.Text);
        Archivo.add(Savedialog1.FileName);
        Notebook1.PageIndex:=Notebook1.PageIndex+1;
        end
      else begin
           Notebook1.Page[Notebook1.PageIndex].Caption:=ExtractFilename(Savedialog1.FileName);
           abro(Savedialog1.FileName,SynEdit1);
           hojas.Strings[Notebook1.PageIndex]:=synedit1.Text;
           Archivo.strings[Notebook1.PageIndex]:=SaveDialog1.FileName;
           end;
   BitBtnTrad.enabled:=true;
   Menutrad.enabled:=true;
   Savedialog1.FileName:='';
   BitbtnCompilar.enabled:=false;
   bitBtnZip.Enabled:=false;
   MenuCompilo.enabled:=false;
   end;
 except FrmMensajes.memtrad.lines.add ('Ha cancelado la apertura del archivo');
 end;
end;


///////////////////////////////////////////////HILO DE CARGA
Constructor HiloCargaOpc.Create (CreateSuspended:boolean);
begin
FreeOnTerminate:=true;
inherited Create(CreateSuspended);
end;

procedure HiloCargaOpc.showStatus;
 begin
 FrmMensajes.Memtrad.Lines.Add(fstatusText);
 end;

procedure HiloCargaOpc.execute;
 var
 Cad:String;
 Col:Tcolor;
 Num:Integer;
 EstadoNuevo:String;

 begin
 fstatusText:='Iniciando la Carga de la configuracion...';
 Synchronize(@ShowStatus);
 fstatusText:='Intentando Cargar la configuracion...';
 Synchronize(@ShowStatus);
 if fileExists('Configuracion') then
     begin
       with form1 do
            begin
            assignfile (Input,'Configuracion');
            reset(Input);
            //Color fondo
            readln(Input,Col);
            SynEdit1.color:=Col;
            //Espaciado entre lineas
            readln(Input,Num);
            SynEdit1.ExtralineSpacing:=Num;
            //Nombre de letra
            readln(Input,Cad);
            SynEdit1.Font.Name:=Cad;
            //tama�o de la letra
            readln(Input,Num);
            SynEdit1.font.size:=Num;
            //color de la letra
            readln(Input,Col);
            SynEdit1.font.color:=Col;
            //Color del Gutter
            readln(Input,Col);
            SynEdit1.Gutter.color:=Col;
            //Cantidad de Digitos del Gutter
            readln(Input,Num);
            SynEdit1.Gutter.DigitCount:=Num;
            //Mostrar ceros Adelante
            readln(input,Cad);
            SynEdit1.Gutter.LeadingZeros:=StrToBool(Cad);
            //Comenzar con 0
            readln(input,Cad);
            SynEdit1.Gutter.ZeroStart:=StrToBool(cad);
            //Mostrar Nro de Linea
            readln(Input,Cad);
            SynEdit1.Gutter.ShowLineNumbers:=StrToBool(Cad);
            //Ruta del Compilador
            readln(Input,rutafpc);
            //Argumentos del Compilador
            readln(Input,Argumentosfpc);
            //Muestro Ventana
            readln(input,Cad);
            if StrToBool(cad)=TRUE then
                   FrmMensajes.Visible:=true
                else begin
                     Onventana:=false;
                     FrmMensajes.Visible:=false;
                     end;
           //Ruta del compresor
           readln(input,rutacompresor);
           //Argumentos UPX
           readln(input,argumentosupx);
           //Diccionario
           readln(input,RutaDiccionario);
           //genero log?
           readln(Input,cad);
           GeneroLog:=StrToint(cad);
           //Extraigo DIas
           Readln(Input,dias);
           //Extraigo Fecha
           Readln(Input,Fecha_Inicio);
           closefile(input);
           EstadoNuevo:='Configuracion Cargada!';
           end;
       end
     else EstadoNuevo:='No se ha guardado ninguna configuracion.';
     fstatusText:=EstadoNuevo;
     Synchronize(@ShowStatus);
  end;
///////////////////////////////Hilo de Carga
procedure TForm1.FormCreate(Sender: TObject);
var
Cargo:HiloCargaOpc;

begin
//creo la lista
Hojas:=TStringList.Create;
hojas.add('');
Archivo:=TStringlist.Create;
Archivo.add('');
Inicializo_Rutas (Rutafpc,RutaCompresor,RutaDiccionario,Ruta_Ejemplos,Ruta_Doc);
Form1.Caption:='PseudoTrans '+Version;
Cargo:=HiloCargaOpc.create(true);
if Assigned(cargo.FatalException) then
    raise Cargo.FatalException;
Cargo.resume;
 //verifico si borro el historial
 //existe el historial? y tengo que borrarlo automaticamente?
 if fileexists('pseudotrans.log')and(dias>0)and(DaysBetween(Fecha_Inicio,today())=0) then
       begin
        deletefile('pseudotrans.log');
        Fecha_inicio:=IncDay(Today(),Dias);
        end;
Notebook1.Page[Notebook1.PageIndex].Caption:=Notebook1.Page[Notebook1.PageIndex].Caption+' '+IntToStr(Notebook1.PageIndex);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
end;

procedure TForm1.ImageList1Change(Sender: TObject);
begin

end;

procedure TForm1.MIRoadtoClick(Sender: TObject);
var
h:String;

begin
HTMLHelpDatabase1.ShowURL('http://pseudotrans.blogspot.com','Pseudotrans: Road To 1.0',h)
end;

procedure TForm1.MITHistorialClick(Sender: TObject);
begin
  Application.CreateForm(TFrmOpciones, FrmOpciones);
  FrmOpciones.Tabs.TabIndex:=5;
  FrmOpciones.Show;
end;

procedure TForm1.MITMensajesClick(Sender: TObject);
begin
  if MITMensajes.Checked then begin
                              frmMensajes.Visible:=false;
                              MitMensajes.checked:=false;
                              end
     else begin
          frmMensajes.Visible:=true;
          MitMensajes.checked:=true;
          end;
end;

procedure TForm1.BitBtnCompilarClick(Sender: TObject);
var
  S: TStringList;
  M: TMemoryStream;
  P: TProcess;
  n: LongInt;
  BytesRead: LongInt;

procedure Genero_log (S: TStringList);
 var
 i:Integer;
 
 begin
 assignfile(Output,'pseudotrans.log');
 if not fileExists('pseudotrans.log') then
    rewrite(Output)
  else append(Output);
 writeln(Output,'[Generado el: '+DateTimeToStr(now()));
 for i:=0 to S.count-1 do
     writeln(output,S[n]);
 closefile(Output);
 end;
 
begin
  Form1.Caption:=Form1.Caption+' (Compilando...)';
  try
  //////////////INICIALIZACION
  //CREO OBJETO DE TIPO MEMORIA PARA IR LEYENDO Y LE ASIGNO UNA VARIABLE
  M:=TmemoryStream.create;
  //CREO EL OBJETO DEL TIPO PROCESO
  P:=TProcess.create(nil);
  //INICIALIZO LA VARIABLES DE BYTES LEIDOS
  BytesRead:=0;
  /////////////FIN DE INICIALIZACION
  //SETEO DE OPCIONES
  P.commandline:=rutafpc+Argumentosfpc + ' '+ CompilarArchivo;
  P.Options:=[poUsepipes];
  if fileExists(rutafpc) then
    begin
    //ejecuto el programa externo
    P.execute;
    //mientras el programa externo este corriendo
    while P.running do
          begin
          //Reservo 2 k de memory puesto que en linux cada conducto ocupa como max 2 kb
          M.setsize(BytesRead+READ_BYTES);
          //intento leer desde memoria
          n:=P.output.Read((m.memory+BytesRead)^,READ_BYTES);
          if n>0 then
            Inc(BytesRead,n)
            else sleep (100);
          end;
    //leemos la ultima parte
    repeat
    M.setSize(BytesRead+READ_BYTES);
    n:=P.output.Read((m.Memory+BytesRead)^,READ_BYTES);
    if n>0 then
     Inc(BytesRead,n);
    until n<=0;
    if BytesRead>0 then frmMensajes.Memtrad.Lines.Add('');
    M.setSize(BytesRead);
    //CREO OBJETO DE TIPO LISTA DE CADENA Y SE LO ASIGNO A UNA VARIABLE
    S:=TStringList.create;
    S.loadFromStream(M);
    frmMensajes.Memtrad.Lines.Add('Enlazando...');
    for n:=5 to S.count-2 do
        frmMensajes.Memtrad.Lines.Add(S[n]);
    frmMensajes.Memtrad.Lines.Add(Copy2Space(S[S.count-1])+' Lineas Compiladas en '+RightStr(S[S.count-1],findPart('in',S[S.count-1])+3));
    if Generolog=2 then
       Genero_log(S);
    end
  else begin
       frmError.Memo1.Caption:='No Tiene Instalado un compilador de pascal o la ruta es erronea';
       frmError.show;
       frmMensajes.Memtrad.Lines.Add('No Tiene Instalado un compilador de pascal o la ruta es erronea');
       end;
  finally
  Form1.Caption:='PseudoTrans '+Version;
  M.free;
  S.free;
  P.free;
  end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 Salvo_no_guardado (Notebook1.PageIndex);
end;

procedure TForm1.BitBtnZipClick(Sender: TObject);
begin
  if not fileExists(CompilarArchivo) then
     BitBtnCompilarClick(nil)
     else begin
          delete(CompilarArchivo,length(CompilarArchivo)-Length(ExtractFileExt(CompilarArchivo))+1,Length(ExtractFileExt(CompilarArchivo)));
          frmMensajes.Memtrad.Lines.Add('Comprimiendo ejecutable...');
          executeprocess(RutaCompresor,' '+Argumentosupx+' '+CompilarArchivo);
          frmMensajes.Memtrad.Lines.Add('Se ha comprimido el ejecutable :)');
          end;
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var
i:integer;

begin
if Generolog=3 then
    begin
    assignfile(Output,'pseudotrans.log');
    if not fileExists('pseudotrans.log') then
       rewrite(Output)
      else append(Output);
    for i:=0 to frmMensajes.Memtrad.Lines.Count-1 do
        writeln(Output,frmMensajes.Memtrad.Lines.Strings[i]);
    closefile(Output);
    end;
Notebook1.Refresh;
for i:=0 to Notebook1.PageCount-1 do
    salvo_no_guardado(0);

end;

Procedure Guardo_Pseudocodigo;
 var
 aux:String;
 
 begin
 begin
 Form1.SaveDialog1.Title:='Guardar Pseudocodigo';
 Form1.SaveDialog1.execute;
       try
          begin
          aux:=Form1.SaveDialog1.filename;
          Guardo_Pse (aux);
          Form1.SaveDialog1.filename:='';
          if findPart('*',Form1.Notebook1.Page[form1.Notebook1.PageIndex].Caption)>0 then
             delchars(form1.Notebook1.Page[form1.Notebook1.PageIndex].Caption,'*');
          end
       except frmMensajes.memtrad.lines.add('Ha Cancelado el guardado del Documento');
       end;
 end;
 end;

procedure TForm1.MenuCompiladorClick(Sender: TObject);
  procedure guardo;


var
  S: TStringList;
  M: TMemoryStream;
  P: TProcess;
  n: LongInt;
  BytesRead: LongInt;
  
  begin
   M := TMemoryStream.Create;
  BytesRead := 0;
   P := TProcess.Create(nil);
  SaveDialog1.Title:='Guardar Codigo fuente';
  Savedialog1.execute;
  try
    begin
    Form1.Caption:=Form1.Caption+'(Traduciendo...)';
    if GeneroLog=1 then
       P.CommandLine:='nucleo'+' '+Archivo[Notebook1.PageIndex]+' '+SaveDialog1.filename+' '+RutaDiccionario+' '+'--log'
     else P.CommandLine:='nucleo'+' '+Archivo[Notebook1.PageIndex]+' '+SaveDialog1.filename+' '+RutaDiccionario;
    P.Options := [poUsePipes];
    P.Execute;
  while P.Running do
  begin
    // nos aseguramos de tener espacio
    M.SetSize(BytesRead + READ_BYTES);
    // intentamos leerlo
    n := P.Output.Read((M.Memory + BytesRead)^, READ_BYTES);
    if n > 0
    then begin
      Inc(BytesRead, n);
    end
    else begin
      // sin datos, esperamos 100 milisegundos
      Sleep(100);
    end;
  end;
  // leemos la última parte
  repeat
    // nos aseguramos de tener espacio
    M.SetSize(BytesRead + READ_BYTES);
    // intentamos leerlo
    n := P.Output.Read((M.Memory + BytesRead)^, READ_BYTES);
    if n > 0
    then begin
      Inc(BytesRead, n);
      frmMensajes.Memtrad.Lines.Strings[frmMensajes.Memtrad.Lines.Count-1]:=frmMensajes.Memtrad.Lines.Strings[frmMensajes.Memtrad.Lines.Count-1]+'.';
    end;
  until n <= 0;
  if BytesRead > 0 then frmMensajes.Memtrad.Lines.Add('');
  M.SetSize(BytesRead);
  S := TStringList.Create;
  S.LoadFromStream(M);
  for n := 4 to S.Count - 4 do
  begin
    frmMensajes.Memtrad.Lines.Add(S[n]);
  end;
  S.Free;
  P.Free;
  M.Free;
  CompilarArchivo:=SaveDialog1.filename;
  if fileExists(SaveDialog1.filename) then
                        begin
                        synedit2.ClearAll;
                        abro(SaveDialog1.filename,synEdit2);
                        BitbtnCompilar.enabled:=true;
                        MenuCompilo.enabled:=true;
                        bitBtnZip.Enabled:=true;
                        MenuComprimir.Enabled:=true;
                        end;
    SaveDialog1.filename:='';
    end;
  except FrmMensajes.memTrad.lines.add('Ha cancelado la traduccion');
  end;
  end;
 
begin
Asigno_Booleano(false);
if (Archivo[Notebook1.PageIndex]<>'')and(not fileExists(Archivo[Notebook1.PageIndex])) then
       begin
       Guardo_Pseudocodigo;
       Guardo;
       end
 else Guardo;
Asigno_Booleano(true);
frmMensajes.Memtrad.Lines.Add('Se ha traducido ' +IntToStr(SynEdit1.Lines.Count) + ' lineas exitosamente :)');
Form1.Caption:='PseudoTrans '+Version;
end;

procedure TForm1.MenuComprimirClick(Sender: TObject);
begin

end;

procedure TForm1.MenuConceptosClick(Sender: TObject);
begin
  ShowHelpOrErrorForKeyword('','/usr/share/pseudotrans/doc/conceptos.html');
end;

procedure TForm1.MenuContenidoClick(Sender: TObject);
begin
 ShowHelpOrErrorForKeyword('','/usr/share/pseudotrans/doc/index.html');
end;

procedure TForm1.MenuCopiarClick(Sender: TObject);
begin
  SynEdit1.CopyToClipboard;
  MenuPegar.Enabled:=true;
  MenuPegar1.Enabled:=true;
end;

procedure TForm1.MenuCortarClick(Sender: TObject);
begin
  Synedit1.CutToClipboard;
  MenuPegar.Enabled:=true;
  MenuPegar1.Enabled:=true;
end;

procedure TForm1.MenuCreditosClick(Sender: TObject);
begin
  frmCreditos.show;
end;

procedure TForm1.MenuDeshacerClick(Sender: TObject);
begin
  SynEdit1.Undo;
  MenuRehacer.Enabled:=true;
end;

procedure TForm1.MenuGuardar1Click(Sender: TObject);
begin
  if fileExists(Archivo[Notebook1.PageIndex]) then
         Guardo_Pse (Archivo[Notebook1.PageIndex])
    else Guardo_Pseudocodigo;
end;

procedure TForm1.MenuGuardarClick(Sender: TObject);
begin
FrmError.Caption:='Esta Seguro?';
FrmError.BtnOk.Visible:=true;
FrmError.BtnCerrar.Caption:='No';
FrmError.Memo1.Caption:='Esta Seguro de Guardar el pseudocodigo?';
FrmError.Show;
end;

procedure TForm1.MenuNuevoClick(Sender: TObject);
begin
  ClickNueva:=true;
  SynEdit1.Lines.Clear;
  Synedit1.ClearAll;
  Hojas.Add('');
  Notebook1.Pages.Add('Sin Titulo '+IntToStr(Notebook1.PageIndex+1));
  Archivo.add('');
  SynEdit1.ClearAll;
  SynEdit2.ClearAll;
  Notebook1.PageIndex:=Notebook1.PageCount-1;
  Habilito_Botones;
  BitbtnCompilar.enabled:=false;
  MenuCompilo.enabled:=false;
  bitBtnZip.Enabled:=false;
end;

procedure TForm1.MenuOpcionesClick(Sender: TObject);
begin
  Application.CreateForm(TFrmOpciones, FrmOpciones);
  frmOpciones.Show;
end;

procedure TForm1.MenuPegarClick(Sender: TObject);
begin
  SynEdit1.PasteFromClipboard;
end;

procedure TForm1.MenuRehacerClick(Sender: TObject);
begin
  SynEdit1.Redo;
end;

procedure TForm1.MenuSalirClick(Sender: TObject);
var
i:integer;

begin
for i:=0 to Notebook1.PageCount-1 do
   Salvo_no_guardado(0);
application.Terminate;
end;

procedure TForm1.MenupseudocodigoClick(Sender: TObject);
begin
  ShowHelpOrErrorForKeyword('','/usr/share/pseudotrans/doc/pseudocodigo.html');
end;

procedure TForm1.MenurtlClick(Sender: TObject);
begin
  ShowHelpOrErrorForKeyword('','/usr/share/pseudotrans/doc/unidades.html');
end;

procedure TForm1.Notebook1ChangeBounds(Sender: TObject);
begin

end;

procedure TForm1.Notebook1CloseTabClicked(Sender: TObject);


begin

end;

procedure TForm1.Notebook1Enter(Sender: TObject);
begin

end;

procedure TForm1.Notebook1MouseDown(Sender: TOBject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TForm1.Notebook1MouseUp(Sender: TOBject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

end;


procedure TForm1.Notebook1PageChanged(Sender: TObject);
begin
if ClickNueva then
  ClickNueva:=false
    else Synedit1.Text:=hojas.Strings[Notebook1.PageIndex];
end;


procedure TForm1.PairSplitter1MouseDown(Sender: TOBject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TForm1.SynEdit1Change(Sender: TObject);
begin

end;

procedure TForm1.SynEdit1ClearBookmark(Sender: TObject; var Mark: TSynEditMark
  );
begin

end;

procedure TForm1.SynEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

end;

procedure TForm1.SynEdit1KeyPress(Sender: TObject; var Key: char);
begin

end;

procedure TForm1.SynEdit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    Habilito_Botones;
    Barra_Estado.Panels.Items[3].Text:='Nro de Lineas: '+IntToStr(SynEdit1.Lines.Count);
    hojas.Strings[Notebook1.PageIndex]:=Synedit1.text;
//    hojas.insert(Notebook1.PageIndex,Synedit1.Text);
    if FindPart('*',Notebook1.Page[Notebook1.PageIndex].Caption)=0 then
      Notebook1.Page[Notebook1.PageIndex].Caption:=Notebook1.Page[Notebook1.PageIndex].Caption+'*'
end;

initialization
  {$I unitmain.lrs}

end.

