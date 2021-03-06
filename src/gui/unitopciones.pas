unit Unitopciones;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, ComCtrls,
  StdCtrls, ColorBox, Buttons, Spin, SynEdit, EditBtn,StrUtils, ExtCtrls;

type

  { TFrmOpciones }

  TFrmOpciones = class(TForm)
    BitBtnAplicar: TBitBtn;
    BitCancelar: TBitBtn;
    Button1: TButton;
    BtnBorrarHist: TButton;
    CbxCero: TCheckBox;
    CbxIni_Cero: TCheckBox;
    CBNro_Linea: TCheckBox;
    ChBn: TCheckBox;
    ChBa: TCheckBox;
    ChBCe: TCheckBox;
    ChBg: TCheckBox;
    ChBgd: TCheckBox;
    ChBSd: TCheckBox;
    ChBSo: TCheckBox;
    ChBal: TCheckBox;
    ChBap: TCheckBox;
    ChBCD: TCheckBox;
    ChBMsj: TCheckBox;
    ChBd: TCheckBox;
    Chbt: TCheckBox;
    CBallmethods: TCheckBox;
    CBallfilters: TCheckBox;
    ColorGutter: TColorBox;
    ColorLetra: TColorBox;
    ColorFondo: TColorBox;
    Label15: TLabel;
    TDEejemplos: TDirectoryEdit;
    Label14: TLabel;
    TDEDoc: TDirectoryEdit;
    EFNCompilador: TFileNameEdit;
    FNEDiccionario: TFileNameEdit;
    FNECompresor: TFileNameEdit;
    FontDialog: TFontDialog;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GBComprimo: TGroupBox;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    LabFaltan: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MemHistorial: TMemo;
    Tabs: TPageControl;
    RGHistorial: TRadioGroup;
    RGComp: TRadioGroup;
    SECant_Digitos: TSpinEdit;
    SEEspaciado: TSpinEdit;
    SEcrp: TSpinEdit;
    SEDias: TSpinEdit;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    procedure BitBtnAplicarClick(Sender: TObject);
    procedure BitCancelarClick(Sender: TObject);
    procedure BtnBorrarHistClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ChBdClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure SEDiasChange(Sender: TObject);
    procedure TabSheet2ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  FrmOpciones: TFrmOpciones;

implementation

{ TFrmOpciones }
uses
UnitMain,UnitValido,DateUtils;

//GUARDO CONF.
Procedure Guardo_INI (Edit:TSynEdit);
 begin
 assign(Output,'Configuracion');
 rewrite(Output);
 writeln (Output,frmOpciones.ColorFondo.Selection);
 writeln(Output,frmOpciones.SEEspaciado.Text);
 writeln(Output,frmOpciones.FontDialog.Font.Name);
 writeln(Output,frmOpciones.fontDialog.Font.size);
 writeln(Output,frmOpciones.ColorLetra.Selection);
 writeln(Output,frmOpciones.ColorGutter.Selection);
 writeln(Output,frmOpciones.SECant_Digitos.Value);
 writeln(Output,frmOpciones.CbxCero.Checked);
 writeln(Output,frmOpciones.CbxIni_Cero.Checked);
 writeln(Output,frmOpciones.CBNro_Linea.Checked);
 writeln(Output,frmOpciones.EFNCompilador.FileName);
 writeln(Output,UnitMain.Argumentosfpc);
 writeln(Output,frmOpciones.ChBmsj.Checked);
 writeln(Output,frmOpciones.FNECompresor.FileName);
 writeln(Output,UnitMain.Argumentosupx);
 writeln(Output,frmOpciones.FNEDiccionario.FileName);
 writeln(Output,frmOpciones.rghistorial.itemindex);
 writeln(Output,frmOpciones.SEDias.Value);
 writeln(Output,UnitMain.Fecha_inicio);
 writeln(Output,frmOpciones.TDEejemplos.Directory);
 writeln(Output,frmOpciones.TDEDoc.Directory);
 close(Output);
 end;
 
