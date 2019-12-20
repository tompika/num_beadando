% random poly and points and poly values at points
function maketest(fok,pontok,name)
  pol=(randi(50,1,fok+1)-25);
  pol(1)=1.0;
  f=fopen(sprintf("in%s",name),"w");
  fprintf(f,"%d\n",fok);
  fprintf(f,"%.12f ",pol);
  fprintf(f,"\n");
  fprintf(f,"%d\n",pontok);
  x=rand(1,pontok);
  fprintf(f,"%.12f\n",x);
  fclose(f);
  
  px=polyval(pol,x);
  f=fopen(sprintf("out%s",name),"w");
  fprintf(f,"%.12f\n",px);
  fclose(f);
end
