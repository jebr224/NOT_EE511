% generate groupname_Bsize.mat
clear all;
% INSERT GROUP NAME AND NUMBER OF BITS
groupname='AM' % name of group
Nbit=???? % number of bits to transmitt
% END OF INSERT
% name of output file that stores Nbit and filename
filename=sprintf('%s_Bsize.mat',groupname)
save(filename); % stores groupname, Nbit to ee51112_Bsize.mat


