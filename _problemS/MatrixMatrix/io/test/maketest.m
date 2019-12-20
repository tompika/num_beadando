% random matrix and vector and its product
function maketest(k,m,n,name)
  A=(randi(100,k,m)-50)/120;
  B=(randi(100,m,n)-50)/120;
  f=fopen(sprintf("in%s",name),"w");
  fprintf(f,"%d %d %d\n",k,m,n);
  for i=1:k
    fprintf(f,"%.12f ",A(i,:));
    fprintf(f,"\n");
  end
  for i=1:m
    fprintf(f,"%.12f ",B(i,:));
    fprintf(f,"\n");
  end
  fclose(f);
  
  C=A*B;
  f=fopen(sprintf("out%s",name),"w");
  for i=1:k
    fprintf(f,"%.12f ",C(i,:));
    fprintf(f,"\n");
  end
  fclose(f);
end
