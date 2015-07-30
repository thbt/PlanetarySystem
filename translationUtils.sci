// Cette fonction permet de faire une translation sur la matrice mat de vecteur.
function res=translation(mat, vector)
     res = mat;
     
     for i = 1:size(mat, 'r')
        for j = 1:size(mat, 'c')
            res(i, j) = mat(i, j) + vector(i);
        end
     end
endfunction

// Cette fonction retourne la position du barycentre de mat. (pour nous, cela représente le point de pivot et l'origine de l'objet)
function origin=getOrigin(mat) 
    origin = zeros(3, 1);
    origin(1) = mean(mat(1, :));
    origin(2) = mean(mat(2, :));
    origin(3) = mean(mat(3, :));
endfunction
