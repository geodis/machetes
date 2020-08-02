
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



Mutable and Immutable Data Types
********************************
- A list value is a mutable data type: it can have values added, removed, or changed.

- string is immutable: it cannot be changed.

The proper way to “mutate” a string is to use slicing and concatenation to build a new string


name = 'Zophie a cat'
newName = name[0:7] + 'the' + name[8:12]

Tuples cannot have their values modified, appended, or removed.

'tuple' object does not support item assignment
You can use tuples to convey to anyone reading your code that you 
don’t intend for that sequence of values to change
If you need an ordered sequence of values that never changes


tuple(['cat', 'dog', 5])
Converting a tuple to a list is handy if you need a mutable version of a tuple value.
list(('cat', 'dog', 5))

list('hello')
['h', 'e', 'l', 'l', 'o']

➊ >>> spam = [0, 1, 2, 3, 4, 5]
➋ >>> cheese = spam # The reference is being copied, not the list.
➌ >>> cheese[1] = 'Hello!' # This changes the list value.
   >>> spam
   [0, 'Hello!', 2, 3, 4, 5]
   >>> cheese # The cheese variable refers to the same list.
   [0, 'Hello!', 2, 3, 4, 5]


All values in Python have a unique identity that can be obtained with the id() function

bacon = 'Hello'
>>> id(bacon)
44491136
>>> bacon += ' world!' # A new string is made from 'Hello' and ' world!'.
>>> id(bacon) # bacon now refers to a completely different string.
44609712

The copy Module’s copy() and deepcopy() Functions
-------------------------------------------------
+ copy.copy(), can be used to make a duplicate copy of a mutable value like a list
or dictionary

import copy
>>> spam = ['A', 'B', 'C', 'D']
>>> id(spam)
44684232
>>> cheese = copy.copy(spam)
>>> id(cheese) # cheese is a different list with different identity.
44685832
>>> cheese[1] = 42
>>> spam
['A', 'B', 'C', 'D']
>>> cheese
['A', 42, 'C', 'D']



DICTIONARIES AND STRUCTURING DATA
----------------------------------

a dictionary is a mutable collection
dictionaries are not ordered,


The keys(), values(), and items() Methods

In [1]: spam = {'color': 'red', 'age': 42}                                                                                       

In [2]: spam.values()                                                                                                            
Out[2]: dict_values(['red', 42])

In [3]: spam.keys()                                                                                                              
Out[3]: dict_keys(['color', 'age'])

In [4]: spam.items()                                                                                                             
Out[4]: dict_items([('color', 'red'), ('age', 42)])


'name' in spam.keys()

The get() Method
-----------------

It’s tedious to check whether a key exists in a dictionary before accessing that key’s value. 
Fortunately, dictionaries have a get() method that takes two arguments: 
the key of the value to retrieve and a fallback value to return if that key does not exist.

picnicItems = {'apples': 5, 'cups': 2}
>>> 'I am bringing ' + str(picnicItems.get('cups', 0)) + ' cups.'
'I am bringing 2 cups.'
>>> 'I am bringing ' + str(picnicItems.get('eggs', 0)) + ' eggs.'
'I am bringing 0 eggs.'

The setdefault() Method
-----------------------

spam = {'name': 'Pooka', 'age': 5}
if 'color' not in spam:
    spam['color'] = 'black'

En vez de todo ese codigo

 spam = {'name': 'Pooka', 'age': 5}
>>> spam.setdefault('color', 'black')
Si color existia no lo pisa

In [10]: message = 'It was a bright cold day in April, and the clocks were striking thirteen.'                                   

In [11]: for character in message: 
    ...:     count.setdefault(character, 0) 
    ...:     count[character] = count[character] + 1 
    ...: print(count)

{'I': 1, 't': 6, ' ': 13, 'w': 2, 'a': 4, 's': 3, 'b': 1, 'r': 5, 'i': 6, 'g': 2, 'h': 3, 
'c': 3, 'o': 2, 'l': 3, 'd': 3, 'y': 1, 'n': 4, 'A': 1, 'p': 1, ',': 1, 'e': 5, 'k': 2, '.': 1}


Pretty Printing
---------------

pprint() and pformat() “pretty print” a dictionary’s values



********************
pprint.pprint(count)
********************