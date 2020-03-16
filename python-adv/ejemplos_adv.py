# class Dog:
#   def __init__(self):
#       self.bark()

# =================================
# def make_class(x):
#   class Dog:
#       def __init__(self, name):
#           self.name = name

#       def print_value(self):
#           print(x)

#   return Dog

# cls = make_class(10)
# print("-----------")
# print(cls)

# d = cls("Tim")
# print(d.name)

# d.print_value()


# =================================


# for i in range(10):
#   def show():
#       print(i*2)
#       print("**")

#   print("--")
#   show()  

# =================================

# import inspect
# def func(x):
#   if x == 1:
#       def rv():
#           print("x es 1")
#   else:
#       def rv():
#           print("x != 1")
#   return rv

# new_func = func(12)
# new_func()
# print(id(new_func))
# # print(inspect.getmembers(new_func)

# # Accedo al fuente interpretado por python
# print(inspect.getsource(new_func))


# =================================
"""
dumpear librerias
"""

# import inspect
# from queue import Queue

# print(inspect.getsource(Queue))

# =================================

# import inspect

# # list es un built-in class por lo que no puedo ver el source
# # print(inspect.getsource(list))

# x = [1,2,3]
# y = [4,5]

# =================================

# class Person:
#     # DataModel methods
#     # https://docs.python.org/3/reference/datamodel.html
#     def __init__(self,name):
#         self.name = name

#     def __repr__(self):
#         return f"Person({self.name})"

#     def __mul__(self,x):
#         if type(x) is not int:
#             raise Exception("Invalid argument, must be int")

#         self.name = self.name * x

#     def __call__(self,y):
#         print("called this function", y)

#     def __len__(self):
#         return len(self.name)


# # ej: __repr__ 
# p = Person("pepe")
# print(p)

# # ej: __mul__ 
# p * 4
# print(p)

# # ej: __call__
# p(10) 

# # ej: __len__
# print(len(p))

# =================================

# from queue import Queue as q
# import inspect

# # Queue es mi clase que hereda de q
# class Queue(q):
#     # la Queue original no define __repr__
#     def __repr__(self):
#         # la Queue original implementa _qsize()
#         return f"Queue({self._qsize()})"

#     def __add__(self, item):
#         self.put(item)

#     def __sub__(self, item):
#         self.get()


# qu = Queue()
# # llamo a __add__
# print(qu)
# qu + 9
# print(qu)
# qu + 7
# print(qu)
# # llamo a __sub__
# qu - 1
# print(qu)

# =================================

# Metaclases
# ----------

# Ver mas tarde porque no se usa casi

# Decorators
# ----------

def func(f):
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