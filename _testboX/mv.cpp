#include <iostream>
#include <cmath>

using namespace std;

int main()
{
	cout.precision(12);
	int m, n;
	cin>>m>>n;
    float A[n][m];
	double a[n], y[m]={0};
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < m; j++) {
			cin>>A[i][j];
		}
	}

    for (int i = 0; i < m; i++) {
        cin>>a[i];
    }

	for (int i = 0; i < n; i++) {
		for (int j = 0; j < m; j++) {
			y[i] += A[i][j] * a[j];
		}
	}
    	
    for(int i=0;i<m;i++)
    {
    	cout<<fixed<<y[i]<<endl;
    }
	return 0;
}