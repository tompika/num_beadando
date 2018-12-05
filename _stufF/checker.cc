// az elso az elvart a masodik az elleenorzendo output file.
// ./checkeR jo.out  vajomilyen.out
//
// reszleges ujrairasa a checker.cc-nek
// int problemas, kivettem
// double es string tokenek sorozatának ellenőrzése
// (future: F 1e-12 S 0 I 1 I 0 alaku segedfile letrehozasa...)

#include <cstdio>
#include <cstring>
#include <cmath>
#include <cstdlib>
#include <cctype>

double const fTOL=5e-6;

int main(int npar, char** par){
   int exitCode;

   FILE *fJ;
   FILE *fC;


   char wJ[32*1024];
   char wC[32*1024];// buff overflow(scanf)!

   double tJ;
   double tC;


   if(npar<2){
      fprintf(stderr,"Usage: %s GoodOutput OutputToCheck\n",par[0]);
      exit(1);
   }

   fJ=fopen(par[1],"r");
   fC=fopen(par[2],"r");


   exitCode=0; // ok

   while(1==fscanf(fJ,"%s",wJ)){
      if( 1 != fscanf(fC,"%s",wC)){
         exitCode=1;
         break;
      }

      if(isalpha(wJ[0])){//sztring
         if(strcmp(wJ,wC)){
            exitCode=1;
            fprintf(stderr,"string mismatch\n");
            break;
         }
      }else{//float
         sscanf(wJ,"%lf",&tJ);
         if(1!=sscanf(wJ,"%lf",&tC)){
            fprintf(stderr,"expected a float, got %s\n",wJ);
            exitCode=2;
            break;
         }

         if(abs(tJ-tC)>fTOL){
            fprintf(stderr,"float not within tolerance\n");
            exitCode=3;
            break ;
         }
      }
   }

  fclose(fJ) ;
  fclose(fC);

  return exitCode ;
}
