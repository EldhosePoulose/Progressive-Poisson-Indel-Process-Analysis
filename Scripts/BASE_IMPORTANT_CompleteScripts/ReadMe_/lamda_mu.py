import math

lamda_ = []
mu_ = []

I_start = 0.5
E_start = 100
for e in range(100,2100,100):
    I = I_start * (e/E_start)
    lamda = e * math.sqrt(I/e)
    mu = math.sqrt(I/e)
    lamda_.append(lamda)
    mu_.append(mu)
print("insertion rate:",lamda_)
print("deletion rate:",mu_)
