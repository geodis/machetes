
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
            raise Exception("Invalid argument, must be int")

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

# *args, **kwargs
# ===============
"""# correct_function_definition.py
def my_function(a, b, *args, **kwargs):
	print(a)
	print(b)

	for i in args:
		print(i)


	for k,v in kwargs.items():
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

# # Sobrecarga de nombre
"""
func2 = func(func2)
# Aca no estoy llamando a def func2, sino a func(func2) :-|
func2()
"""
# Entonces el equivalente con decoradores es

"""
def func(f):
	# Para aceptar O NO parametros de las funciones que paso por argumento
	def wrapper(*args, **kwargs):
		print("start")
		# Para aceptar O NO parametros de las funciones que paso por argumento
		rv = f(*args, **kwargs)
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
	def wrapper(*args, **kwargs):
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

