
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

Global
-------
def spam():
  global eggs
  eggs = 'spam'

eggs = 'global'
spam()
print(eggs)

Exception
---------

try:
    pass
except <excepcion>:
    manejo_de_excepcion

Listas
-------

[1, 2, 3] + ['A', 'B', 'C']
['X', 'Y', 'Z'] * 3
catNames = catNames + [name]  # list concatenation
supplies = ['pens', 'staplers', 'flamethrowers', 'binders']
>>> for i in range(len(supplies)):

Multiple Assignment Trick
-------------------------
cat = ['fat', 'gray', 'loud']
size, color, disposition = cat # la long de cat tiene que ser igual a la cant de vars o da error
# ValueError: not enough values to unpack (expected 4, got 3)

enumerate()
Instead of using the range(len(someList)) technique with a for loop to obtain the integer
index of the items in the list, you can call the enumerate() function instead

supplies = ['pens', 'staplers', 'flamethrowers', 'binders']
for index, item in enumerate(supplies):
    print('Index ' + str(index) + ' in supplies is: ' + item)

random.choice(lista) -> devuelve un item random
random.shuffle(lista) -> devuelve la lista ordenada random

Augmented assignment
spam += 1  --> spam = spam + 1
spam -= 1 --> spam = spam - 1
spam *= 1 --> spam = spam * 1
spam /= 1 --> spam = spam / 1
spam %= 1 --> spam = spam % 1

Finding a Value in a List with the index() Method
---------------------------------------------
spam = ['hello', 'hi', 'howdy', 'heyas']
spam.index('hello')
-> 0
spam.append('moose')
spam.insert(1, 'chicken')
spam.remove('bat') # If the value appears multiple times in the list,
                   # only the first instance of the value will be removed.
the sort() method sorts the list in place
you cannot sort lists that have both number values and string values in them
sort() uses “ASCIIbetical order”
spam.sort()
spam.sort(reverse=True)



*****************************
https://automatetheboringstuff.com/2e/chapter4/
Mutable and Immutable Data Types
*****************************