procedure TFrmOpciones.BitCancelarClick(Sender: TObject);
begin
  frmopciones.Destroy;
end;

procedure TFrmOpciones.BtnBorrarHistClick(Sender: TObject);
begin
     deletefile('pseudotrans.log');
     BtnBorrarHist.Enabled:=false;
end;

procedure TFrmOpciones.Button1Click(Sender: TObject);
begin
  FontDialog.Execute;
end;

procedure TFrmOpciones.Button2Click(Sender: TObject);
begin

end;

procedure TFrmOpciones.ChBdClick(Sender: TObject);
begin
  if chBd.Checked then
     GBComprimo.Enabled:=false
   else GBComprimo.Enabled:=true;
end;


procedure TFrmOpciones.FormShow(Sender: TObject);
 var
 aux:String;

procedure Busco_Argumento(Argumento:String;origen:String;check:integer);
 begin
 if FindPart(Argumento,origen)<>0 then
    Case Check of
      0:chBn.checked:=true;
      1:chBa.checked:=true;
      2:chBCe.checked:=true;
      3:chBg.checked:=true;
      4:chBgd.checked:=true;
      5:chBsd.checked:=true;
      6:chBso.checked:=true;
      7:chbal.checked:=true;
      8:chbap.Checked:=true;
      9:chbCD.Checked:=true;
      10:RGComp.itemindex:=0;
      11:RGComp.itemindex:=1;
      12:RGComp.itemindex:=2;
      13:RGComp.itemindex:=3;
      14:RGComp.itemindex:=4;
      15:RGComp.itemindex:=5;
      16:RGComp.itemindex:=6;
      17:RGComp.itemindex:=7;
      18:RGComp.itemindex:=8;
      19:RGComp.itemindex:=9;
      20:SEcrp.Value:=StrToInt(Copy(UnitMain.Argumentosupx,FindPart(Argumento,origen)+1,Length(Unitmain.Argumentosupx)));
      21:chbt.Checked:=true;
      22:chbd.Checked:=true;
      23:cballmethods.Checked:=true;
      24:cballfilters.Checked:=true;
      end;
 end;

