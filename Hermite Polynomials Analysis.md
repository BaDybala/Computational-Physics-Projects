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
```wolfram
a= Table[Integrate[HermiteH[n,x] * Exp[-x^2], {x, -Infinity, Infinity}] / Sqrt[Pi] / 2^n / Factorial[n], {n,0,nmax}];
series = Sum[a[[n+1]] HermiteH[n,x], {n,0,nmax}]
seriesnum = Expand[series] // N
```
Compare function and series
```wolfram
Plot[{x^2 / (1+x^2), seriesnum}, {x,-3,3}, Frame -> True, PlotStyle -> {Blue, Red}, GridLines -> Automatic]
```

(b)
Define generating function $G(x,z)$. Taylor expand around $z=0$ to some maximal order $k_max$ and extract coefficients of $z^k$. This is equal to $H_k / k!$
```wolfram
kmax=5;
G[x_,z_] := Exp[2xz-z^2];
Gexp = Series[G[x,z], {z,0,kmax}] // Normal
coeff = CoefficientList[Gexp,z] * Table[Factorial[k], {k,0,kmax}]
```
Compare with built-in Hermite polynomials as a sanity check
```wolfram
Table[coeff[[k+1]] - HermiteH[k,x], {k,0,kmax}] // Simplify
```

(c)
Hamilton operator of the Harmonic oscillator
```wolfram
H[\[psi]_] := -D[$\psi$, {x,2}] / 2 + x^2 $\psi$ / 2;
```
Energy eigenfunctions of the harmonic oscillator
```wolfram
Psi[n_,x_] := Exp[x^2 /2] * HermiteH[n,x] / Sqrt[Sqrt[Pi] * 2^n * Factorial[n]];
```
Compute the diagonal matrix which describes $H$ relative to its eigenfunctions
```wolfram
nmax=10;
Hmat = Table[Integrate[Simplify[Psi[n,x] * H[Psi[m,x]]], {x, -Infinity, Infinity}, {n,0,nmax}, {m,0,nmax}];
Hmat // MatrixForm
```
Define the new Hamiltonian which includes the anharmonic term
```wolfram
H1[$\psi$_] := -D[$\psi$, {x,2}] / 2 + x^2 $\psi$ / 2 + $\epsilon$ x^4 $\psi$;
```
