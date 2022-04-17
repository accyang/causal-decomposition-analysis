%% Chang's Letter
rng('default');
steps = 10000;
t = (1:1:steps)';
V = wgn(steps,1,0);
[rt1 nt1] = moran_model(3.4,0.5,0.4,3,1,0.5,V);
[rt2 nt2] = moran_model(2.9,0.6,0.35,3,1,0.5,V);
[rnoise,r_s] = check_separability(nt1(end-199:end),nt2(end-199:end));
[rnoise,r_o] = check_ortho(nt1(end-199:end),nt2(end-199:end));
cm = causal_decomposition(nt1(end-199:end),nt2(end-199:end),0.35,1000);

%% Reply to Chang's Letter
[rt1 nt1] = moran_model(3.4,0.5,0.4,3,1,0.5,V);
[rt2 nt2] = moran_model(3.4,0.6,0.4,3,1,0.5,V);
[rnoise,r_s] = check_separability(nt1(end-199:end),nt2(end-199:end));
[rnoise,r_o] = check_ortho(nt1(end-199:end),nt2(end-199:end));
cm = causal_decomposition(nt1(end-199:end),nt2(end-199:end),0.05,1000);
[rt1 nt1] = moran_model(3.4,0.6,0.4,3,1,0.5,V);
[rt2 nt2] = moran_model(3.4,0.5,0.4,3,1,0.5,V);
[rnoise,r_s] = check_separability(nt1(end-199:end),nt2(end-199:end));
[rnoise,r_o] = check_ortho(nt1(end-199:end),nt2(end-199:end));
cm = causal_decomposition(nt1(end-199:end),nt2(end-199:end),0.05,1000);
[rt1 nt1] = moran_model(3.4,0.5,0.4,3,1,0.5,V);
[rt2 nt2] = moran_model(3.4,0.5,0.4,3,1,0.5,V);
[rnoise,r_s] = check_separability(nt1(end-199:end),nt2(end-199:end));
[rnoise,r_o] = check_ortho(nt1(end-199:end),nt2(end-199:end));
cm = causal_decomposition(nt1(end-199:end),nt2(end-199:end),0.05,1000);