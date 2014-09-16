% generate bit matrix based on groupname_Bsize.mat
clear all;
load 'AM_Bsize'; % get number of bits sizes
load 'AM_r';
[M,N]=size(r)
figure(1)
Nsample=floor(N/Nbit)
if Nbit<41
    plot(r);
    axis([1,N,-1.1,1.1]);
    xlabel('Received AM Signal');
else
    Ntemp=Nsample*40;
    plot(r(1:Ntemp));
    axis([1,Ntemp,-1.1,1.1]);
    xlabel('Sample section of Received AM Signal with Noise');
end;
print -djpeg Demod_figure1
% INSERT DEMODULATION CODE:
% INSERT DEMODULATION CODE:
% INSERT DEMODULATION CODE: input cutoff fc and r
% rectify signal with single diode (half wave rectification)
r1=????;
% form reconstruction filter
kc=N/8; % This should correspond to the channel parameter kc
fc=???;
% filter with some recommended parameters
Norder=8;fmax=N/2;K=1; % filter gain
[f H]=lp_butterworth_oN_dft(3*fc,K,fmax,N,Norder);
% filter signal through channel via frequency domain
rn=???;
% END OF DEMODULATION INSERT: output real vector rn that is N long
% END OF DEMODULATION INSERT:
% END OF DEMODULATION INSERT:
figure(2)
if Nbit<41
    plot(rn);
    axis([1,N,-1.1,1.1]);
    xlabel('Demodulated AM Signal');
else
    Ntemp=Nsample*40;
    plot(rn(1:Ntemp));
    axis([1,Ntemp,-1.1,1.1]);
    xlabel('Sample section of Demodulated AM Signal with Noise');
end;
print -djpeg Demod_figure2
% normalize the output to be tested
% Bs must be scaled from about 0 to 1 so it can be thresholded at 0.5 by
% Bcheck
Bs=rn;
Bs=Bs/max(Bs);
save 'AM_Bs' Bs;
