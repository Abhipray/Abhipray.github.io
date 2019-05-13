+++ 
date = "2019-05-13"
title = "Tactile Vision: Images to Vibrations sensory substitution & Gray code"
markup = "mmark"
+++

# Tactile Vision: Images to Vibrations sensory substitution & Gray code

I took a break from my series on speech enhancement to work on a project for an Information Theory class. The project involved designing algorithms to translate images to vibration patterns felt on the chest. The work is summarized on the blog for the class here: https://theinformaticists.com/2019/03/22/tactile-vision1-0-seeing-the-world-through-vibrations/. There are lots of other really cool projects out there so do check it out! 

As part of the project, I implemented some algorithms to generate [Gray codes](https://en.wikipedia.org/wiki/Gray_code). Gray codes are an ordering a binary code that enforces a hamming distance(number of positions where two strings are different) of one for consecutive bitstrings. 

The algorithm described on Wikipedia results in:

[img](gray_wiki.png)

The requirement for us was to generate a ternary Gray code that did not wrap around for consecutive bitstrings (i.e we wanted the count to alternate). This was satisfied by an algorithm described in a paper titled "Generalized Gray Codes with Applications", by Guan (1998).

Here's Python code for it:

```

def gray_code_guan(N, K):
    n = [0] * (K+1)
    g = [0] * (K+1)
    u = [0] * (K+1)
    
    for i in range(K+1):
        g[i] = 0
        u[i] = 1
        n[i] = N
    out = []
    while g[K] == 0:
        digits = []
        for j in range(K-1, -1, -1):
            digits.append(g[j])
        out.append(digits)
        i = 0
        k = g[0] + u[0]
        while ((k>=n[i]) or (k < 0)):
            u[i] = -u[i]
            i += 1
            k = g[i] + u[i]
        g[i] = k
    return out
 ```