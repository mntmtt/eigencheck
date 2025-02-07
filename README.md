# Project 2: Algebraic and Geometric Multiplicities of Matrix Eigenvalues

## 1. Context and Objective

Let $A$ be a real $n \times n$ matrix. The eigenvalues of $A$ have two characterizations:

- $\lambda \in \mathbb{C}$ is an eigenvalue of $A$ if the system $(A - \lambda I)x = 0$ has non-zero solutions. In this case, the dimension of the solution space is called the **geometric multiplicity** of the eigenvalue $\lambda$. We denote this quantity as $\text{mult}_{\text{geo}}(\lambda)$:

  $$
  \text{mult}_{\text{geo}}(\lambda) := n - \text{rk}(A - \lambda I).
  $$

- $\lambda \in \mathbb{C}$ is an eigenvalue of $A$ if $\lambda$ is a root of the equation $f_A(x) = 0$, where $f_A(x) := \text{det}(A - xI)$. In this case, the root's multiplicity is called the **algebraic multiplicity** of $\lambda$. We denote this as $\text{mult}_{\text{alg}}(\lambda)$:

  $$
  \text{mult}_{\text{alg}}(\lambda) := \{m \in \mathbb{N} : 0 = f_A(\lambda) = f_A'(\lambda) = \dots = f_A^{(m-1)}(\lambda), \text{but } f_A^{(m)}(\lambda) \neq 0\}.
  $$

A matrix is diagonalizable (i.e., $A = P^{-1} \Lambda P$, where $P$ is an invertible matrix and $\Lambda$ is a diagonal matrix with eigenvalues on the diagonal) if and only if for every eigenvalue $\lambda$:

$$
\text{mult}_{\text{geo}}(\lambda) = \text{mult}_{\text{alg}}(\lambda).
$$

We aim to develop a program capable of verifying the diagonalizability of a given matrix.

### Geometric Multiplicity Calculation

To compute the geometric multiplicity, we will rely on **LU factorization**. The LU algorithm (with partial pivoting) produces a matrix $U$ with as many "null" rows as the dimension of the solution space of $(A - \lambda I)x = 0$. This check can be performed on the diagonal elements of $U$, and a tolerance should be set to count, for example, the elements:

$$
\{i \in \{1, \dots, n\} : |U_{i,i}| < \text{tolerance}\}.
$$

### Algebraic Multiplicity Calculation

To compute the algebraic multiplicity of an eigenvalue, we can use the convergence properties of the **Newton method**. It is known that the Newton method, when approximating a root of order $m$, converges (locally) with linear speed and an asymptotic constant equal to $(m - 1)/m$. That is,

$$
\lim_{k \to +\infty} \frac{|s_k|}{|s_{k+1}|} = \frac{m - 1}{m},
$$

where $s_k$ is the step size. When sufficiently close to the root, we have:

$$
|s_k|/|s_{k+1}| \approx (m - 1)/m.
$$

## 2. Required Functions

### 2.1 Geometric Multiplicity Calculation

Create a function `multgeo` with the call:

```matlab
k = multgeo(A, l, tolerance)
```

#### Input Parameters
- `A`: A square real or complex matrix.
- `l`: A complex scalar (the eigenvalue whose geometric multiplicity is to be calculated).
- `tolerance`: A positive real scalar to verify the nullity condition of the diagonal elements of $U$.

#### Output
- `k`: A positive natural number representing the dimension of the eigenspace.

The function should call MATLAB’s LU factorization and count how many diagonal elements of $U$ are below the user-defined threshold.

### 2.2 Calculation of $f_A(z)$ and $f_A'(z)$

In the Newton method, we need to compute $f_A(z)$ and $f_A'(z)$ for every $z \in \mathbb{C}$. Jacobi's formula allows us to compute this derivative:

$$
\frac{d}{dz} \det(B(z)) = \det(B(z)) \cdot \text{trace} \left( B^{-1}(z) \frac{d}{dz} B(z) \right).
$$

Note that in the Newton method, $f_A'(z)$ only appears as $f_A(z)/f_A'(z)$. For stability reasons, it is better to directly compute this ratio:

$$
g_A(z) := -\frac{f_A(z)}{f_A'(z)} = \frac{1}{\text{trace} \left( (A - zI)^{-1} \right)}.
$$

Additionally, if $PB = LU$ (where $P$ is a permutation matrix, and $L$ and $U$ are LU factors), we have:

$$
\det(P) \cdot \det(B) = \det(U) = \prod_{i=1}^n U_{i,i}.
$$

The value $\det(P)$ equals $1$ if an even number of row swaps is required to convert $P$ to the identity, and $-1$ otherwise.

Create a function `myobjective` with the call:

```matlab
[f, g] = myobjective(z, A)
```

#### Requirements
- Compute $\det(A - zI)$ as $\det(U)/\det(P)$.
- Compute $g_A(z)$ using the previously computed LU factorization to invert $B(z)$.

### 2.3 Algebraic Multiplicity Calculation

Create a function `multalg` with the call:

```matlab
[l, m, flag] = multalg(A, l0, tolerance, it, maxit)
```

#### Input Parameters
- `A`: A square real or complex matrix.
- `l0`: Initial guess for the Newton method.
- `tolerance`: Stopping criterion for step size.
- `it`: Integer greater than or equal to 2.
- `maxit`: Positive integer greater than `it`.

#### Output
- `l`: Calculated eigenvalue.
- `m`: Positive natural number (multiplicity).
- `flag`: 1 for success, 0 for error.

#### Algorithm
- Perform `it` Newton steps starting from `l0`. If the method stops due to reaching tolerance, set `m = 1` and `flag = 1`, then exit.
- Use the last two Newton steps and heuristic (3) to guess $m$.
- Restart from `l0` and initialize the modified Newton method $z_{k+1} = z_k - m g_A(z_k)$ with at most `maxit` steps.
- If the step criterion is met before the maximum allowed steps, exit with `flag = 1`. Otherwise, increment $m$ by one and repeat.
- Exit with `flag = 0` after a total of $10 \times \text{maxit}$ calls to `myobjective`.

## 3. Experimentation

To test the developed program, create some "synthetic" tests and analyze the results, possibly producing illustrative graphs.

### Test Matrix Creation

We can create matrices with known eigenvalues and multiplicities using the structure:

$$
A = Q^T J Q,
$$

where $Q$ is an orthogonal matrix (obtained, for example, by performing a QR factorization on a random matrix) and $J$ is a block diagonal Jordan matrix defined as:

$$
J = \begin{pmatrix}
J_{k_1}(\lambda_1) & 0 & \dots & 0 \\
0 & J_{k_2}(\lambda_2) & \dots & 0 \\
\vdots & \vdots & \ddots & \vdots \\
0 & 0 & \dots & J_{k_p}(\lambda_p)
\end{pmatrix},
$$

where each block is of the form:

$$
J_k(\lambda) = \begin{cases}
\lambda & \text{if } k = 1, \\
\begin{pmatrix}
\lambda & 1 & 0 & \dots & 0 \\
0 & \lambda & 1 & \dots & 0 \\
\vdots & \vdots & \vdots & \ddots & \vdots \\
0 & \dots & \dots & \lambda & 1 \\
0 & \dots & \dots & 0 & \lambda
\end{pmatrix} & \text{if } k > 1.
\end{cases}
$$

The matrix $J$ has eigenvalues $\lambda_1, \dots, \lambda_p$ with geometric multiplicity:

$$
\text{mult}_{\text{geo}}(\lambda_i) = \text{Card}\{j \in \{1, 2, \dots, p\} : \lambda_i = \lambda_j\},
$$

and algebraic multiplicity:

$$
\text{mult}_{\text{alg}}(\lambda_i) = \sum_{\{j \in \{1, 2, \dots, p\} : \lambda_i = \lambda_j\}} k_j.
$$

### Testing Recommendations

Perform tests with matrices created using this procedure and identify the software's limitations. Consider eigenvalues that are well-spaced or clustered with low (1-2) or high (3-7) multiplicities.

