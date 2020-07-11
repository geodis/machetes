
Matematica
-----------

** exponente: 2**3 -> 8
% modulo: 5%3 -> 2
// div entera: 11//2 -> 5
/ div flot: 11/2 -> 5.5
*,-,+


Funciones
----------

my_name = input()
str(), int(), float()

Operadores
----------

== Equal to
!= not equal to
< less than
> greater than
<=, >=
not

if a==b:
	pass
elif b == c:
	pass
else:
	pass

while spam < 5:
	pass


break: Sale del loop
continue: salta inmediatamente al comienzo del loop

range(5) --> 0..4
range(12, 16) --> 12,13,14,15
# step 2
range(0, 10, 2): 0,2,4,6,8

for i in range(5):
	pass

for i in range(5, -1, -1):
    print(i)

--> 5,4,3,2,1,0

Imports
-------

import random, sys, os, math
# Salir
sys.exit()

print('Hello', end='')
print('cats', 'dogs', 'mice', sep=',')

    
def spam():
    eggs = 99
    bacon()
    print(eggs)

def bacon():
    ham = 101
    eggs = 0
