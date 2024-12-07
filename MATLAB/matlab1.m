syms x y
z=(x^3+3*x*y^2)/(y^3+3*x^2*y)
diff(z,x)
diff(z,y)
diff(z,x,y)
diff(z,y,x)