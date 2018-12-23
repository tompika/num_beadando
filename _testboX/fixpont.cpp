#include <iostream>
//#include <cmath>
#include <math.h>
#include <vector>
#include <stdlib.h>

using namespace std;

double F(double C0, double C1, double C2, double C3, double C4, double C5, double C6, double C7, double x) {
        return (C0 * exp(C1*x)) + (C2 * sin(C3*x)) + (C4*cos(C5*x)) + (C6 * sin(exp(C7*x)));
    }


bool Mctr(int k, int m, vector<double> X)
{
	for(int i=k;i>k-m+1;i--)
	{
		
		if(abs(X[i]-X[i-1])<abs(X[i-1]-X[i-2]))	return false;
	}
	return true;
}

int main()
{
	cout.precision(12);
	double C0, C1, C2, C3, C4, C5, C6, C7, X0;
	int s, m;
	cin>>C0>>C1>>C2>>C3>>C4>>C5>>C6>>C7>>X0>>s>>m;

        double Xk = 0;
        vector<double> Xks;
        bool isMctr = false;
        for (int i = 0; i < s; i++) {
            Xk = F(C0, C1, C2, C3, C4, C5, C6, C7, X0);
            X0 = Xk;
            Xks.push_back(Xk);
            if(i>2) isMctr=Mctr(i,m,Xks);
        }
        if(!isMctr||isnan(Xk)||!isfinite(Xk)) {
            cout<<"fail"<<endl;
        }
        else
        	cout<<Xk;
	return 0;
}

    