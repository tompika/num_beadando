#include <iostream>
#include "cmath"

using namespace std;

int main()
{
    int n;
    cin>>n;
    double M[n][n], max=0, sum=0;
    for(int i=0;i<n;i++)
        for(int j=0;j<n;j++)
            cin>>M[i][j];

    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            sum += fabs(M[i][j]);
        }
        if (max < sum) {
            max = sum;
        }
        sum = 0;
    }

    cout<<fixed<<max<<endl;
    return 0;
}