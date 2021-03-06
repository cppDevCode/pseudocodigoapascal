#!/bin/bash
#################################################
#      CREADO POR ALEJANDRO LUCAS BALDRES       #
#############(C)2006#############################
#ESTE SCRIPT SE DISTRIBUYE BAJO LICENCIA GNU/GPL#
#################################################
#Variables de Directorios
DIR_INSTAL_DATOS=/usr/share/psudocodigoapascal/
DIR_INSTAL_BIN=/usr/bin/
DIR_INSTAL_ICONOS=/usr/share/pixmaps/
Operador="p"

#INICIALIZACION DE ARCHIVOS
Directorios=(${DIR_INSTAL_DATOS} ${DIR_INSTAL_DATOS}datos ${DIR_INSTAL_DATOS}iconos ${DIR_INSTAL_DATOS}src ${DIR_INSTAL_DATOS}ejemplos ${DIR_INSTAL_DATOS}doc ${DIR_INSTAL_DATOS}tools ${DIR_INSTAL_DATOS}src/gui ${DIR_INSTAL_DATOS}src/instalador ${DIR_INSTAL_DATOS}src/nucleo)

Archivos=("./AUTHORS" "./BUGS" "./COPYING" "./desarrollo" "./README" "./desinstalar.sh")

#fin de inicializacion
#pantalla
clear
echo "Bienvenido al Instalador de Pseudocodigo a Pascal"
echo "(C) 2006 - Alejandro Lucas Baldres"
echo "Versión del Instalador: 1.0v"
echo "----------------------------------------"
echo ""
echo "Ingrese la contraseña de administrador: "
sudo echo ""
clear
echo "Bienvenido al Instalador de Pseudocodigo a Pascal"
echo "(C) 2006 - Alejandro Lucas Baldres"
echo "Versión del Instalador: 1.0v"
echo "----------------------------------------"
echo ""
echo "Los Datos del programa se Instalaran en: "${DIR_INSTAL_DATOS}
echo "Los archivos Binarios se Instalaran en: "${DIR_INSTAL_BIN}
echo ""
echo ""
echo "Desea Comenzar la Instalacion? [s/n]"
read operador
if [ $operador = "s"  -o  $operador = "S" ]; then
     echo "Creando Directorios..."   
     for i in 0 1 2 3 4 5 6 7 8 9
     do
     echo "Creando "${Directorios[i]}
     sudo mkdir ${Directorios[i]}
     sudo chmod a=rx ${Directorios[i]}
     done
     #copiando dir Datos
     echo "Copiando diccionarios..."
     sudo cp -i ./datos/* ${DIR_INSTAL_DATOS}datos/
     sudo chmod a=rx ${DIR_INSTAL_DATOS}datos/*
     #copiando doc
     echo "Copiando Documentacion..."
     sudo cp -i ./doc/* ${DIR_INSTAL_DATOS}doc/
     sudo chmod a=rx ${DIR_INSTAL_DATOS}doc/*
     #copiando src
     echo "Copiando Codigo fuente..."
     sudo cp -i ./src/gui/* ${DIR_INSTAL_DATOS}src/gui/
     sudo chmod a=rx ${DIR_INSTAL_DATOS}src/gui/*
     sudo cp -i ./src/nucleo/* ${DIR_INSTAL_DATOS}src/nucleo
     sudo chmod a=rx ${DIR_INSTAL_DATOS}src/nucleo/*
     sudo cp -i ./src/instalador/* ${DIR_INSTAL_DATOS}src/instalador
     sudo chmod a=rx ${DIR_INSTAL_DATOS}src/instalador/*
     #copiando ejemplos
     echo "Copiando ejemplos..."
     sudo cp -i ./ejemplos/* ${DIR_INSTAL_DATOS}ejemplos/
     sudo chmod a=rx ${DIR_INSTAL_DATOS}ejemplos/*
     #copiando tools
     echo "Copiando Herramientas..."
     sudo cp -i ./tools/* ${DIR_INSTAL_DATOS}tools/
     sudo chmod a=rx ${DIR_INSTAL_DATOS}tools/*
     #copiando Raiz en datos
     for i in 0 1 2 3 4 5
     do
     echo "Copiando "${Archivos[i]}"..."
     sudo cp -i ${Archivos[i]} ${DIR_INSTAL_DATOS}
     sudo chmod a=rx ${DIR_INSTAL_DATOS}${Archivos[i]}
     done
     #copiando Binarios
     echo "Copiando Binarios..."
     sudo cp -i ./nucleo ${DIR_INSTAL_BIN}
     sudo chmod a=rx ${DIR_INSTAL_BIN}/nucleo
     sudo cp -i ./psudocodigoapascal ${DIR_INSTAL_BIN};
     sudo chmod a=rx ${DIR_INSTAL_BIN}/pseudocodigoapascal
     echo "Copiando Iconos..."
     sudo cp -i ./iconos/pseudocodigoapascal.png ${DIR_INSTAL_DATOS}/iconos
     sudo chmod a=rx ${DIR_INSTAL_DATOS}/iconos/pseudocodigoapascal.png
     #Creando Accesos Directos
     echo "Desea crear los lanzadores? [s/n]"
     read operador
     if [ $operador = 's' -o $operador = 'S' ]; then  
	     echo "Creando Lanzadores..."
	     ln -s ${DIR_INSTAL_BIN}pseudocodigoapascal ${HOME}/Desktop
	     sudo chmod a=rwx ${HOME}/Desktop/pseudocodigoapascal
	     cp -i ./pseudocodigoapascal.desktop /usr/share/applications
	     sudo chmod a=rx /usr/share/applications/pseudocodigoapascal.desktop
	     ln -s ${DIR_INSTAL_DATOS}iconos/pseudocodigoapascal.png ${DIR_INSTAL_ICONOS}
	     sudo chmod a=rx ${DIR_INSTAL_ICONOS}pseudocodigoapascal.png
     fi
     echo "Instalacion completa!!! GRACIAS POR UTILIZAR EL PROGRAMA!!!"   
 else echo "Ha Abortado la Instalación!!!!";
fi



