function root = newtonRaphsonMethod(f, df, x0, tol)
    x = x0;
    while true
        fx = f(x);
        dfx = df(x);
        
        x1 = x - fx / dfx;
        
        if abs(x1 - x) < tol
            root = x1;
            return;
        end
        
        x = x1;
    end
end