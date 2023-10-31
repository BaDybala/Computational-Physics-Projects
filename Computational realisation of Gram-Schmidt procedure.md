MM Pset1 CP1

Work within the setting of question 4, so in the space $L^2_w(R)$ with scalar product (5) and weight function $w(x) = e^{−x^2}$.

(a) Define, within Mathematica, the scalar product (5).

(b) Write a short piece of code which realises the Gram-Schmidt procedure for a finite list of functions. In particular, this code should be capable of taking the monomials $(1, x, x^2, . . . , x^n)$ as an input and returning the orthogonal polynomials $(p_0, . . . , p_n)$.

(c) Use this code to check your by-hand calculation in question 4) and also apply it to larger monomial lists for n > 2.

(d) Choose some functions in $f ∈ L^2_w(R)$ and expand them in the monomial basis $(p_0, . . . , p_n)$ to obtain an approximation $\widetilde{f} = \sum{_{k=0}^{k=n}} ⟨p_k,f⟩ \cdot p_k$. Compare $f$ and $\widetilde{f}$ by producing a plot.

(a)
 ```wolfram
SP[f1_, f2_, var_] := Integrate[Exp[-var^2]*f1*f2, {var, -Infinity, Infinity}];
SPNum[f1_, f2_, var_] := NIntegrate[Exp[-var^2]*f1*f2, {var, -Infinity, Infinity}];

SPNorm[f_, var_] := Sqrt[SP[f,f,var];
SPNormNum[f_, var_] := Sqrt[SPNum[f,f,var];

{SPNorm[1,x], SP[1,x,x], SPNorm[x,x]}
```

(b)
 ```wolfram
GS[flst_, var_] := Module[{obasis, i, k, ft},
  obasis = {};  (* initialize - will contain the orthonormal basis *)
  For[k=1, k =< Length[flst], k++,
   ft = flst[[k]] - Sum[obasis[[i]] * SP[flst[[k]], obasis[[i]], var], {i, 1, k-1}];  (* the basic Gram-Schmidt formula *)
   obasis = Append[obasis, ft/SPNorm[ft,var]]];  (* Normalize and append to basis list *)
  Simplify[obasis]];
```
 
(c)
 ```wolfram
basis2 = GS[{1,x,x^2}, x] (* obtain the basis *)
Table[SP[basis2[[i]], basis2[[j]], x], {i,1, Length[basis2]}, {j, 1, Length[basis2]}], // MatrixForm (* check orthonormality *)

basis5 = GS[Table[x^k, {k,0,5}], x]
Table[SP[basis5[[i]], basis5[[j]], x], {i,1, Length[basis5]}, {j, 1, Length[basis5]}], // MatrixForm
```

(d)

Sanity check by expanding a fifth order polynomial
```wolfram
poly = 4 - x - 3x^2 - 2x^3 - x^4 + x^5/2
coords = Table[SP[poly, basis5[[i]], x], {i, 1, Length[basis5]}] (* the coordinates of poly relative to the basis *)
Expand[coords,basis5] (* check that the linear combination produces the polynomial *)
```
Now expanding a non-polynomial function
```wolfram
fex = 1/(1 + x^2)
coords2 = Table[SPNum[fex, basis2[[i]], x], {i, 1, Length[basis2]}] (* coordinates for basis with 3 monomials *)
coords5 = Table[SPNum[fex, basis5[[i]], x], {i, 1, Length[basis5]}]
fapprox2 = Simplify[coords2.basis2] (* LC of 3 monomials as an approximate to fex *)
fapprox5 = Simplify[coords5.basis5]
Plot[{fex, fapprox2, fapprox5}, {x, -3, 3}, Frame->True, GridLines->Automatic, PlotLabels->{"f", "3 monomials", "6 monomials"}]
```
Another example - a hyperbolic function
```wolfram
fex = Tanh[x]
coords2 = Table[SPNum[fex, basis2[[i]], x], {i, 1, Length[basis2]}] (* coordinates for basis with 3 monomials *)
coords5 = Table[SPNum[fex, basis5[[i]], x], {i, 1, Length[basis5]}]
fapprox2 = Simplify[coords2.basis2] (* LC of 3 monomials as an approximate to fex *)
fapprox5 = Simplify[coords5.basis5]
Plot[{fex, fapprox2, fapprox5}, {x, -3, 3}, Frame->True, GridLines->Automatic, PlotLabels->{"f", "3 monomials", "6 monomials"}]
```
