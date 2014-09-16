% generate groupname_Bsize.mat
clear all;
% INSERT GROUP NAME AND NUMBER OF BITS
groupname='Sandoval' % name of group
Nbit=128 % number of bits to transmitt %(JB) I pick 128 randomly
% END OF INSERT
% name of output file that stores Nbit and filename
filename=sprintf('%s_Bsize.mat',groupname)
save(filename); % stores groupname, Nbit to ee51112_Bsize.mat


