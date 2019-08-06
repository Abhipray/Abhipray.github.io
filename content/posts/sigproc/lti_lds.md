# Linear Time-Invariant Systems and Linear Dynamical Systems (LTI vs LDS)

It is often easier to understand a concept if it can be connected to some other familiar concept. Like many of you readers, I was introduced to Linear Time-Invariant systems/filters in the framework of analyzing electrical signals and circuits. I recently took a class on linear dynamical systems which generalize the notion of LTI systems. In this post, I want to make the connection between LTI systems and Linear Dynamical Systems (LDS). I will focus on only discrete-time systems.

## LTI System background


### Difference equation
Given a sequence of numbers i.e a signal $u[n]$ indexed by $n$, we can define a system as an operation that produces an output $y[n]$ for every index $n$.  If the relation between $y[n]$ and $u[n]$ is linear (eg. weighted sum of $u[n]$ for different values of $n$) and that relation does not change with time, then we have an LTI system. For example, $y[n] = b_0u[n] +b_1x[n-1]$ is an LTI system that at each time step $n$ produces as output a weighted sum of the current value of the signal and the previous value of the signal $x[n-1]$. $b_0$ and $b_1$ are held constant making the system time-invariant. 

Such a description of an LTI system is called a difference equation. The general form is $y[n] = b_0u[n]+b_1x[n-1]+...+b_x[n-k] + a_1y[n-1] +a_2y[n-2] +...+a_p[n-p]$. In this description, the output $y[n]$ is restricted to be causal: it only depends on past inputs and past outputs. We will limit our discussion to causal systems which are all physical systems. 


# Impulse response
An impulse is a signal $\delta[n]$ that is $1$ at $n=0$ and $0$ elsewhere. For systems whose output only depends on the inputs $u[n]$ and not on past outputs, the coefficients or weighting factors $b_i$ are the response to an impulse. To see this, simply plug-in the impulse signal into the difference equation. Therefore, $h[n] = b_n$  is called the impulse response. Why is this useful? We can describe the LTI system using the convolution operation $\circledast$. 

$y[n] = h[n] \circledast u[n] = \sum_{k=-\infty}^{+\infty}x[k]h[n-k]$

This equation can be read as: flip the impulse response 




  