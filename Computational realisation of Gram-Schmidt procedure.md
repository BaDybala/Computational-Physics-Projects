MM Pset1 CP1) 
Work within the setting of question 4), above, so in the space L2w(R) with scalar product (5) and weight function w(x) = exp(−x2).
(a) Define, within Mathematica, the scalar product (5).
(b) Write a short piece of code which realises the Gram-Schmidt procedure for a finite list of functions. In particular, this code should be capable of taking the monomials (1, x, x2, . . . , xn) as an input and returning the orthogonal polynomials (p0, . . . , pn).
(c) Use this code to check your by-hand calculation in question 4) and also apply it to larger monomial lists for n > 2.
(d) Choose some functions in f ∈ L2w(R) and expand them in the monomial basis (p0, . . . , pn) to obtain an approximation f ̃=Sum_k=0 -> k=n ⟨pk,f⟩pk. Compare f and f ̃ by producing a plot.

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
  
```