begin
  with form1 do
   begin
   EFNCompilador.FileName:=UnitMain.rutafpc;
   ColorFondo.Selection:=SynEdit1.color;
   SEEspaciado.text:=IntToStr(SynEdit1.ExtraLineSpacing);
   SECant_Digitos.Value:=SynEdit1.Gutter.DigitCount;
   FontDialog.Font.Name:=SynEdit1.Font.Name;
   FontDialog.Font.Size:=SynEdit1.Font.Size;
   ColorLetra.selection:=SynEdit1.Font.Color;
   ColorGutter.selection:=SynEdit1.Gutter.Color;
   SECant_Digitos.Value:=SynEdit1.Gutter.DigitCount;
   cbxCero.Checked:=SynEdit1.Gutter.LeadingZeros;
   cbxIni_Cero.Checked:=SynEdit1.Gutter.ZeroStart;
   cbNro_Linea.Checked:=SynEdit1.Gutter.ShowLineNumbers;
   Busco_Argumento('-n',UnitMain.Argumentosfpc,0);
   Busco_Argumento('-a',UnitMain.Argumentosfpc,1);
   Busco_Argumento('-Ce',UnitMain.Argumentosfpc,2);
   Busco_Argumento('-g',UnitMain.Argumentosfpc,3);
   Busco_Argumento('-gd',UnitMain.Argumentosfpc,4);
   Busco_Argumento('-Sd',UnitMain.Argumentosfpc,5);
   Busco_Argumento('-So',UnitMain.Argumentosfpc,6);
   Busco_Argumento('-al',UnitMain.Argumentosfpc,7);
   Busco_Argumento('-ap',UnitMain.Argumentosfpc,8);
   Busco_Argumento('-CD',UnitMain.Argumentosfpc,9);
   aux:=UnitMain.Argumentosupx;
   Busco_Argumento('-1',UnitMain.Argumentosupx,10);
   if aux=UnitMain.Argumentosupx then
      begin
      Busco_Argumento('-2',UnitMain.Argumentosupx,11);
      if aux=UnitMain.Argumentosupx then
         begin
         Busco_Argumento('-3',UnitMain.Argumentosupx,12);
         if aux=UnitMain.Argumentosupx then
            begin
            Busco_Argumento('-4',UnitMain.Argumentosupx,13);
            if aux=UnitMain.Argumentosupx then
               begin
               Busco_Argumento('-5',UnitMain.Argumentosupx,14);
               if aux=UnitMain.Argumentosupx then
                  begin
                  Busco_Argumento('-6',UnitMain.Argumentosupx,15);
                  if aux=UnitMain.Argumentosupx then
                     begin
                     Busco_Argumento('-7',UnitMain.Argumentosupx,16);
                     if aux=UnitMain.Argumentosupx then
                        begin
                        Busco_Argumento('-8',UnitMain.Argumentosupx,17);
                        if aux=UnitMain.Argumentosupx then
                           begin
                           Busco_Argumento('-9',UnitMain.Argumentosupx,18);
                           if aux=UnitMain.Argumentosupx then
                              begin
                              Busco_Argumento('best',UnitMain.Argumentosupx,19);
                              end;
                           end;
                        end;
                     end;
                  end;
               end;
            end;
         end;
      end;
   Busco_Argumento('=',unitMain.Argumentosupx,20);
   Busco_Argumento(' -t',UnitMain.Argumentosupx,21);
   Busco_Argumento(' -d',UnitMain.Argumentosupx,22);
   Busco_Argumento('--all-methods',UnitMain.Argumentosupx,23);
   Busco_Argumento('--all-filters',UnitMain.Argumentosupx,24);
   if Onventana then
      chbmsj.Checked:=true
    else chbmsj.Checked:=false;
   UnitMain.Argumentosfpc:='';
   UnitMain.Argumentosupx:='';
   FNECompresor.FileName:=UnitMain.RutaCompresor;
   FNEDiccionario.FileName:=UnitMain.RutaDiccionario;
   TDEejemplos.Directory:=UnitMain.Ruta_ejemplos;
   TDEdoc.Directory:=UnitMain.Ruta_Doc;
   RgHistorial.itemIndex:=GeneroLog;
   SEDias.Value:=UnitMain.Dias;
   if fileExists('pseudotrans.log') then
      begin
      MemHistorial.Lines.LoadFromFile('pseudotrans.log');
      aux:=IntToStr(DaysBetween(UnitMain.Fecha_Inicio,today()));
      LabFaltan.caption:='El Historial se Borrara dentro de '+aux+' Dias';
      btnBorrarhist.Enabled:=true
      end
      else begin
           btnBorrarhist.Enabled:=false;
           MemHistorial.Lines.add('No existe un archivo de Historial todavia!');
           end;
   end;
end;

procedure TFrmOpciones.PageControl1Change(Sender: TObject);
begin

end;

procedure TFrmOpciones.SEDiasChange(Sender: TObject);
begin
  UnitMain.Fecha_inicio:=IncDay(Today(),SEDias.Value);
end;

procedure TFrmOpciones.TabSheet2ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin

end;

procedure TFrmOpciones.BitBtnAplicarClick(Sender: TObject);

procedure Checkeo;
  begin
  if chBn.checked then
     begin
     UnitMain.Argumentosfpc:=UnitMain.Argumentosfpc+' '+'-n';
     end;
  if chBa.checked then
     begin
     UnitMain.Argumentosfpc:=UnitMain.Argumentosfpc+' '+'-a';
     end;
  if chBCe.checked then
     begin
     UnitMain.Argumentosfpc:=UnitMain.Argumentosfpc+' '+'-Ce';
     end;
  if chBg.checked then
     begin
     UnitMain.Argumentosfpc:=UnitMain.Argumentosfpc+' '+'-g';
     end;
  if chBgd.checked then
     begin
     UnitMain.Argumentosfpc:=UnitMain.Argumentosfpc+' '+'-gd';
     end;
  if chBsd.checked then
     begin
     UnitMain.Argumentosfpc:=UnitMain.Argumentosfpc+' '+'-Sd';
     end;
  if chBso.checked then
     begin
     UnitMain.Argumentosfpc:=UnitMain.Argumentosfpc+' '+'-So';
     end;
  if chBal.checked then
     begin
     UnitMain.Argumentosfpc:=UnitMain.Argumentosfpc+' '+'-al';
     end;
  if chBap.checked then
     begin
     UnitMain.Argumentosfpc:=UnitMain.Argumentosfpc+' '+'-ap';
     end;
  if chBCD.checked then
     begin
     UnitMain.Argumentosfpc:=UnitMain.Argumentosfpc+' '+'-CD';
     end;
  end;
