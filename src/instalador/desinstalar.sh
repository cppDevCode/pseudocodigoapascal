#!/bin/bash
#################################################
#      CREADO POR ALEJANDRO LUCAS BALDRES       #
#############(C)2006#############################
#ESTE SCRIPT SE DISTRIBUYE BAJO LICENCIA GNU/GPL#
#################################################
#Variables de Directorios
DIR_INSTAL_DATOS=/usr/share/pseudocodicoapascal/
DIR_INSTAL_BIN=/usr/bin/
Operador="p"

#fin de inicializacion
#pantalla
clear
echo "Bienvenido al Instalador de pseudocodicoapascal"
echo "(C) 2006 - Alejandro Lucas Baldres"
echo "Versión del Desinstalador: 1.0v"
echo "----------------------------------------"
echo ""
echo "Ingrese la contraseña de administrador: "
sudo echo ""
clear
echo "Bienvenido al Desinstalador de pseudocodicoapascal"
echo "(C) 2006 - Alejandro Lucas Baldres"
echo "Versión del Instalador: 1.0v"
echo "----------------------------------------"
echo ""
echo ""
echo "Desea Comenzar la Desinstalacion? [s/n]"
read operador
if [ $operador = "s"  -o  $operador = "S" ]; then
     echo "Borrando Datos..."   
#     sudo rm ${DIR_INSTAL_DATOS}*
#     sudo rm ${DIR_INSTAL_DATOS}datos/*
#     sudo rm ${DIR_INSTAL_DATOS}doc/*
#     sudo rm ${DIR_INSTAL_DATOS}ejemplos/*
#     sudo rm ${DIR_INSTAL_DATOS}src/gui/*
#     sudo rm ${DIR_INSTAL_DATOS}src/instalador/*
#     sudo rm ${DIR_INSTAL_DATOS}src/nucleo/*
#     sudo rm ${DIR_INSTAL_DATOS}tools/*
     sudo rm -r ${DIR_INSTAL_DATOS}
     #Borrando Binarios
     echo "Borrando Binarios..."
     sudo rm ${DIR_INSTAL_BIN}nucleo
     sudo rm ${DIR_INSTAL_BIN}pseudocodicoapascal 
     #Borrando Accesos Directos
     if [ -h ${HOME}/Desktop/pseudocodicoapascal ]; then
	     echo "Borrando Lanzadores..."
	     sudo rm ${HOME}/Desktop/pseudocodicoapascal
	     sudo rm /usr/share/applications/pseudocodicoapascal.desktop
	     sudo rm /usr/share/pixmaps/pseudocodicoapascal.png
     fi
     echo "Desinstalacion completa!!! GRACIAS POR UTILIZAR EL PROGRAMA!!!"   
 else echo "Ha Abortado la Desinstalación!!!!";
fi



