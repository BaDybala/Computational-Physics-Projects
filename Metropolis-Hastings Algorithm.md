MathMeth Pset1 CP3

The problem is somewhat outside our main narrative, but it is related to the discussion of measures. 
Consider the space $L^1_w(\mathbb{R})$ with measure $w(x)dx$. The problem is to generate a sample of $n$ points $p_i ∈ \mathbb{R}$ which are distributed according to the 
measure $w$, so that integrals $\int_{\mathbb{R}} dx w(x) f(x)$, for $f ∈ L^1_w(\mathbb{R})$, can be numerically evaluated by the sum: $n^{-1} \cdot \sum{_{i=1}^{n}} f(p_i)$.  
The Metropolis-Hastings algorithm is a method to generate precisely such a point sample and it is an example of a Markow-chain Monte-Carlo method. 
Such methods are applied in many areas of physics.

(b) Write a simple piece of Mathematica code which generates a sample of $n$ points $p_i$ which are distributed according to a given measure $w(x)$. 
Use a Gaussian proposal distribution.

(c) Apply this code to the probability distribution $w(x) = (5 \pi)^{-1} \cdot (1 + 5x^2 + 2x^4) \cdot e^{-x^2}$. 
Verify the result by plotting $w$ together with a histogram of the point sample $p_i$.

(d) Choose a function $f ∈ L^1_{\mathbb{R}}$ and evaluate its integral $\int_{\mathbb{R}} dx w(x) f(x)$ numerically, by
computing $n^{-1} \cdot \sum{_{i=1}^{n}} f(p_i)$. Compare the result with Mathematica’s built-in numerical integration.
