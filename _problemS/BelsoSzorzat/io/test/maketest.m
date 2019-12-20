function maketest(n,name)
  a=(randi(100,1,n)-50)/120;
  b=(randi(100,1,n)-50)/120;
  f=fopen(sprintf("in%s",name),"w");
  fprintf(f,"%d\n",n);
  fprintf(f,"%.12f ",b);
  fprintf(f,"\n");
  fprintf(f,"%.12f ",a);
  fprintf(f,"\n");
  fclose(f);

  sol=sum(a.*b);
  f=fopen(sprintf("out%s",name),"w");
  fprintf(f,"%.12f\n",sol);
  fclose(f);
end