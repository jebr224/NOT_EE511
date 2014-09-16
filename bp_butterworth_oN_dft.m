function [f,H]=bp_butterworth_oN_dft(fo,fc,K,fmax,N,Norder)
%determine odd or even length
temp=floor(N/2); temp=temp*2; % test for odd or even
evenodd=0; % guess odd
if temp==N,
   evenodd=1; % even
end;
% determine the frequency vector
if evenodd==1
   n0=-((N/2)-1);
else
   n0=-((N-1)/2);
end;
n1=n0+N-1;
na=n0:1:-1; % index vector
nb=0:1:n1;
n=[nb,na];
df=fmax/n1; % frequency increment
f=n*df; % frequency vector
w=2*pi*f;
wc=2*pi*fc;
Hlp=(K^0.5)*(1 + (w/wc).^(2*Norder)).^(-0.5)+i*0;
p=cos(2*pi*fo*f/N);