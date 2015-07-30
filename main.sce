exec translationUtils.sci;
exec rotationUtils.sci;
exec dessinerForme.sci;
exec cube.sce;
exec tetraedre.sce;
exec octaedre.sce;

xMin = -8;
xMax = 8;
yMin = -8;
yMax = 8;
zMin = -8;
zMax = 8;

i = 0;
while 1
    i = i + 0.1;
    
    // On prépare la prochaine image de l'animation
    drawlater();
    clf();
    
    // On règle les axes
    subplot(121)
    a = gca();
    a.data_bounds = [xMin yMin zMin; xMax yMax zMax];
    a.isoview = "on";
    a.box = "off";
    
    //projection
    subplot(122)
    a = gca();
    a.data_bounds = [xMin yMin zMin; xMax yMax zMax];

    // On s'occupe du cube (update + affichage)
    updateCube(i);
    
    // On s'occupe de l'octaedre (update + affichage)
    updateOctaedre(i);
    
    // On s'occupe du tetraedre (update + affichage)
    updateTetraedre(i);
    
    // Maintenant que la frame est prête, on l'affiche !
    drawnow();
end
