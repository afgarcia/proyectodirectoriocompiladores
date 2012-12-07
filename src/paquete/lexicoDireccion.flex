package paquete;
import java_cup.runtime.*;
import java.lang.System.*;
%%

%cup

Blanco  = [\r\n \t\f]

//VIA = [\"CRA\"]
REF = [0-9]{1,3}[A-Z]?
NUMERAL = [\#]
GUION = [\-]
BARRIO = [a-zA-Z]*


%%

{Blanco} {/* No haga nada */}

//{VIA} {return new Symbol(sym.VIA);}
"CRA" {return new Symbol(sym.VIA);}
"CLL" {return new Symbol(sym.VIA);}
"AV" {return new Symbol(sym.VIA);}
"DIAG" {return new Symbol(sym.VIA);}

{REF} {return new Symbol(sym.REF);}
{NUMERAL} {return new Symbol(sym.NUMERAL);}
{GUION} {return new Symbol(sym.GUION);}
{BARRIO} {return new Symbol(sym.BARRIO);}

. {System.out.println("Error Lexico");}