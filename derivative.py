# Calculates the derivative of a function at a point p.
def derivative(f,p):
    lim = 0.000001
    df = (f(p + lim) - f(p))/ lim
    return df