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

function [t,f,x]=gen()
   n=3+randi(10);
   t=randi(2*n,1,n)-n;
   t=unique(t);
   n=length(t);
   f=randi(2*n,1,n)-n;
   m=randi(n)+n;
   x=randi(2*m,1,m)-m;
end

it=1;
while it<30
   [t,f,x]=gen();
   n=length(t);
   m=length(x);
   fI=fopen(sprintf("../in%d",it),"w");
   fO=fopen(sprintf("../out%d",it),"w");

   fprintf(fI,"%d\n", n);
   fprintf(fI,"%d ",t);
   fprintf(fI,"\n");
   fprintf(fI,"%d ",f);
   fprintf(fI,"\n");
   fprintf(fI,"%d\n", m);
   fprintf(fI,"%d ",x);
   fprintf(fI,"\n");

   p=polyfit(t,f,n-1);
   px=polyval(p,x);
   fprintf(fO,"%.12f ",px);
   fprintf(fO,"\n");
   
   fclose(fI);
   fclose(fO);
   it=it+1;

end % for it
