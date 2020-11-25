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

**Datasets**<br/>

**MSA Evaluation**<br/>

**Results and Discussions**<br/>

**Conclusions and Future Works**<br/>


**THE CONCLUSION**<br/>

1. MAFFT and PRANK outperformed ProPIP in INDELible and real data (long indel data). <br/>
2. ProPIP best fits the PIP data and performs better than other traditional aligners, MAFFT and PRANK. <br/>
3. The ProPIP performance under long indel data can be improved using its additional features <br/>
4. Parameter α is not suitable for INDELible data however combined with k can improve the alignment quality. When k= 0.05 and α= 0.05 we witnessed improvement. For relatively lower α the nIndels increased. <br/>
5. For relatively lower k — nIndels decreased Q score Increased for all data types same pattern. <br/>
6. But for PIP, same pattern as above but fit obtained at k= 2 <br/>
7. SBDP- for relatively lower T the value of nIndels Increased — max indel length decreased <br/>
8. STFT <br/>

**THE FUTURE** <br/>
1. We observed the possibility of tuning PIP model in order to adapt long indel data <br/>
2. K depends on the prior knowledge on MSA length <br/>
3. K smaller or larger <br/>
4. K independent or together with α. The improved performance of k and Gamma still depends on k ? <br/>
5. SBDP and STFT need more tests to verify their poor performances. <br/>

Visualisation Tools: SuiteMSA <br/>

**SuiteMSA** <br/>
SuiteMSA: Visual tools for multiple sequence alignment comparison and molecular sequence simulation



