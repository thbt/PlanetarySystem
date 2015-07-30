// cube.sce

// Longueur des côtés
cLx = 1;
cLy = 1;
cLz = 1;

// Les vertex du cube
sCube = [cLx*ones(8,1),cLy*ones(8,1),cLz*ones(8,1)] .* ...
   [0,0,0;  // 1
    1,0,0;  // 2
    0,1,0;  // 3
    0,0,1;  // 4
    1,1,0;  // 5
    0,1,1;  // 6
    1,0,1;  // 7
    1,1,1]; // 8

// Cette ligne sert juste à nous simplifier les calculs et a éviter de devoir transposer à chaque fois.
sCube = sCube';
// On met le cube à l'origine.
vect = getOrigin(sCube);
sCube = translation(sCube, -vect);

// Les faces du cube (les numéros sont les id des vertex)
fCube = [1,2,5,3;  // A
         1,3,6,4;  // B
         1,4,7,2;  // C
         2,5,8,7;  // D
         4,7,8,6;  // E
         3,6,8,5]; // F

// L'axe de rotation du cube
axeRotCube = [%pi / 7, 0, 0];

function updateCube(elapsedTime)
    tempCube = sCube; 
    
    // On fait tourner le cube sur lui-même en tennant compte de son axe de rotation. On fait donc tourner le cube normalement puis on rajoute l'axe de rotation
    tempCube = rotationLocale(tempCube, 0, 0, (i * %pi / 10));
    tempCube = rotationLocaleVect(tempCube, axeRotCube);
    
    // On affiche le cube
    dessinerForme(tempCube, fCube);
endfunction
