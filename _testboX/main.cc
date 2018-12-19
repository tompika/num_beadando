#include "../../../_stufF/lib.h"

int main(){
   int n=olvasI();
   MAT A; resize(A,n,n); olvas(A);


   int cs=0,co=0;// hanszor nincs benne
   for(int i=0;i<n;i++){
      double k=A[i][i];
      double rs=0,ro=0;
      for(int j=0;j<n;j++){
         if(j!=i){
            rs+=abs(A[i][j]);
            ro+=abs(A[j][i]);
         }
      }
      cs+=(k+rs<0 || k-rs>0);
      co+=(k+ro<0 || k-ro>0);
   }

   if(cs==n || co ==n){
      printf("yes\n");
   }else{
      printf("dunno\n");
   }


   return 0;
}
