### Dockerfile
https://github.com/tiizuka/docker-python-flint/blob/main/Dockerfile

### These images
provide workarounds for dealing with Python-FLINT build errors with the latest versions of Debian.

### Versions
```
+ pip list
python-flint 0.3.0

+ python -VV
Python 3.11.3 (main, May  3 2023, 08:21:46) [GCC 10.2.1 20210110]

+ dpkg -l
ii  libflint-2.6.3:amd64    2.6.3-3                      amd64        C library for number theory, shared library
ii  libflint-arb2:amd64     1:2.19.0-1                   amd64        C library for arbitrary-precision ball arithmetic, shared library
ii  libgf2x3:amd64          1.3.0-1+b1                   amd64        Routines for fast arithmetic in GF(2)[x]
ii  libgmp10:amd64          2:6.2.1+dfsg-1+deb11u1       amd64        Multiprecision arithmetic library
ii  libmpfr6:amd64          4.1.0-3                      amd64        multiple precision floating-point computation
ii  libntl43:amd64          11.4.3-1+b1                  amd64        Number Theory Library, shared library

+ cat /etc/debian_version
11.7
```
### Python-FLINT is

```
Python extension module wrapping FLINT (Fast Library for Number Theory) and Arb (arbitrary-precision ball arithmetic). Features:
 * Integers, rationals, integers mod n
 * Real and complex numbers with rigorous error tracking
 * Polynomials and matrices over all the above types
 * Lots of mathematical functions

Author: Fredrik Johansson <fredrik.johansson@gmail.com>
Repository: https://github.com/fredrik-johansson/python-flint/
```
https://fredrikj.net/python-flint/

### Examples

```
$ docker run -it --rm tizk/python-flint python
>>> from flint import *

>>> # Number-theoretic functions:
>>> fmpz(1000).partitions_p()
24061467864032622473692149727991

>>> # Polynomial arithmetic:
>>> a = fmpz_poly([1,2,3]); b = fmpz_poly([2,3,4])
>>> a.gcd(a * b)
3*x^2 + 2*x + 1

>>> # Matrix arithmetic:
>>> fmpz_mat([[1,1],[1,0]]) ** 10
[89, 55]
[55, 34]

>>> # Numerical evaluation:
>>> showgood(lambda: (arb.pi() * arb(163).sqrt()).exp() - 640320**3 - 744, dps=25)
-7.499274028018143111206461e-13

>>> # Numerical integration:
>>> ctx.dps = 100
>>> acb.integral(lambda x, _: (-x**2).exp(), -100, 100) ** 2
[3.1415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421171 +/- 4.04e-98]
```
