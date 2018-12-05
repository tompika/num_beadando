#include <cstdio>
int f(int k){
  int ret=1;
  while(k>1){
    ret*=k;
    k--;
  }
  return ret;
}

int main(){
  int n;scanf("%d",&n);
  while(n--){
    int k;scanf("%d",&k);
    printf("%d\n",f(k));
  }
  return 0;
}
