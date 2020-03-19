
"""
class Dog:
  def __init__(self):
      self.bark()

# =================================
def make_class(x):
  class Dog:
      def __init__(self, name):
          self.name = name

      def print_value(self):
          print(x)

  return Dog

cls = make_class(10)
print("-----------")
print(cls)

d = cls("Tim")
print(d.name)

d.print_value()
"""

# =================================

"""
for i in range(10):
  def show():
      print(i*2)
      print("**")

  print("--")
  show()  
"""
# =================================
"""
import inspect
def func(x):
  if x == 1:
      def rv():
          print("x es 1")
  else:
      def rv():
          print("x != 1")
  return rv

new_func = func(12)
new_func()
print(id(new_func))
# print(inspect.getmembers(new_func)

# Accedo al fuente interpretado por python
print(inspect.getsource(new_func))
"""

# =================================
"""
dumpear librerias
"""
"""
import inspect
from queue import Queue

print(inspect.getsource(Queue))
"""
# =================================
"""
import inspect

# list es un built-in class por lo que no puedo ver el source
# print(inspect.getsource(list))

x = [1,2,3]
y = [4,5]
"""
# =================================
"""
class Person:
    # DataModel methods
    # https://docs.python.org/3/reference/datamodel.html
    def __init__(self,name):
        self.name = name

    def __repr__(self):
        return f"Person({self.name})"

    def __mul__(self,x):
        if type(x) is not int:
            raise Exception("Invalid nument, must be int")

        self.name = self.name * x

    def __call__(self,y):
        print("called this function", y)

    def __len__(self):
        return len(self.name)


# ej: __repr__ 
p = Person("pepe")
print(p)

# ej: __mul__ 
p * 4
print(p)

# ej: __call__
p(10) 

# ej: __len__
print(len(p))
"""
# =================================
"""
from queue import Queue as q
import inspect

# Queue es mi clase que hereda de q
class Queue(q):
    # la Queue original no define __repr__
    def __repr__(self):
        # la Queue original implementa _qsize()
        return f"Queue({self._qsize()})"

    def __add__(self, item):
        self.put(item)

    def __sub__(self, item):
        self.get()


qu = Queue()
# llamo a __add__
print(qu)
qu + 9
print(qu)
qu + 7
print(qu)
# llamo a __sub__
qu - 1
print(qu)
"""
# =================================

# *ns, **kwns
# ===============
"""# correct_function_definition.py
def my_function(a, b, *ns, **kwns):
	print(a)
	print(b)

	for i in ns:
		print(i)


	for k,v in kwns.items():
		print("key: " + k + " value: " + v)

# # llamada
my_function("1", "2", "3", "4", hola="mundo")
"""

# Metaclases
# ----------

# Ver mas tarde porque no se usa casi

# Decorators
# ----------

"""def func(f):
	def wrapper():
		print("start")
		f()
		print("end")

	return wrapper

def func2():
	print("soy func2")


x = func(func2)
print(x)
x()
"""

# # Sobrecna de nombre
"""
func2 = func(func2)
# Aca no estoy llamando a def func2, sino a func(func2) :-|
func2()
"""
# Entonces el equivalente con decoradores es

"""
def func(f):
	# Para aceptar O NO parametros de las funciones que paso por numento
	def wrapper(*ns, **kwns):
		print("start")
		# Para aceptar O NO parametros de las funciones que paso por numento
		rv = f(*ns, **kwns)
		print("end")
		# Hago un return por si alguna f pasada por parametro devuelve algo
		return rv

	return wrapper

# equivale a:
# func2 = func(func2)
@func
def func2(x,y):
	print(x)
	return y


@func
def func3():
	print("soy func3")

# 
x = func2(4,5)
print("-----------")
func3()
print("-----------")
print(x)
"""

# Ejemplo Practico
# -----------------
"""
import time

def timer(func):
	def wrapper(*ns, **kwns):
		start = time.time()
		rv = func()
		total = time.time() - start
		print("Time: ", total)
		return rv
	return wrapper

@timer
def test():
	for _ in range(1000000):
		pass

@timer
def test2():
	time.sleep(2)

test()
test2()
"""

# Generators
# ---------------

# x = [i**2 for i in range(10000000000)]
	
# for el in x:
# 	print("-")
# 	print(el)

"""
class Gen:
	def __init__(self, n):
		super(Gen, self).__init__()
		self.n = n
		self.last = 0

	def __next__(self):
		print("__next__ %s %s" % (self.n, self.last))
		return self.next()

	def next(self):
		print("next")
		if self.last == self.n:
			raise StopIteration()

		rv = self.last ** 2
		self.last += 1
		return rv
	
g = Gen(100)

while True:
	try:
		print(next(g))
	except StopIteration:
		break
"""

# # Ejemplo1
# ----------
"""
def gen(n):
	for i in range(n):
		yield i**2

g = gen(10)

for a in g:
	print('a %s ' % a)
"""


# # Ejemplo2
# ----------
"""
def contador(max):
    print("=Dentro de contador - empezando")
    n=0
    while n < max:
        print(f"=Dentro de contador - viene yield con n={n}")
        yield n +2
        print("=Dentro de contador - retomando después de yield")
        n=n+1
    print("=Dentro de contador - terminando")

print("Instanciando contador") 
mycont = contador(3)
print("Contador instanciado") 

for i in mycont:
    print(f"valor leido del iterador={i}") 
print("Listo") 
"""

# Context Managers
# ----------------
"""
file = open("file.txt","w")
try:
	file.write("hello")
finally:
	file.close()

# Equivale a (con context manager)

# Se encarga automaticamente de hacer finally: close
with open("file.txt","w") as file:
	file.write("hello")
"""

# Mi propio context manager
# -------------------------
"""
class File:
	def __init__(self, filename, method):
		self.file = open(filename, method)

	def __enter__(self):
		print("Enter")
		return self.file

	def __exit__(self, type, value, traceback):
		print(f"{type}, {value}, {traceback}")
		print("Exit")
		self.file.close()

		if type == Exception:
			return True

with File("file.txt", "w") as f:
	print("Middle")
	f.write("hello")
	raise Exception()
	# raise FileExistsError()

"""
# Mi propio context manager - usando generators y un decorador
# supuestamente es mejor el ejemplo de arriba porque es mas versatil
# ------------------------------------------------------------

from contextlib import contextmanager

@contextmanager
def file(filename, method):

	print("enter")
	file = open(filename, method)
	yield file
	file.close()
	print("exit")

with file("file.txt", "w") as f:
	print("middle")
	f.write("hello")
