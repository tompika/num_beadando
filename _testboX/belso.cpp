#include <iostream>
#include "cmath"

using namespace std;

int main()
{
    int n;
    cin>>n;
    double V1[n], V2[n], belso;
    for(int i=0;i<n;i++)
    	cin>>V1[i];
    for(int i=0;i<n;i++)
    	cin>>V2[i];
    for (int i = 0; i < n; i++) {
		belso += V1[i] * V2[i];
	}
    cout<<fixed<<belso<<endl;
    return 0;
}