% random matrix and vector and its product
function maketest(n,name)
  A=(randi(100,n,n)-50)/120;
  f=fopen(sprintf("in%s",name),"w");
  fprintf(f,"%d\n",n);
  for i=1:n
    fprintf(f,"%.12f ",A(i,:));
    fprintf(f,"\n");
  end
  fclose(f);
  
  sol=norm(A,inf);
  f=fopen(sprintf("out%s",name),"w");
  fprintf(f,"%.12f\n",sol);
  fclose(f);
end
