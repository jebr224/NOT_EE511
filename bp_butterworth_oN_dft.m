function [f,H]=bp_butterworth_oN_dft(fo,fc,K,fmax,N,Norder)% fo = center frequency% fc = cutoff frequency referenced to center frequency
%determine odd or even length%to specify a specific discrete frequency let%fc=kc and fmax= N/2 for N even and (N-1)/2 for N odd%K = dc gain%N = vector length%Norder = order of filter (1,2,3,...)% Example code:% fo=30;fc=10;K=1;N=256;fmax=N/2;Norder=10;% [f H]=bp_butterworth_oN_dft(fo,fc,K,fmax,N,Norder);% plot(f,real(H)); or plot (real(H)) for discrete version
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
wc=2*pi*fc;% low pass component
Hlp=(K^0.5)*(1 + (w/wc).^(2*Norder)).^(-0.5)+i*0;% use cosine to translate lp to bp
p=cos(2*pi*fo*f/N);hlp=ifft(Hlp);hbp=hlp.*p;H=real(fft(hbp));