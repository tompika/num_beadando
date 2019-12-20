% random matrix and vector and its product
function maketest(m,n,name)
  A=(randi(100,m,n)-50)/120;
  x=(randi(100,n,1)-50)/120;
  f=fopen(sprintf("in%s",name),"w");
  fprintf(f,"%d %d\n",m,n);
  for i=1:m
    fprintf(f,"%.12f ",A(i,:));
    fprintf(f,"\n");
  end
  fprintf(f,"%.12f\n",x);
  fprintf(f,"\n");
  fclose(f);

  sol=A*x;
  f=fopen(sprintf("out%s",name),"w");
  fprintf(f,"%.12f\n",sol);
  fclose(f);
end
