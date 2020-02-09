+++ 
date = "2020-02-13"
title = "Where do harmonics and harmonic distortion come from? "
markup = "mmark"
+++

You have heard harmonics before, if not of harmonics. For periodic phenomena with some fundamental period $T$ or frequency $f=\frac{1}{T}$, harmonics are integer multiples of the fundamental frequency ($nf = n/T$). When you listen to a guitar playing a tone or a flute playing the same tone, say 440Hz, you hear the fundamental frequency as well as the harmonics (880Hz, 1320Hz, etc.) of the vibrations. The relative intensities of the fundamental and harmonics are what tells you the two instruments are different. Different strings or holes are tuned to produce different fundamental tones. **Now, where do these harmonics come from?** In high school physics, we learn that this is due to the fact that standing waves form on a guitar string or air inside a flute. The standing wave has energy at the fundamental frequency as well as harmonics. 

Next, a second context for harmonics: if we asked your computer speaker to generate a pure tone by giving the speaker as input a sine wave of a fixed frequency and then we record that audio via a microphone, we again observe harmonics. We call these unwanted harmonics, distortion and measure the total harmonic distortion (THD) as the ratio of energy in all of the harmonics to the energy in the fundamental. The distortion could be coming from either the speaker or the microphone. 

It turns out that if a system is non-linear, it can generate these harmonics. This is by definition, because a sine wave input into a linear time-invariant (LTI) system will only produce sine wave output of the same frequency as the input, with possibly different amplitude and phase. Thus, if there are harmonics, they must have been injected by a non-linearity in the system. What kind of non-linearities would generate harmonics and why integer multiples of the fundamental as opposed to arbitrary frequencies? The answer lies in the Fourier series. 

The harmonic distortion from speakers and harmonics from musical instruments exist because of the same fundamental idea of how periodic functions behave. We will start by looking at graphs of periodic functions and then discuss how they apply to the two contexts above. 

# Anatomy of a periodic function
