% Generate orthogonalized keys for DSSS 
% Key amplitude < 1 
function [Keys] = GenDsssKeys(Nkeys,Nsample,Ntiles)
%
N=Nsample*Ntiles;
w=2*rand(1,N);
N2=N/Nsample;
R=ones(N2,N2);
Rmask=ones(N2,N2); % indicate non-usable pairs
for m=1:N2;
    for n=m:N2;
        km0=1+(m-1)*Nsample;
        km1=m*Nsample;
        kn0=1+(n-1)*Nsample;
        kn1=n*Nsample;
        A=w(km0:km1);
        A=A-(sum(A)/Nsample);
        A=A/sqrt(A*A');
        B=w(kn0:kn1);
        B=B-(sum(B)/Nsample);
        B=B/sqrt(B*B');
        R(m,n)=abs(A*B');
        Rmask(m,n)=0;
    end; % end of n
end; % end of m
Keys=zeros(Nkeys,Nsample);
% find keys with minimal correlation
if Nkeys>2
    % this is not optimized yet
    % just grab keys with first key as first tile
    % other keys chosen to have minimum correlation with 1st one
    Row=1;Col=1;
    km0=1+(Row-1)*Nsample;km1=Row*Nsample;
    A=w(km0:km1);
    A=A-(sum(A)/Nsample);
    A=sqrt(Nsample)*A/sqrt(A*A');
    Keys(1,1:Nsample)=A;
    for nkey=2:Nkeys;
        Col=nkey;
        kn0=1+(Col-1)*Nsample;kn1=Col*Nsample;
        B=w(kn0:kn1);
        B=B-(sum(B)/Nsample);
        B=sqrt(Nsample)*B/sqrt(B*B');
        Keys(nkey,1:Nsample)=B; 
    end; % for nkeys
else
    % first and second keys with minimum correlation
    J=find(R==min(min(R)));
    % J = m * N2 + n
    Col=floor((J(1)-1)/N2);
    Row=floor((((J(1)-1)/N2)-Col)*N2);
    Row=Row+1; % convert to Matlab index
    Col=Col+1; % convert to Matlab index
    km0=1+(Row-1)*Nsample;km1=Row*Nsample;
    A=w(km0:km1);
    A=A-(sum(A)/Nsample);
%    A=sqrt(Nsample)*A/sqrt(A*A');
    Keys(1,1:Nsample)=A;
    kn0=1+(Col-1)*Nsample;kn1=Col*Nsample;
    B=w(kn0:kn1);
    B=B-(sum(B)/Nsample);
%    B=sqrt(Nsample)*B/sqrt(B*B');
    Keys(2,1:Nsample)=B; 
end; % end of Nkeys
end

