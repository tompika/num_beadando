#include <cstdio>
#include <cstdlib>
#include <cmath>
#include <vector>

using namespace std;
typedef vector<double>VEK;
typedef vector<vector<double>>MAT;
VEK v;

double f(double x) {
	return v[0]*exp(v[1]*x)+v[2]*sin(v[3]*x)+v[4]*cos(v[5]*x)+v[6]*sin(exp(v[7]*x));
}
void olvas(VEK& v,int n){
   v.resize(n);
   for(int i=0;i<n;i++){
      scanf("%lf",&v[i]);
   }
}

// aki nem használta a default value-t, jarjon utana...
void olvas(MAT& A,int m,int n=-1){
   if(n<0){n=m;}
   A.resize(m);
   for(int i=0;i<m;i++){
      olvas(A[i],n);
   }
}

// alapban 8 tizedesig irunk ki
void ir(VEK& v,int prec=12){
   for(int i=0;i<int(v.size());i++){
      printf("%.*lf ",prec,v[i]);
   }
   printf("\n");
}


void ir(MAT& A,int prec=12){
   for(int i=0;i<int(A.size());i++){
      ir(A[i],prec);
   }
}
double Simpson(double(*F)(double),double a, double b, double m) {
	
	double h = (b - a) / m;
	double Sum4 = 0.0;
	int i;
	for (i = 0; i < m; i++) {
		double Xi = a + i * h;
		Sum4 += F(Xi + h / 2);
	}

	double Sum2 = 0.0;
	for (i = 1; i < m; i++) {
		double Xi = a + i * h;
		Sum2 += F(Xi);
	}

	return (h / 6) * (F(a) + (4 * Sum4) + (2 * Sum2) + F(b));
}
int main(int argc, char **argv)
{
	olvas(v,11);
	double m=v.back();
	v.pop_back();
	double b=v.back();
	v.pop_back();
	double a =v.back();
	v.pop_back();
	printf("%lf",Simpson(f,a,b,m));
	return 0;
}
