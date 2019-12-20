1

function [n,x0,m,pol,xm]=gen()
  n=2+randi(20);
  pol=randi(30,1,n+1)-15;
  dpol=pol(1:n);
  dpol=dpol.*(n:-1:1);
  m=randi(10)+2;
  x0=(randi(10)+1)/(randi(20)+1);
  xm=x0;
  for it=1:m
    xm=xm-polyval(pol,xm)/polyval(dpol,xm);
  end
 
%  a=(randi(100,1,n)-50)/120;
%  b=(randi(100,1,n)-50)/120;
%  f=fopen(sprintf("in%s",name),"w");
%  fprintf(f,"%d\n",n);
%  fprintf(f,"%.12f ",b);
%  fprintf(f,"\n");
%  fprintf(f,"%.12f ",a);
%  fprintf(f,"\n");
%  fclose(f);
%
%  sol=sum(a.*b);
%  f=fopen(sprintf("out%s",name),"w");
%  fprintf(f,"%.12f\n",sol);
%  fclose(f);
end

for it=8:20
  fI=fopen(sprintf("in%d",it),"w");

  [n,x0,m,pol,xm]=gen();
  fprintf(fI,"%d %.12f %d\n",n,x0,m);
  fprintf(fI,"%.12f ",pol);
  fclose(fI);
  
  fO=fopen(sprintf("out%d",it),"w");
  fprintf(fO,"%.12f\n",xm);
  fclose(fO);
  
end
