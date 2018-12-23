#include <iostream>
#include <math.h>
#include <vector>

using namespace std;

 double F(double C0, double C1, double C2, double C3, double C4, double C5, double C6, double C7, double x) {
//        return (C0 * pow(M_E, C1*x)) + (C2 * sin(C3*x)) + (C4*cos(C5*x)) + (C6 * sin(pow(M_E, C7*x)));
        return (C0 * exp(C1*x)) + (C2 * sin(C3*x)) + (C4*cos(C5*x)) + C6 * sin(exp(C7*x));

    }

int main()
{
    double C0, C1, C2, C3, C4, C5, C6, C7, X0, X_1;
    int m;
    cin>>C0>>C1>>C2>>C3>>C4>>C5>>C6>>C7>>X_1>>X0>>m;

        if (m <= 0 || m >= 100) {
            cout<<"fail";
            return 0;
        }

        double Xk = 0;

        for (int i = 0; i < m; i++) {
            Xk = X0 - (F(C0, C1, C2, C3, C4, C5, C6, C7, X0) * (X0-X_1) / (F(C0, C1, C2, C3, C4, C5, C6, C7, X0) - F(C0, C1, C2, C3, C4, C5, C6, C7, X_1)));
            X_1 = X0;
            X0 = Xk;
        }
        if (isnan(Xk)||!isfinite(Xk)) {
            cout<<"fail";
        } else {
            cout<<Xk;
        }
    return 0;
}