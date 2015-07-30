// Cette fonction applique une rotation locale de [x y z] sur la matrice mat. (locale = par rapport au point de pivot de l'objet. Ici, c'est son barycentre).
function res=rotationLocale(mat, x, y, z)
    res = mat;
    
    vect = getOrigin(res);
    res = translation(res, -vect);
    
    res = [cos(z) -sin(z) 0;
           sin(z) cos(z)  0;
           0       0      1] * res;
    res = [cos(y) 0 -sin(y);
           0      1    0;
           sin(y) 0 cos(y)] * res;
    res = [1    0      0;
           0 cos(x) -sin(x);
           0 sin(x) cos(x)] * res;

    res = translation(res, vect);
endfunction

// Cette fonction applique une rotation locale de [x y z] sur la matrice mat. Cette version permet de passer directement un vecteur en paramètre.
function res=rotationLocaleVect(mat, vect)
    res = rotationLocale(mat, vect(1), vect(2), vect(3));
endfunction

// Cette fonction applique une rotation globale de [x y z] sur la matrice mat. (globale = par rapport à l'origine).
function res=rotationGlobale(mat, x, y, z)
    res = mat;
    
    res = [cos(z) -sin(z) 0;
           sin(z) cos(z)  0;
           0       0      1] * res;
    res = [cos(y) 0 -sin(y);
           0      1    0;
           sin(y) 0 cos(y)] * res;
    res = [1    0      0;
           0 cos(x) -sin(x);
           0 sin(x) cos(x)] * res;
endfunction