begin
 with form1 do
      begin
      SynEdit1.color:=Colorfondo.Selection;
      SynEdit1.ExtraLineSpacing:=StrToInt(SEEspaciado.Text);
      SynEdit1.Font.Name:=FontDialog.Font.Name;
      SynEdit1.Font.Size:=FontDialog.Font.Size;
      SynEdit1.Font.Color:=ColorLetra.selection;
      SynEdit1.Gutter.Color:=ColorGutter.selection;
      SynEdit1.Gutter.DigitCount:=SECant_Digitos.Value;
      SynEdit1.Gutter.LeadingZeros:=cbxCero.Checked;
      SynEdit1.Gutter.ZeroStart:=cbxIni_Cero.Checked;
      SynEdit1.Gutter.ShowLineNumbers:=cbNro_Linea.Checked;
      UnitMain.rutafpc:=EFNCompilador.FileName;
      if chbmsj.Checked then
            begin
            onventana:=true;
            FrmMensajes.Visible:=true
            end
        else    begin
                 onventana:=false;
                 FrmMensajes.Visible:=false;
                 end;
      checkeo;
      UnitMain.RutaCompresor:=FNECompresor.FileName;
      UnitMain.Ruta_Ejemplos:=TDEejemplos.Directory;
      UnitMain.Ruta_Doc:=TDEDoc.Directory;
      if chbd.Checked then
         UnitMain.Argumentosupx:='-d'
         else begin
              if chbt.Checked then
                 UnitMain.Argumentosupx:=UnitMain.Argumentosupx+' -t';
              Case RGComp.ItemIndex of
                 0:UnitMain.Argumentosupx:=UnitMain.Argumentosupx+' -1';
                 1:UnitMain.Argumentosupx:=UnitMain.Argumentosupx+' -2';
                 2:UnitMain.Argumentosupx:=UnitMain.Argumentosupx+' -3';
                 3:UnitMain.Argumentosupx:=UnitMain.Argumentosupx+' -4';
                 4:UnitMain.Argumentosupx:=UnitMain.Argumentosupx+' -5';
                 5:UnitMain.Argumentosupx:=UnitMain.Argumentosupx+' -6';
                 6:UnitMain.Argumentosupx:=UnitMain.Argumentosupx+' -7';
                 7:UnitMain.Argumentosupx:=UnitMain.Argumentosupx+' -8';
                 8:UnitMain.Argumentosupx:=UnitMain.Argumentosupx+' -9';
                 9:UnitMain.Argumentosupx:=UnitMain.Argumentosupx+' --best';
              end;
              If cballmethods.checked then
                 UnitMain.Argumentosupx:=UnitMain.Argumentosupx+' --all-methods';
              if cballfilters.checked then
                 UnitMain.Argumentosupx:=UnitMain.Argumentosupx+' --all-filters';
              UnitMain.Argumentosupx:=UnitMain.Argumentosupx+' --crp-ms='+IntToStr(SEcrp.value);
              end;
      UnitMain.RutaDiccionario:=FNEDiccionario.FileName;
      generolog:=RGHistorial.Itemindex;
      UnitMain.Dias:=SEDias.Value;
      Guardo_INI(SynEdit1);
      frmopciones.Destroy;
      end;
end;

initialization
  {$I unitopciones.lrs}

end.

