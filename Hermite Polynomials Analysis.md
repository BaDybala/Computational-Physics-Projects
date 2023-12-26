MM Pset3 CP1

(a) For the first few Hermite polynomials, check the Rodriguez formula, the differential equation and orthogonality. Expand the function $f : R -> R$ given by $f(x) = x^2/(1 + x^2)$ (truncate at finite order) and compare the truncated series and the function f by plotting.

(b) Compute the (first few) Hermite polynomials from their generating function.

(c) Find the matrix which describes the Hamilton operator $H$ of the harmonic oscillator, relative to an ortho-normal basis of eigenfunctions of $H$ (focusing on the first few smallest eigenvalues). Introduce a new Hamilton operator $H_1 = H + \epsilon x^4$ for an anharmonic oscillator and find the matrix which describes $H_1$ relative to the eigenbasis of $H$. Analyse how the lowest eigenvalues change as $\epsilon$ increases.


(a)
First, get the first few polynomials from mathematica
 ```wolfram
nmax = 10;
Table[HermiteH[n,x], {n,0,nmax}]
```
And a few from the Rodriguez Formula
```wolfram
Table[(-1)^nExp[x^2]D[Exp[-x^2],{x,n}], {n,0,nmax}] // Expand
```
Check the DFQ
```wolfram
Table[D[HermiteH[n,x], {x,2}] - 2 x D[HermiteH[n,x], x] + 2 n HermiteH[n,x], {n,0,nmax}] // Simplify
```
Check normalization
```wolfram
norm= Table[Integrate[HermiteH[n,x] * HermiteH[m,x] * Exp[-x^2], {x, -Infinity, Infinity}] / Sqrt[Pi] / 2^n / Factorial[n], {n,0,nmax}, {m,0,nmax}];
norm // MatrixForm
```
Plot function
```wolfram
Plot[x^2 / (1+x^2), {x,-3,3}, Frame -> True, GridLines -> Automatic]
```
Find expansion coefficients and series
