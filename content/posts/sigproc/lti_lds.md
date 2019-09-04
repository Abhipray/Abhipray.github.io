# Linear Time-Invariant Systems and Linear Dynamical Systems (LTI vs LDS)

It is often easier to understand a concept if it can be connected to some other familiar concept. Like most electrical engineers, I was introduced to Linear Time-Invariant systems/filters in the framework of analyzing electrical signals and circuits. I recently took a class on linear dynamical systems which generalize the notion of LTI systems. In this post, I want to make the connection between LTI systems and Linear Dynamical Systems (LDS). I will focus on only discrete-time systems.

## LTI System background

### Difference equation
Given a sequence of numbers i.e a signal $u[n]$ indexed by $n$, we can define a system as an operation that produces an output $y[n]$ for every index $n$.  If the relation between $y[n]$ and $u[n]$ is linear (eg. weighted sum of $u[n]$ for different values of $n$) and that relation does not change with time, then we have an LTI system. For example, $y[n] = b_0u[n] +b_1x[n-1]$ is an LTI system that at each time step $n$ produces as output a weighted sum of the current value of the signal and the previous value of the signal $x[n-1]$. $b_0$ and $b_1$ are held constant making the system time-invariant. 

Such a description of an LTI system is called a difference equation. The general form is $y[n] = b_0u[n]+b_1x[n-1]+...+b_x[n-k] + a_1y[n-1] +a_2y[n-2] +...+a_p[n-p]$. In this description, the output $y[n]$ is restricted to be causal: it only depends on past inputs and past outputs. We will limit our discussion to causal systems which are all physical systems. 


### Impulse response
An impulse is a signal $\delta[n]$ that is $1$ at $n=0$ and $0$ elsewhere. For systems whose output only depends on the inputs $u[n]$ and not on past outputs, the coefficients or weighting factors $b_i$ are the response to an impulse. To see this, simply plug-in the impulse signal into the difference equation. Therefore, $h[n] = b_n$  is called the impulse response. Why is this useful? We can describe the LTI system using the convolution operation $\circledast$. 

$y[n] = h[n] \circledast u[n] = \sum_{k=-\infty}^{+\infty}u[k]h[n-k]$

This equation can be understood visually as: (1) flip the impulse response across the n=0 axis (y-axis) i.e h[-k] (2) slide h[-k] n times to the right effectively centering it at the value of n we are trying to compute the output for (3) perform the summation for different values of k. 

If you are having a hard to time visualizing, you can also just compare this convolution equation to the difference equation i.e set the impulse response to be the coefficients of the current and past input samples. 

What about systems that depend on past outputs (systems with feedback)? It turns out that the impulse response for systems with feedback is infinitely long. 

Thus, we can characterize an LTI system using the impulse response and convolution operation. It's pretty cool to think about the fact that you can understand the full behaviour of an LTI system simply by stimulating it with an impulse. For example, a common application is in characterizing the acoustics of a room. We can model the room as an LTI system i.e something that scales and delays signals coming from a sound source and into a microphone; then we can play a loud impulse sound out of a speaker that lasts a short duration and record the impulse response with a microphone. Using the impulse response characterization of the room, we can now construct an inverse filter (an impulse response that when convolved with the room impulse response results in $1$) that counters the effects of the room. 


### Transfer function

So far we have seen descriptions of LTI systems that are in the time-domain i.e we are looking at the signals as sequences. Is there another way to analyze the system? Maybe polynomials..

It turns out that the convolution of two sequences is just like multiplying two polynomials. 

$h[n] = b_0, b_1...b_n \hspace{1cm}  \Leftrightarrow  \hspace{1cm} H[x] = b_0 + b_1x + b_2x^2+...+b_nx^n$

$u[n] = u_0, u_1...u_n \hspace{1cm} \Leftrightarrow \hspace{1cm} U[x] = u_0 + u_1x + u_2x^2+...+u_nx^n$

