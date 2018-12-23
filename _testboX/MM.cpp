#include <iostream>
#include <cmath>

using namespace std;

int main()
{
	cout.precision(12);
	int k, m, n;
	cin>>k>>m>>n;
	double A[k][m], B[m][n], C[k][n]={0}, sum=0;
	for (int i = 0; i < k; i++)
		for (int j = 0; j < m; j++) 
			cin>>A[i][j];
	for (int i = 0; i < m; i++)
		for (int j = 0; j < n; j++)
			cin>>B[i][j];

	for (int i = 0; i < k; i++)
		for (int j = 0; j < n; j++){
			for (int k = 0; k < m; k++)
				sum += A[i][k] * B[k][j];
			C[i][j] = sum;
			sum = 0;
		}
	for(int i=0;i<k;i++){
		for(int j=0;j<n;j++)
			cout<<fixed<<C[i][j]<<" ";
		cout<<endl;
	}
	return 0;
}	