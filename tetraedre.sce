// tetraedre.sce

// Longueur des côtés
tLx = 2;
tLy = 2;
tLz = 2;

// Les sommets du tetra
sTetra = [tLx*ones(4,1),tLy*ones(4,1),tLz*ones(4,1)] .* ...
    [             0,    0, sqrt(2/3)-1/(2*sqrt(6));  // 1
     -1/(2*sqrt(3)), -1/2,          -1/(2*sqrt(6));  // 2
     -1/(2*sqrt(3)),  1/2,          -1/(2*sqrt(6));  // 3
          1/sqrt(3),    0,          -1/(2*sqrt(6))]; // 4

sTetra = sTetra';
tetraOrigine = getOrigin(sTetra);
sTetra = translation(sTetra, -tetraOrigine);

fTetra = [1 2 3; // A
          1 3 4; // B
          1 2 4; // C
          2 3 4];// D
          
axeRotTetra = [0, 0, 7 * %pi / 12];
          
function updateTetraedre(elapsedTime)
    temp = sTetra; 
    
    // On fait tourner le tetra sur lui-même en tennant compte de son axe de rotation
    temp = rotationLocale(temp, 0, 0, (-elapsedTime * %pi / 3));
    temp = rotationLocaleVect(temp, axeRotTetra);
    
    // On translate le tetra et on le tourne par rapport au soleil (le centre de l'univers)
    temp = translation(temp, [2.5 0 0]);
    temp = rotationGlobale(temp, 0, 0, elapsedTime * %pi / 4);
    // On annule la rotation de l'axe de rotation
    temp = rotationLocale(temp, 0, 0, -(elapsedTime * %pi / 4));
    
    // Enfin, on affiche le tetra
    dessinerForme(temp, fTetra);
endfunction
