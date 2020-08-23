#!/bin/bash
#################################################
#      CREADO POR ALEJANDRO LUCAS BALDRES       #
#############(C)2006#############################
#ESTE SCRIPT SE DISTRIBUYE BAJO LICENCIA GNU/GPL#
#################################################
#Variables de Directorios
DIR_INSTAL_DATOS=/usr/share/pseudocodigoapascal/
DIR_INSTAL_BIN=/usr/bin/
Operador="p"

#fin de inicializacion
#pantalla
clear
echo "Bienvenido al Actualizador del nucleo al la version 0.2.1.29"
echo "GUI a la 0.1.1.64"
echo "(C) 2006 - Alejandro Lucas Baldres"
echo "Versión del Actualizador: 0.1v"
echo "----------------------------------------"
echo ""
echo "Ingrese la contraseña de administrador: "
sudo echo ""
clear
echo "Bienvenido al Actualizador del nucleo al la version 0.2.1.29"
echo "GUI a la 0.1.1.64"
echo "(C) 2006 - Alejandro Lucas Baldres"
echo "Versión del Actualizador: 0.1v"
echo "----------------------------------------"
echo ""
echo "Los Datos del programa se Instalaran en: "${DIR_INSTAL_DATOS}
echo "Los archivos Binarios se Instalaran en: "${DIR_INSTAL_BIN}
echo ""
echo ""
echo "Desea Comenzar la Actualización? [s/n]"
read operador
if [ $operador = "s"  -o  $operador = "S" ]; then
     echo "Borrando los binarios antiguos..."
     sudo rm ${DIR_INSTAL_BIN}/nucleo
     sudo rm ${DIR_INSTAL_BIN}/pseudocodicoapascal
     echo "Borrando el readme antiguo..."
     sudo rm ${DIR_INSTAL_DATOS}/README
     sudo rm ${DIR_INSTAL_DATOS}/BUGS
     echo "Borrando los fuentes antiguos..."
     sudo rm ${DIR_INSTAL_DATOS}src/nucleo/*
     sudo rm ${DIR_INSTAL_DATOS}src/gui/*
     sudo rm ${DIR_INSTAL_DATOS}src/instalador/*
     echo "Copiando Readme..."
     sudo cp -i ./README ${DIR_INSTAL_DATOS}/README
     sudo chmod a=rx ${DIR_INSTAL_DATOS}/README
     echo "Copiando Notas de Bugs..."
     sudo cp -i ./BUGS ${DIR_INSTAL_DATOS}/BUGS
     sudo chmod a=rx ${DIR_INSTAL_DATOS}/BUGS
     echo "Copiando Fuentes..."        
     sudo cp -i ./src/nucleo/* ${DIR_INSTAL_DATOS}src/nucleo/
     sudo cp -i ./src/gui/* ${DIR_INSTAL_DATOS}src/gui/
     sudo chmod a=rx ${DIR_INSTAL_DATOS}src/gui/*
     sudo cp -i ./src/instalador/* ${DIR_INSTAL_DATOS}src/instalador/
     sudo chmod a=rx ${DIR_INSTAL_DATOS}src/instalador/*
     sudo chmod a=rx ${DIR_INSTAL_DATOS}src/nucleo/*
     echo "Copiando Documentación..."
     sudo cp -i ./doc/nucleo ${DIR_INSTAL_DATOS}doc/nucleo
     sudo chmod a=rx ${DIR_INSTAL_DATOS}doc/nucleo
     echo "Copiando Binarios..."
     sudo cp -i ./nucleo ${DIR_INSTAL_BIN}
     sudo chmod a=rx ${DIR_INSTAL_BIN}nucleo
     sudo cp -i ./pseudocodicoapascal ${DIR_INSTAL_BIN};
     sudo chmod a=rx ${DIR_INSTAL_BIN}pseudocodicoapascal
     #Creando carpetas nuevas
     echo "Creando Directorios nuevos..."
     sudo mkdir ${DIR_INSTAL_DATOS}iconos
     sudo chmod a=rx ${DIR_INSTAL_DATOS}iconos
     echo "Copiando iconos..."
     sudo cp -i ./iconos/pseudocodicoapascal.png ${DIR_INSTAL_DATOS}iconos/ 
     sudo chmod a=rx ${DIR_INSTAL_DATOS}iconos/pseudocodicoapascal.png
     echo "Actualización completa!!! GRACIAS POR UTILIZAR EL PROGRAMA!!!"   
 else echo "Ha Abortado la Actualización!!!!";
fi



