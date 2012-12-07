package paquete;
%%

%class YylexGramatica
%type String

//Definiciones def = expReg
Blanco  = [\r\n \t\f]
LetraMin = [a-z]
LetraMay = [A-Z]
numeros = [0-9]
numero=[0-1]
//ubicacion=[CLL|CRA|AVN|DIG|TRS]
dom=[.com|.net|.org|.edu|.mil|.gov]
sdom=[.co|.br|.es|.pe]

caracteresEspeciales = [-_.]

primerApellido = {LetraMay} {LetraMin}*
primerSegundo = {LetraMay} {LetraMin}*
nombre = {LetraMay} {LetraMin}*

celularPersona=[3]{numero}{numeros}{8}
telefonoPersona={numeros}{7}

//direccion={ubicacion}{numero}?{numeros}?{numeros}{LetraMay}?[#]{numero}?{numeros}{numeros}{LetraMay}?[-]{numero}?{numeros}{numeros}

email={LetraMin}({LetraMin}|{numeros}|{caracteresEspeciales})*[@]{LetraMin}({LetraMin}|{numeros}|{caracteresEspeciales})*{dom}{sdom}?
fechaNac={numeros}{numeros}[/]{numeros}{numeros}[/]{numeros}{numeros}

%%
//Patron {codigo Java}
{Blanco} {/* No haga nada */}
{primerApellido} {return "ApellidoValido";}
{email} {return "mailValido";}
{celularPersona} {return "celularValido";}
{telefonoPersona} {return "TelefonoValido";}
//{direccion} {return "direccionValida";}
{fechaNac} {return "fechaNacValida";}
. {return  ventanaPrincipal.getExpresionNoValida();}