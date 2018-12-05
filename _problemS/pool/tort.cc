#include <cstdio>
int main(){

   int a,A,B,d; scanf("%d%d%d%d",&a,&A,&B,&d);
   printf("0.");
   int r=A;
   for(int i=0;i<d;i++){
      r*=a;
      printf("%d",r/B);
      r=r%B;
   }
   printf("\n");

   return 0;
}
