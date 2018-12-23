// az elso az elvart a masodik az elleenorzendo output file.
// ./checker jo.out  vajomilyen.out
// ez egy nagyon regi (10+ ev) valtozat, valahol van egy ujabb
// todo ujrairni

#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

#define TOL ( 0.00000005 )
#define INT_TOL 2

#define S_LETTER( a ) ( ( ( a ) >= 'a' ) && ( ( a ) <= 'z' ) )
#define ABS( a ) ( ( ( a ) < 0 ) ? (-( a )) : ( a ) )

int 
  is_float( char * ) ;


int main(int np,char**p)
{
  int
    ex_code , 
    isol , iact ;
  FILE
    * fact , * fsol ;
  char
    wact [ 1024 ] , wsol [ 1024 ] ; 

  double
    tact , tsol ;

  
  if(np<2){
      fact = fopen( "act.out" , "r" ) ;
      fsol = fopen( "sol.out" , "r" ) ;
  }else{
      fact = fopen( p[2] , "r" ) ;
      fsol = fopen( p[1] , "r" ) ;
        
  }
  ex_code = 0 ;
  while( 1 == fscanf( fsol , "%s" , wsol ) )
  {
    if( 1 != fscanf( fact , "%s" , wact ) ) 
    {
      ex_code = 1 ;
      break ;
    } 

    if( S_LETTER( wsol[ 0 ] ) )
    {
      if( strcmp( wsol , wact ) )
      {
        ex_code = 1 ;
        break ;
      }
    }
    else
    {
      if( is_float( wsol ) )
      {
        sscanf( wsol , "%lf" , & tsol ) ;
        sscanf( wact , "%lf" , & tact ) ;

        if( ABS( tact - tsol ) > TOL )
        {
          ex_code = 1 ;
          break ;
        }
      }
      else
      {
        sscanf( wsol , "%d" , & isol ) ;
        sscanf( wact , "%d" , & iact ) ;
        if( ABS( isol - iact ) > INT_TOL )
        {
          ex_code = 1 ;
          break ;
        }
      }
    }
  }

  if( 1 == fscanf( fact , "%s" , wact ) )
  {
    ex_code = 1 ;
  }
  
  fclose( fact ) ;
  fclose( fsol ) ;

  return ex_code ;
}

int is_float( char * x )
{
  int
    i ,
    nx ;
  
  nx = strlen( x ) ;
  x[ nx ] = '.' ;
  i = 0 ;
  while( x[ i ] != '.' )
    i += 1 ;
  x[ nx ] = 0 ;
  return ( i < nx ) ;  
}
