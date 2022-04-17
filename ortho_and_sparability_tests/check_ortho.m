function [rnoise,r] = check_ortho(s1,s2)

% normalization
s1=s1-mean(s1);
s1=s1/std(s1);
s2=s2-mean(s2);
s2=s2/std(s2);

% check orthognal by different noise level
rnoise=(0.05:0.05:1)';
n=length(rnoise);
r1=zeros(n,1);
r2=zeros(n,1);
r=zeros(n,1);
for i=1:n
    imfs1=eemd(s1,rnoise(i),1000,0)';
    imfs2=eemd(s2,rnoise(i),1000,0)';
    r1(i)=ratio1(imfs1);
    r2(i)=ratio1(imfs2);
end
r=r1.*r2;

