% invertibility based on Gershgorin theorem
1

function ir(A,fd)
   n=size(A)(1);
   for it=1:n
      fprintf(fd,"%.12f ",A(it,:));
      fprintf(fd,"\n");
   end
end


function A=adjust(A)
   A=1e-12*floor(1e12*A);
end

function A=gen()
   n=3%+randi(10);

   A=(randi(10,n,n)-5)/20;
   for it=1:n
     s=4*sum(abs(A(it,:)))*rand();
     if rand()<0.5
       s=-s;
     end
     A(it,it)=s;
   end
   A=adjust(A);
end

function res=solve(A)
   n=size(A)(1);
   k=zeros(1,n);
   r=zeros(1,n);
   for it=1:n
     k(it)=A(it,it) ;
     r(it)=sum(abs(A(it,:)))-abs(k(it));
   end
   res=1;
   if sum(k-r>0 | k+r<0)<n
      res=0;
   end
end


it=30;
while it<31
   A=gen();


   fI=fopen(sprintf("../in%d",it),"w");
   fO=fopen(sprintf("../out%d",it),"w");


   fprintf(fI,"%d\n", size(A)(1));
   ir(A,fI);


   res=solve(A)+solve(A');
   if res>0
     res="yes";
   else
     res="dunno";
   end
    fprintf(fO,"%s\n", res);

   fclose(fI);
   fclose(fO);
   it=it+1;

end % for it
