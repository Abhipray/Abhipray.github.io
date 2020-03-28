+++ 
date = "2020-02-13"
title = "Where do harmonics and harmonic distortion come from? "
markup = "mmark"
+++

You have probably heard harmonics before, if not *of* harmonics. The following sound clip of someone saying the word "harmonics" contains audible harmonics.

For phenomena that repeat with some fundamental period $T$ or frequency $f=\frac{1}{T}$, harmonics are integer multiples of the fundamental frequency ($nf = n/T$). When you listen to a guitar playing a tone or a flute playing the same tone, say 440Hz, you hear the fundamental frequency as well as the harmonics (880Hz, 1320Hz, etc.) of the vibrations. The relative intensities of the fundamental and harmonics are what tells you the two instruments are different. Different guitar strings or flute holes are tuned to cause the instrument to resonate at different fundamental tones. **Now, where do these integer multiple harmonics come from?** In high school physics, we learn that this is due to the fact that standing waves form on a guitar string or air inside a flute. The standing waves only form to have energy at the fundamental frequency and its harmonics. 

Next, a second context for harmonics. If we asked your computer speaker to generate a pure tone by giving the speaker as input a sine wave of a fixed frequency and then record that audio via a microphone, we again observe harmonics in the microphone recordings. We call these unwanted harmonics, distortion and measure the total harmonic distortion (THD) as the ratio of energy in all of the harmonics to the energy in the fundamental. The distortion could be coming from either the speaker or the microphone. 

It turns out that if a system like a loudspeaker is non-linear, it can generate these harmonics given some input. This is by definition, because a sine wave input into a linear time-invariant (LTI) system will only produce sine wave output of the same frequency as the input, with possibly different amplitude and phase. Thus, if there are harmonics, they must have been injected by a non-linearity in the system. What kind of non-linearities would generate harmonics and why integer multiples of the fundamental as opposed to arbitrary frequencies? The answer will lead us to the Fourier series. 

Harmonic distortion from speakers and harmonics from musical instruments exist because of the same fundamental idea of how periodic functions behave. We will start by looking at graphs of behaviors of periodic functions and then discuss how they apply to the two contexts above. 

# Anatomy of a periodic function

A function $u(t)$ is periodic if it repeats its values every $T$ period: $u(t+nT)=u(t)$. $u(t)$ is also periodic with periods $2T$, $3T$ etc. but we choose to refer to the fundamental period as $T$. We have complete knowledge of the function or signal $u(t)$ if we know its shape in the period $T$.


## Sums of periodic functions
If we add two periodic functions $u(t)$ and $v(t)$ with periods $T_1$ and $T_2$, $u(t) + v(t)$, the sum is *generally* periodic. The period 

https://math.stackexchange.com/questions/164221/period-of-the-sum-product-of-two-functions


## Decomposing a periodic function
Given an arbitrary periodic function $u(t)$ such as the one below,
we ask ourselves, can we decompose $u(t)$ into a sum of simple periodic functions?

From the previous section, we know that if we added up periodic functions (call them the basis functions), we would end up having a periodic function. Let's focus on the first constraint these basis functions need to meet: how do we choose the periods of these basis periodic functions so that their effective period is equal to a given $T$? 

The answer is the punchline: they have to be either equal to $T$ or $T/k$ for $k=1\dots \infty$. If this wasn't so, then the sum would end up having a period that is at least the largest period among the basis functions. To see this...

And this is where harmonics come from. If you have a periodic signal with a fundamental frequency $f_0 = 1/T$, then it can only have contributions from basis functions that have harmonic frequencies $f_1=2/T, f_2=3/T...$. If a guitar string is plucked, it will form a complex looking waveform that is made of the fundamental and its harmonics. In physics, we explain this using the idea of standing waves which form due to constraints on the boundary conditions where the wave reflects back. The standing waves are the basis functions for the overall waveform. This is what a string on my ukulele produces:

## The Fourier Series

What about the shape of these harmonic basis functions? A simple choice is sine and cosine that leads us to the Fourier series. The two most basic periodic functions are $\cos(t)$ and $\sin(t)$, each with period $2\pi$. Or alternatively, $\cos(2\pi t)$ and $\sin(2\pi t)$ have period 1 because $\sin(2\pi (t+1)) = \sin(2\pi t+ 2\pi) = \sin(2\pi t)$. 





# Non-linear systems and harmonics

What about the loudspeaker situation? Why did that produce harmonics when we asked it to play out a pure tone? The imperfections in the sound reproduction/capture process introduced some shape distortion but at least it preserved the pure tone period. For example, it might have clipped if the input signal was too loud leading to a signal that looks like this:

The Fourier transform for this signal looks like this: 

Clearly visible are the harmonics. Because the "non-linearities" preserved the fundamental frequency but changed the waveform shape, energy appears in integer multiples. 

We can pass a pure tone through a system, measure the output waveform and look at its harmonic profile to get a sense for what the "non-linearity" is. The aforementioned total harmonic distortion (THD) is a summary statistic giving us clues into how non-linear our system is. Examples from the book.

Of course, there can also be non-linear systems that will alter the fundamental frequency itself. A simple non-linear operation that would do that is :




