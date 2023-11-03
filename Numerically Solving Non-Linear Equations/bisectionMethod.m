function root = bisectionMethod(f, a, b, tol)
    fa = f(a);
    fb = f(b);
    
    if fa * fb > 0
        error('The interval [a, b] does not contain a root.');
    end
    
    while (b - a) / 2 > tol
        c = (a + b) / 2;
        fc = f(c);
        
        if fc == 0
            root = c;
            return;
        end
        
        if fa * fc < 0
            b = c;
            fb = fc;
        else
            a = c;
            fa = fc;
        end
    end
    
    root = (a + b) / 2;
end
