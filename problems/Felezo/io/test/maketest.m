1
function [C,a,b,epsi]=gen()
  C=randi(10,1,8)/(1+randi(5))-1;
  a=randi(5);
  b=a+1+2*rand();
  epsi=10^(-5-randi(4));
end

it=1;
while it<30  
  [C,a,b,epsi]=gen();
  F=@(x) C(1)*exp(C(2)*x)+C(3)*sin(C(4)*x)+C(5)*cos(C(6)*x)+C(7)*sin(exp(C(8)*x));  
  
  Fa=F(a);
  Fb=F(b);
  
  fO=fopen(sprintf("out%d",it),"w");
  fI=fopen(sprintf("in%d",it),"w");

  fprintf(fI,"%.12f ",C);
  fprintf(fI,"\n");
  fprintf(fI,"%.12f %.12f %.12f\n",a,b,epsi);

  if Fa*Fb>0
    if randi(10)<3
      fprintf(fO,"fail\n");
      it=it+1;
    end
  else
    while b-a>epsi
      m=0.5*(a+b);
      Fm=F(m);
      if Fa*Fm<=0
        b=m;
        Fb=Fm;
      else
        a=m;
        Fa=Fm;
      end
    end
    fprintf(fO,"%.12f %.12f\n",a,b);
    it=it+1;
  end

  fclose(fI);
  fclose(fO);
end % for it