$h[n] \circledast x[n] \hspace{1cm} \Leftrightarrow \hspace{1cm} H[x] * U[x]$

Try multiplying out the two polynomials to see the equivalence to convolution. The transformation to go from the time sequence $h[n]$ to to the polynomial  $H[x]$ is called the z-transform:

 $X(z)={\mathcal {Z}}\{x[n]\}=\sum _{n=-\infty }^{\infty }x[n]z^{-n}$

Notice that the variable in the polynomial is $z^{-1}$ . You can interpret the power of the variable as a delay in the time domain i.e $x[n-k] = x[n]z^{-k}$.

For a finite impulse response, we have

$h[n] = b_0, b_1...b_n \hspace{1cm} H(z) = {\mathcal {Z}}\{h[n]\} = b_0 + b_1z + b_2z^{-2}+...+b_nz^{-n}$

The z-transform of the impulse response is called the transfer function. Why? Because it relates the input and output of the LTI system via a simple multiplication: $Y(z) = H(z)X(z)$. It answers how much and what parts of X(z) get transferred to the output.

For systems with feedback that have infinitely long impulse responses, we turn back to the general difference equation:

$y[n] = b_0u[n]+b_1x[n-1]+...+b_x[n-k] + a_1y[n-1] +a_2y[n-2] +...+a_p[n-p]$

Take the z-transform of all the terms:

$Y(z) = b_0U(z)+b_1U(z)z^{-1}+...+b_kU(z)z^{-k} + a_1Y(z)z^{-1} +a_2Y(z)z^{-2} +...+a_pY(z)z^{-p}$

$H(z) = \frac{Y(z)}{U(z)} = \frac{b_0+b_1z^{-1}+...+b_kz^{-k}}{1 + a_1z^{-1} +a_2z^{-2} +...+a_pz^{-p}}$

The z-transform is a generalization of the Fourier transform. If you plugin $z = e^{j\omega}$ into the polynomial, you end up with the Fourier transform. It gives you a frequency ($\omega$) domain picture of what your system is doing. Let's say you want to remove a certain set of sinusoids with really low frequencies (eg. airplane takeoff noise), you can construct an LTI system to process your audio files to suppress low frequency sounds.

It is also helpful to decompose those polynomials in the numerator and denominator further into their roots. 

$H(z) = \frac{(z-p_0)(z-p_1)...(z-p_m)} {(z-q_0)(z-q_1)...(z-q_m)}$

The roots of the numerator polynomial are called zeros because the transfer function is zero for those values. The roots of the denominator polynomial are called poles because the transfer function is infinitely large at those values. For example, we can model the human vocal tract (mouth, lips) as an LTI system whose inputs are signals from the larynx/voice box. We can model it as having only poles; often times the vocal tract simply lets through only a handful of frequencies called resonance frequencies. A pair of complex-valued poles can describe a single resonance.

In this quick crash course on signals and systems, we looked at both time-domain and frequency-domain characterizations of LTI systems. How do these concepts relate to Linear Dynamical Systems?

Linear Dynamical Systems (LDS)

The LDS perspective of an LTI system introduces the notion of a state-space. A system is said to be in a given state which summarizes the effects of past inputs on the current output. The state is mathematically a vector $x(k)$. If the current input is $u(k)$ and output is $y(k)$, then the full system is described with these two state-equations:

$x(k+1) = Ax(k) + Bu(k)$

$y(k) = Cx(k) + Du(k)$

Matrix $A$ describes the dynamics of how the state vector evolves over time. $B$ is the input matrix that describes how to absorb the information in the current input into the state. $C$ is the output matrix explaining the relation between the current state of the system and the output. $D$ is the feedthrough matrix. 

Immediately, we see that this description allows us to work with multi-dimensional inputs and outputs (MIMO) eg. if our system is processing videos, each frame of video could be an input vector at time $k$. In our description of LTI systems, we constrained ourselves to single-input single-output (SISO) systems, so we will stick to SISO. 

