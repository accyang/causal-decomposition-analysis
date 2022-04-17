function [rnoise,r] = check_separability(s1,s2)
 
% normalization
s1=s1-mean(s1);
s1=s1/std(s1);
s2=s2-mean(s2);
s2=s2/std(s2);

% check separability by different noise level
rnoise=(0.05:0.05:1)';
n=length(rnoise);
r1=zeros(n,1);
r2=zeros(n,1);
r=zeros(n,1);
for i=1:n
    imfs1=eemd(s1,rnoise(i),1000,0)';
    imfs2=eemd(s2,rnoise(i),1000,0)';   
    imfsize=size(imfs1);
    imfsize=imfsize(2)-1;
    pc1=zeros(imfsize);
    pc2=zeros(imfsize);

    pc1=abs(corr(imfs1));
    pc2=abs(corr(imfs2));

    %for j=1:imfsize
    %    pc1(:,j)=phasefcimf_s2m(imfs1(:,j),imfs1);
    %    pc2(:,j)=phasefcimf_s2m(imfs2(:,j),imfs2);
    %end

    pc1u=triu(pc1,1);
    pc1u=pc1u(:);
    pc1u(pc1u==0)=[];
    pc2u=triu(pc2,1);
    pc2u=pc2u(:);
    pc2u(pc2u==0)=[];
    r1(i)=rms(pc1u);
    r2(i)=rms(pc2u);
end
r=r1.*r2;
