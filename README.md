# A Study of Dynamics of Indels using ProPIP, MAFFT and PRANK
This repository provides all the documents related to my master thesis

**Objective adn Study Plan**
1. Can PIP adapt to long indels or not ? <br/>
2. Comparative study using ProPIP, PRANK and MAFFT <br/>
3. Dataset: Using long indel (INDELible, Real data) and single indel data (PIP) <br/>
4. Study using supplementary features of ProPIP.<br/>
 
**ProPIP**

1. Built under an explicit indel process, PIP (Poisson Indel Process) <br/>
2. Basic PIP equations:<br/>
    Asymptotic expected sequence length, E = λ/μ Indel Intensity, I = λ . μ <br/>
    Progressive dynamic programming approach.<br/>
    Marginal likelihood calculation at each internal node of the guide tree Alignment selection using Maximum Likelihood <br/>
    ProPIP requirements: input sequences, trees, rate matrix Q, λ and μ <br/>

**SBDP and STFT**
**Stochastic Backtracking DP algorithm (SBDP)** <br/>
i. Ensemble of sub-optimal solutions at each internal node <br/>
ii. Randomise the sub-optimal MSAs selected using SB algorithm  <br/>
iii.The distortion parameter, T <br/>

**Short-Time Fourier Transform (STFT)** <br/>
i. Detection of homologous regions using STFT  <br/>
ii. For reducing computational complexity  <br/>
iii.Window functions and its size <br/>

**Datasets**
**MSA Evaluation**
**Results and Discussions**
**Conclusions and Future Works**

Visualisation Tools: SuiteMSA <br/>

**SuiteMSA**
SuiteMSA: Visual tools for multiple sequence alignment comparison and molecular sequence simulation



