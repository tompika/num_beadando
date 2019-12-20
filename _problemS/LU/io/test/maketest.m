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

function [A,LU,state]=gen()
   n=3+randi(30);
   A=(randi(10,n,n)-5)/20;
   A=adjust(A);

   LU=A;
   state=-1;
   for it=1:(n-1)
      if abs(LU(it,it))<1e-15
         if max(abs(LU((it+1):n,it)))>1e-15
            return
         end
         continue;
      end
      for jt=(it+1):n
         ef=LU(jt,it)/LU(it,it);
         LU(jt,it)=ef;
         LU(jt,(it+1):end)=LU(jt,(it+1):end)-ef*LU(it,(it+1):end);
      end
   end
   state=1;
end

it=20;
while it<30
   [A,LU,state]=gen();

   fI=fopen(sprintf("../in%d",it),"w");
   fO=fopen(sprintf("../out%d",it),"w");

   fprintf(fI,"%d\n", size(A)(1));
   ir(A,fI);

   if state<0
      fprintf(fO,"fail\n");
      it=it+1;
   else
      ir(LU,fO);
      it=it+1;
   end

   fclose(fI);
   fclose(fO);

end % for it
