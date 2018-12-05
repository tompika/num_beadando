#include <cstdio>

int main(int npar, char**par){
//  fprintf(stderr,"npar=%d\n",npar);
  if(npar<2){
    fprintf(stderr,"Usage: %s key1 key2 < infile > outfile\nbeware of key1!=key2\n",par[0]);
    return 1;
  }

  char* const k1=par[1];
  char* const k2=par[2];
  
//  fprintf(stderr, "xoring with %s+%s\n",k1,k2);

  int bias=0;
  char* p1=k1;
  char* p2=k2;

  int c;
  while((c=getchar())!=EOF){
    putchar(c^(*p1)^(-*p2));
    
    if(!*(++p1)){
      p1=k1;
    }
    if(!*(++p2)){
      p2=k2;
    }

  }
  
  return 0;
}
