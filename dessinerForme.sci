function dessinerForme(Sommets,Faces)
    // On insère les données de chaque face dans des matrices qui contiendront
    // leurs données x, y et z
    Sommets = Sommets';
    for i=1:size(Faces,'r')
        X(:,i) = Sommets(Faces(i,:),1);
        Y(:,i) = Sommets(Faces(i,:),2);
        Z(:,i) = Sommets(Faces(i,:),3);
    end
    
    // Dessin de la figure
    subplot(121)
    plot3d(X,Y,Z); // plot3d
    
    //projection
    subplot(122)
    plot2d(X,Y);
endfunction
