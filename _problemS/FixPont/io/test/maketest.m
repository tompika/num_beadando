1
function [C,x0,s,m,xk]=gen()
  C=randi(10,1,8)/8-1;
  C=1e-12*floor(1e12*C);
  x0=randi(5)/(1+randi(4));
  x0=1e-12*floor(1e12*x0);
  s=20+randi(5);
  m=floor(s/5);
  
  F=@(x) C(1)*exp(C(2)*x)+C(3)*sin(C(4)*x)+C(5)*cos(C(6)*x)+C(7)*sin(exp(C(8)*x));  
  y0=x0;% need x0 to return
  
  y1=F(y0);
  d0=abs(y0-y1);
  y0=y1;

  jo=0;
  it=2;
  while it<=s && jo<m
    y1=F(y0);
    d1=abs(y1-y0);
    if d1<d0
      jo=jo+1;
    else
      jo=0;
    end
    d0=d1;
    y0=y1;
    it=it+1;
  end
  xk=y1;
  if jo<m
    xk=1/0;
  end
end

it=1;
while it<30  
  [C,x0,s,m,xk]=gen();
  
  
  fI=fopen(sprintf("../in%d",it),"w");
  fprintf(fI,"%.12f ",C);
  fprintf(fI,"\n");
  fprintf(fI,"%.12f %d %d\n",x0,s,m);
  

  fO=fopen(sprintf("../out%d",it),"w");
  if isnan(xk) || isinf(xk)
    if randi(3)<2
      fprintf(fO,"fail\n");
      it=it+1;
    end
  else
    fprintf(fO,"%.12f\n",xk);
    it=it+1;
  end

  fclose(fI);
  fclose(fO);

end % for it
