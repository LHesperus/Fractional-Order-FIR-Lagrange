%lagrange 
%h[n]=Á¬³Ë(D-k)/(n-k),k=0->N,k!=n,n=0->N
%D:ÑÓ³Ù£¬N+1£ºÂË²¨Æ÷³¤¶È

function [h]=LagrangeH(N,D)
h=zeros(1,N+1);
for n=0:N
temp0=0;
temp1=1;
  for k=0:N
    if(k==n)
	continue;
    end
  temp0=temp1;
  temp1=(D-k)/(n-k);
  temp1=temp0*temp1;
  end
h(n+1)=temp1;
end