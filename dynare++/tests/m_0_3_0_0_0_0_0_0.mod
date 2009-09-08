var lambda a1 a2 k1 k2 i1 i2 c1 c2 l1 l2;
varexo e  e1 e2;
parameters beta delta rho sigma phi AA alpha  gamma mu chi b Le tau;
beta = 0.99;
delta = 0.025;
rho = 0.95;
sigma = 0.001;
phi = 0.5;
alpha = 0.36;
AA = 0.028058361;
tau = 6.36522e-11;
gamma = 0.25;
mu = -0.2;
chi = 0.83;
b = 2.16872693993;
Le = 2.5;

model;
log(a1) = rho*log(a1(-1))+sigma*(e+e1);
log(a2) = rho*log(a2(-1))+sigma*(e+e2);
lambda = tau*c1^(-1/chi)*(c1^(1-1/chi)+b*(Le-l1)^(1-1/chi))^((1-1/gamma)/(1-1/chi)-1);
lambda = tau*c2^(-1/chi)*(c2^(1-1/chi)+b*(Le-l2)^(1-1/chi))^((1-1/gamma)/(1-1/chi)-1);
tau*(-b)*(Le-l1)^(-1/chi)*(c1^(1-1/chi)+b*(Le-l1)^(1-1/chi))^((1-1/gamma)/(1-1/chi)-1) = -lambda*a1*AA*(1-alpha)*l1^(mu-1)*(alpha*k1(-1)^mu+(1-alpha)*l1^mu)^(1/mu-1);
tau*(-b)*(Le-l2)^(-1/chi)*(c2^(1-1/chi)+b*(Le-l2)^(1-1/chi))^((1-1/gamma)/(1-1/chi)-1) = -lambda*a2*AA*(1-alpha)*l2^(mu-1)*(alpha*k2(-1)^mu+(1-alpha)*l2^mu)^(1/mu-1);
lambda*(1+phi*(i1/k1(-1)-delta)) =beta*lambda(+1)*(1+a1(+1)*AA*alpha*k1^(mu-1)*(alpha*k1^mu+(1-alpha)*l1(+1)^mu)^(1/mu-1)+phi*(1-delta+i1(+1)/k1-0.5*(i1(+1)/k1-delta))*(i1(+1)/k1-delta));
lambda*(1+phi*(i2/k2(-1)-delta)) =beta*lambda(+1)*(1+a2(+1)*AA*alpha*k2^(mu-1)*(alpha*k2^mu+(1-alpha)*l2(+1)^mu)^(1/mu-1)+phi*(1-delta+i2(+1)/k2-0.5*(i2(+1)/k2-delta))*(i2(+1)/k2-delta));
k1 = i1 + (1-delta)*k1(-1);
k2 = i2 + (1-delta)*k2(-1);
c1+i1-delta*k1(-1) + c2+i2-delta*k2(-1) = a1*AA*(alpha*k1(-1)^mu+(1-alpha)*l1^mu)^(1/mu)-(phi/2)*k1(-1)*(i1/k1(-1)-delta)^2 + a2*AA*(alpha*k2(-1)^mu+(1-alpha)*l2^mu)^(1/mu)-(phi/2)*k2(-1)*(i2/k2(-1)-delta)^2;
end;
initval;
a1 = 1;
a2 = 1;
k1 = 1;
k2 = 1;
c1 = 0.028058361;
c2 = 0.028058361;
i1 =      0.025;
i2 =      0.025;
l1 = 1;
l2 = 1;
lambda = 1;
end;

vcov = [1 0 0; 0 1 0; 0 0 1];

order = 4;