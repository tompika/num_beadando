1
function [C,x0,x1,m,xm]=gen()
  C=randi(10,1,8)/8-1;
  C=1e-12*floor(1e12*C);
  x0=randi(5)/(1+randi(4));
  x0=1e-12*floor(1e12*x0);
  x1=x0+randi(10)/(randi(9));
  x1=1e-12*floor(1e12*x1);
  m=5+randi(5);
  
  F=@(x) C(1)*exp(C(2)*x)+C(3)*sin(C(4)*x)+C(5)*cos(C(6)*x)+C(7)*sin(exp(C(8)*x));  

  y0=x0;
  F0=F(y0);
  y1=x1;
  F1=F(y1);

  for it=1:m
    y2=y1-F1*(y1-y0)/(F1-F0);
    y0=y1;
    F0=F1;
    y1=y2;
    F1=F(y1);
  end
  xm=y1;
end

it=1;
while it<30  
  [C,x0,x1,m,xm]=gen();
  
  
  fI=fopen(sprintf("in%d",it),"w");
  fprintf(fI,"%.12f ",C);
  fprintf(fI,"\n");
  fprintf(fI,"%.12f %.12f %d\n",x0,x1,m);
  

  fO=fopen(sprintf("out%d",it),"w");
  if isnan(xm) || isinf(xm)
    if randi(5)<2
      fprintf(fO,"fail\n");
      it=it+1;
    end
  else
    fprintf(fO,"%.12f\n",xm);
    it=it+1;
  end

  fclose(fI);
  fclose(fO);

end % for it
