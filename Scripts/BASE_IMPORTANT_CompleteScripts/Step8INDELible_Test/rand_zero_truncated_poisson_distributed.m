function k=rand_zero_truncated_poisson_distributed(lambda,u)

k=1;
t=exp(-lambda)/(1-exp(-lambda))*lambda;
s=t;
while s < u
    k=k + 1;
    t=t * lambda / k;
    s=s + t;
end
