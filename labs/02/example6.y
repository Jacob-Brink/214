%{
#include <stdio.h>
#include <string.h>

/* declarations */
int yylex (void);
void yyerror (char const *);
int yyparse(void);

/* definitions */ 
void yyerror(const char *str) {
        fprintf(stderr,"error: %s\n",str);
}
 
int yywrap() {
        return 1;
} 
 
int main() {
        yyparse();
} 

%}

%token NUMBER TOKHEAT STATE TOKSET TOKTEMPERATURE TOKHUMIDITY
%%

commands: /* empty */
        | commands command
        ;

command:
        heat_switch
        | temperature_set
	| humidity_set
        ;

heat_switch:
        TOKHEAT STATE
        {
                if ($2) {  /* if STATE == 1 */
                        printf("\tHeat turned on\n");
                } else {
                        printf("\tHeat turned off\n");
                }
        }
        ;

humidity_set:
        TOKSET TOKHUMIDITY NUMBER
	{
	  printf("\tHumidity set to %d\n", $3);
	}
        ;

temperature_set: 
        TOKSET TOKTEMPERATURE NUMBER
        {
                printf("\tTemperature set to %d\n",$3);
        }
        ;
