% random matrix and Chol
1

function ir(A,fd)
   n=size(A)(1);
   for it=1:n
      fprintf(fd,"%.12f ",A(it,:));
      fprintf(fd,"\n");
   end
end

function irAlso(A,fd)
  n=size(A)(1);
  for it=1:n
    fprintf(fd,"%.12f ",A(it,1:it));
    fprintf(fd,"\n");
  end
end


function A=adjust(A)
   A=1e-12*floor(1e12*A);
end

function [A,Q]=gen()
   n=3+randi(10);
   C=randi(15,n,n)-7;
   B=tril(C);
   if rand()<0.1
     i=randi(n);
     B(i,i)=0;
   end
   A=B*B';
   [Q,p]=chol(A,"lower");
   if p>0
     Q=[];
   end
end

it=1;
while it<30
   [A,Q]=gen();

   fI=fopen(sprintf("../in%d",it),"w");
   fO=fopen(sprintf("../out%d",it),"w");

   fprintf(fI,"%d\n", size(A)(1));
   irAlso(A,fI);

  if size(Q)(1)==0
    fprintf(fO,"fail\n");
  else
    irAlso(Q,fO);
  end    

  fclose(fI);
   fclose(fO);
   it=it+1;

end % for it
