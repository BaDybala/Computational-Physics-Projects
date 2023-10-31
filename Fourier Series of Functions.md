a) Find the Fourier series for the function $f : [−π, π] → \mathbb{R}$ defined by

$$
f(x) =
\begin{cases}
    0 & \text{if }  -\pi \le x < 0 \\
    \sin{x} & \text{if } 0 \le x \le \pi
\end{cases}
$$

(b) Find the Fourier series for the functions $f : [−π,π] → \mathbb{R}$ defined by $f(x) = x^2$. 

(c) Use the result from part (b) to sum the series $\sum{_{k=1}^{\infty}} k^{-4}$ .

(a)
```wolfram
f[x_] := Piecewise[{{0, x<0}, {Sin[x], x >= 0}}];
Plot[f[x], {x, -Pi, Pi}, Frame->True]

n=3;  (* Number of coefficients considered *)
a = Table[Integrate[f[x] * Cos[kx] / Pi, {x, -Pi, Pi}, {k, 0, n}]  (* Coefficients of cos *)
b = Table[Integrate[f[x] * Sin[kx] / Pi, {x, -Pi, Pi}, {k, 1, n}]
fseries[x_] := a[[1]]/2 + Sum[a[[k+1]] * Cos[kx], {k,1,n}] + Sum[[b[[k]] * Sin[kx], {k,1,n}];
fseries[x]
