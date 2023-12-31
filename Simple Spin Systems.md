Mmpset 3 CP 3

(a)
Write down the most general 2x2 hermitian matrix
```wolfram
H = b_0 IdentityMatrix[2] + Sum[b_i PauliMatrix[i], {i,1,3}];
H // MatrixForm
```
Find its eigenvalues and normalize its eigenvectors
```wolfram
eigsys = Eigensystem[H];
e = eigsys[[1]]
v = FullSimplify[{eigsys[[2,1]] / Norm[eigsys[[2,1]]], eigsys[[2,2]] / Norm[eigsys[[2,2]]]}, Assumptions -> {b_1 $\in$ Reals, b_2 $\in$ Reals, b_3 $\in$ Reals}
```
The energy eigenstates are obtained from these eigenvectors
```wolfram
spins = {Ket[up], Ket[down]};
energy = {v[[1]].spins, v[[2]].spins}
```

(b)
The general solution to TDSE in terms of the energy eigenstates:
```wolfram
psi = A_1 * Exp[-I e[[1]]t] energy[[1]] + A_2 Exp[-I e[[2]]t] * energy[[2]]
repl = {b_0 -> 1, b_1 -> 1, b_2 -> 0, b_3 -> 0};
psi0 = psi /. repl
```

(c)
Determine $A_1$ and $A_2$ using the initial state
```wolfram
Asol = Solve[{Coefficient[psi0 /. t ->0, Ket[up]] == 1, Coefficient[psi0 /. t ->0, Ket[down]] == 0}, {A_1, A_2}] // First
```
The wavefunction for this initial condition:
```wolfram
psiin = Collect[psi0 /. Asol, spins]
```
Compute the probabilities of the system being in up/down states
```wolfram
coeffup = Coefficient[psiin, Ket[up]];
coeffdown = Coefficient[psiin, Ket[down]];
{"p_{up}" -> FullSimplify[coeffup * Conjugate[coeffup], Assumptions -> t $\in$ Reals], "p_{down}" -> FullSimplify[coeffdown * Conjugate[coeffdown], Assumptions -> t $\in$ Reals]}
