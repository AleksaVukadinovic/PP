Prolog - PROgramming in LOGic
- 70te
- deklarativan
- logika prvog reda

Term:
  - Konstante
    - Atomi (abc, a112, aAAA, ...)
    - Brojevi (11, 23.3, ...)
  - Promenljive(X, Y, Abc, _a, _A, ...)
  - Kompozitni termovi (f(t1, ..., tn))
  
Hornove klauze:
  - Cinjenice (formule oblika p(t1, ..., tn))
  - Pravila (H:- B1, B2, ..., Bn) ako vaze B1-Bn vazi i H
  - Upiti

Program je niz H-klauza


- = unifikabilnost (\\=)
- == identicka jednakost (\\==)
- is aritmeticko izracunavanje
- =:= aritmeticka jednakost (=\\=)
- <, =<, >, ...
- +, -, *, /, //, div, mod, **

Lista:
- []
- .(G, R)

ex. [], .(1, []), .(1, .(2, [])), ...
    [a, b, c] same as .(a, .(b, .(c, [])))

nl <=> \\n
read(X)

write(X)
