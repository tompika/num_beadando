#include <cstdio>
#include <vector>
#include <cmath>

using namespace std;

void ir(vector<double> x,int nx){
   for(int j=0;j<nx;j++){
      printf("%10.4lf ",x[j]);
   }
   printf("\n");
   
      
}

int fakt(int n){
   int ret=1;
   while(n>1){
      ret*=(n--);
   }
   return ret;
}

int main(){
   vector<vector<double>> A(
      {{5,0,-2,1}, {1,3,-1,0}, {-1,-1,-4,1}, {0,-2,0,-10}}
   );


   int cs=0,co=0;// hanszor nincs benne
   int n=A.size();
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
      printf("inv\n");
   }else{
      printf("dunno\n");
   }


   return 0;
}
