from math import e

def Z(x,y):
    a = 3*(1-x)**2 * e**(-1 * x**2 - (y+1)**2)
    b = -10*(x/5 - x**3 + y**5) * e**(-1 * x**2 - y**2)
    c = -e**(-1 * (x+1)**2 - y**2)/3
    return a + b + c
