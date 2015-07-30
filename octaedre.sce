// octaedre.sce

// Longueur des côtés
oLx = 2.5;
oLy = 2.5;
oLz = 2.5;

// Les sommets de l'octa
sOcta = [oLx*ones(6,1),oLy*ones(6,1),oLz*ones(6,1)] .* ...
   [  0,  0,   0;  // 1
      1,  0,   0;  // 2
      0,  1,   0;  // 3
      1,  1,   0;  // 4
    0.5,0.5, 0.5;  // 5
    0.5,0.5,-0.5]; // 6
    
sOcta = sOcta';
octaOrigine = getOrigin(sOcta);
sOcta = translation(sOcta, -octaOrigine);

fOcta = [1 3 5;     // A
         1 2 5;     // B
         3 4 5;     // C
         2 4 5;     // D
         1 3 6;     // E
         3 4 6;     // F
         1 2 6;     // G
         2 4 6];    // H

axeRotOcta = [8 * %pi / 12, 0, 0];

function updateOctaedre(elapsedTime)
    temp = sOcta; 
    
    // On fait tourner l'octa sur lui-même en tennant compte de son axe de rotation
    temp = rotationLocale(temp, 0, 0, (elapsedTime * %pi / 13)); // Ca porte chance.
    temp = rotationLocaleVect(temp, axeRotOcta);
    
    // On translate l'octa et on le tourne par rapport au soleil (le centre de l'univers)
    temp = translation(temp, [4 0 0]);
    temp = rotationGlobale(temp, 0, 0, elapsedTime * %pi / 9);
    // On annule la rotation de l'axe de rotation
    temp = rotationLocale(temp, 0, 0, -(elapsedTime * %pi / 9));
    
    // Enfin, on dessine l'octa
    dessinerForme(temp, fOcta);
endfunction
