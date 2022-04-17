function imf_rms = check_IMF_separability(s,rnoise,nensemble)
 
% normalization
s = s - mean(s);
s = s / std(s);

% check separability 
imfs = eemd(s,rnoise,nensemble,0)';
pc = abs(corr(imfs(:,1:end-1)));

pcu = triu(pc,1);
pcu = pcu(:);
pcu(pcu==0) = [];
imf_rms = rms(pcu);

end
   