function y=poidistr(lambda,n)

y=zeros(1,n);
log_factorial=zeros(1,n);
log_factorial(1)=0;
for i=2:n
    log_factorial(i)=log_factorial(i-1)+i;
end

for i=1:n
   y(i)=exp(n*log(lambda)-log_factorial(i)-lambda);
end