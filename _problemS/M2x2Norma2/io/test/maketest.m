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

function [A,nA]=gen()
  A=randi(20,2,2);
  A=A-10;
  nA=norm(A,2);
end

it=1;
while it<30
   [A,nA]=gen();

   fI=fopen(sprintf("../in%d",it),"w");
   fO=fopen(sprintf("../out%d",it),"w");

   ir(A,fI);
   fprintf(fO,"%.12f\n", nA);

   fclose(fI);
   fclose(fO);
   it=it+1;

end % for it
