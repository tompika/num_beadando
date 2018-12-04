import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.StringTokenizer;
class Fakt {
  //...................... Global Variables .......................//
 
 
  //===================  PROBLEM SOLVING COMES HERE ===== START  ====================//
 
    void solve() throws IOException, Exception {
 
      int n=in.nextInt();
      while(n > 0){
        out.println(fact(in.nextInt()));
        --n;
      }// end of while
 
    }
 
    //===================  PROBLEM SOLVING COMES HERE ===== END ======================//
 
 
 
    public static void main(String[] args) throws FileNotFoundException, IOException, Exception {
 
         in = new FastScanner(new BufferedReader(new InputStreamReader(System.in)));
         out = new PrintWriter(System.out);
        new Fakt().solve();
        out.close();
    }
 
      double fact(long n){
      if(n==0||n==1)return 1;
      else return(n*fact(n-1));
    }
 
    static FastScanner in;
    static PrintWriter out;
 
    static class FastScanner {
        BufferedReader in;
        StringTokenizer st;
 
        public FastScanner(BufferedReader in) {
            this.in = in;
        }
 
        public String nextToken() {
            while (st == null || !st.hasMoreTokens()) {
                try {
                    st = new StringTokenizer(in.readLine());
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            return st.nextToken();
        }
 
        public int nextInt() { return Integer.parseInt(nextToken()); }
        public long nextLong() { return Long.parseLong(nextToken()); }
        public double nextDouble() { return Double.parseDouble(nextToken()); }
        public String next() throws IOException { return nextToken(); }
        public String nextLine() throws IOException { return in.readLine(); }
 
        public int[] readIntArray(int n) {
            int[] ret = new int[n];
            for (int i = 0; i < n; i++) {
                ret[i] = nextInt();
            }
            return ret;
        }
 
        public void printIntArray(int ar[],int n) {
            for (int i = 0; i < n; i++) {
                System.out.print(ar[i] +" ");
            }System.out.println();
        }
 
    }
}
