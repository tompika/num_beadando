#include <cstdio>
#include <vector>
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
   vector<vector<double>> adatok(
      {{-1,2,-11}, {1,0,-7}, {2,-49,-131}}
   );

   int nh=0;
   for(auto i:adatok){
      nh+=(i.size()-1);
   }

   vector<double> t(nh), f0(nh), f1(nh);
   int hol[nh];

   int ti=0;
   for(int i=0;i<adatok.size();i++){
      double x=adatok[i][0];
      double fx=adatok[i][1];
      
      for(int j=0;j<adatok[i].size()-1;j++){
         t[ti]=x;
         f0[ti]=fx;
         hol[ti]=i;
         ti++;
      }
   }

   ir(t,nh);
   ir(f0,nh);
   for(int j=1;j<nh;j++){
      for(int i=0;i<nh-j;i++){
         if(t[i]==t[i+j]){
            f1[i]=adatok[hol[i]][j+1]/fakt(j);
         }else{
            f1[i]=(f0[i]-f0[i+1])/(t[i]-t[i+j]);
         }
      }
      ir(f1,nh-j);
      swap(f0,f1);
   }






   return 0;
}
