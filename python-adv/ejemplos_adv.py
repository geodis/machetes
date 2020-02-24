# class Dog:
# 	def __init__(self):
# 		self.bark()

# =================================
# def make_class(x):
# 	class Dog:
# 		def __init__(self, name):
# 			self.name = name

# 		def print_value(self):
# 			print(x)

# 	return Dog

# cls = make_class(10)
# print("-----------")
# print(cls)

# d = cls("Tim")
# print(d.name)

# d.print_value()


# =================================


# for i in range(10):
# 	def show():
# 		print(i*2)
# 		print("**")

# 	print("--")
# 	show()	

# =================================

# import inspect
# def func(x):
# 	if x == 1:
# 		def rv():
# 			print("x es 1")
# 	else:
# 		def rv():
# 			print("x != 1")
# 	return rv

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

import inspect

print(inspect.getsource(list))
x = [1,2,3]
y = [4,5]