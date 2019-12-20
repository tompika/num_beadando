% random matrix and LU
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

function [A,cInf,c1]=gen()
   n=3+randi(30);

   while 1>0
      A=(randi(10,n,n)-5)/20;
      A=adjust(A);
      dA=abs(det(A));
      if dA>1e-10 && dA<1e10
         break;
      end
   end
   cInf=cond(A,inf);
   c1=cond(A,1);
end

it=1;
while it<30
   [A,cInf,c1]=gen();

   fI=fopen(sprintf("../in%d",it),"w");
   fO=fopen(sprintf("../out%d",it),"w");

   fprintf(fI,"%d\n", size(A)(1));
   ir(A,fI);

   fprintf(fO,"%.12f %.12f\n", cInf, c1);

   fclose(fI);
   fclose(fO);
   it=it+1;

end % for it
