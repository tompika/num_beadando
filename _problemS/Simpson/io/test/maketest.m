% random matrix and vector and its product
function maketest(C,a,b,n,name)
  f=fopen(sprintf("in%s",name),"w");
  fprintf(f,"%.12f ",C);
  fprintf(f,"\n");
  fprintf(f,"%.12f %.12f %d\n",a,b,n);
  fclose(f);

  
  f=@(x) C(1)*exp(C(2)*x)+C(3)*sin(C(4)*x)+C(5)*cos(C(6)*x)+C(7)*sin(exp(C(8)*x));  
  h=(b-a)/n;
  x=a:h:b;
  xx=(a+0.5*h):h:b;
  s=h/6.0*(2*sum(f(x))+4.0*sum(f(xx))-f(a)-f(b));
  
  f=fopen(sprintf("out%s",name),"w");
  fprintf(f,"%.12f\n",s);
  fclose(f);
end
