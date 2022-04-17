function [rt nt] = moran_model(r1,f1,s1,d1,r0,n0,V)

steps = length(V);
rt = zeros(steps,1);
rt(1) = r0;
nt = zeros(steps,1);
nt(1) = n0;

for i = 2:steps
    rt(i) = r1 * nt(i-1) * (1 - nt(i-1)) * exp(-f1 * V(i-1));
    if (i-d1-1)>0
        nt(i) = s1 * nt(i-1) + max(rt(i-d1-1),0);
    else
        nt(i) = s1 * nt(i-1);
    end
end