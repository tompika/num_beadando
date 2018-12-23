#include <iostream>
#include <cmath>

using namespace std;

int main(){
	cout.precision(12);
	int n;
	cin>>n;
	double M[n][n];
	for (int i=0;i<n;i++)
		for (int j=0;j<n;j++) cin>>M[i][j];
	for(int k=0;k<n;k++){
    	double max=0;
        for(int j=k;j<n;j++) if(max<abs(M[j][k])) max=abs(M[j][k]);
	    if(abs(max)<10e-15) cout<<"fail"<<endl;
	    for(int i=k+1;i<n;i++){
	        M[i][k]=M[i][k]/M[k][k];
	        for(int j=k+1;j<n;j++) M[i][j]=M[i][j]-(M[i][k]*M[k][j]);
	    }
	}
	for (int i=0;i<n;i++){
		for (int j=0;j<n;j++)
			cout<<M[i][j]<<" ";
		cout<<endl;
	}
    return 0;
}