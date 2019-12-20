% random matrix and vector and its product
function maketest(C,a,b,n,name)
  f=fopen(sprintf("in%s",name),"w");
  fprintf(f,"%.12f ",C);
  fprintf(f,"\n");
  fprintf(f,"%.12f %.12f %d\n",a,b,n);
  fclose(f);

  x=linspace(a,b,n+1);
  f=@(x) C(1)*exp(C(2)*x)+C(3)*sin(C(4)*x)+C(5)*cos(C(6)*x)+C(7)*sin(exp(C(8)*x));  
  t=trapz(x,f(x));
  
  f=fopen(sprintf("out%s",name),"w");
  fprintf(f,"%.12f\n",t);
  fclose(f);
end
