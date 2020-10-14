void intro() {
  
  background(bg);
    
  //BACKGROUND ANIMATION
    //Easy Clicker
    strokeWeight(10);
    stroke(green);
    fill(white);
    circle(titleEasyX, titleEasyY, 200);
    image(Easy, titleEasyX+5, titleEasyY-10, 150, 150);
    
    //Normal Clicker
    strokeWeight(10);
    stroke(yellow);
    fill(white);
    circle(titleNormalX, titleNormalY, 200);
    image(Normal, titleNormalX, titleNormalY, 150, 150);
    
    //Hard Clicker
    strokeWeight(10);
    stroke(orange);
    fill(white);
    circle(titleHardX, titleHardY, 200);
    image(Hard, titleHardX, titleHardY, 150, 150);
    
    //Hell Clicker
    strokeWeight(10);
    stroke(red);
    fill(white);
    circle(titleHellX, titleHellY, 200);
    image(Hell, titleHellX, titleHellY, 150, 150);
    
    //Title Box
    stroke(black);
    strokeWeight(5);
    fill(white);
    rect(titleX+5, titleY, 800, 150);
    
    //Title Outline
    fill(black);
    textFont(cursive);
    text("''Le Jeu De Clicker''", titleX+400+5, titleY+70);
    text("''Le Jeu De Clicker''", titleX+400, titleY+70+5);
    text("''Le Jeu De Clicker''", titleX+400-5, titleY+70);
    text("''Le Jeu De Clicker''", titleX+400, titleY+70-5);
    
    //Actual Title
    fill(white);
    text("''Le Jeu De Clicker''", titleX+400, titleY+70);
    
    //Moving
    titleX = titleX + titleVX;
    titleY = titleY + titleVY;
    titleEasyX = titleEasyX + titleEasyVX;
    titleEasyY = titleEasyY + titleEasyVY;
    titleNormalX = titleNormalX + titleNormalVX;
    titleNormalY = titleNormalY + titleNormalVY;
    titleHardX = titleHardX + titleHardVX;
    titleHardY = titleHardY + titleHardVY;
    titleHellX = titleHellX + titleHellVX;
    titleHellY = titleHellY + titleHellVY;

    //Bouncing
    if (titleX < 0 || titleX > width-800) titleVX = titleVX * -1;
    if (titleY < 0 || titleY > height-150) titleVY = titleVY * -1;
    if (titleEasyX < 100 || titleEasyX > width-100) titleEasyVX = titleEasyVX * -1;
    if (titleEasyY < 100 || titleEasyY > height-100) titleEasyVY = titleEasyVY * -1;
    if (titleNormalX < 100 || titleNormalX > width-100) titleNormalVX = titleNormalVX * -1;
    if (titleNormalY < 100 || titleNormalY > height-100) titleNormalVY = titleNormalVY * -1;
    if (titleHardX < 100 || titleHardX > width-100) titleHardVX = titleHardVX * -1;
    if (titleHardY < 100 || titleHardY > height-100) titleHardVY = titleHardVY * -1;
    if (titleHellX < 100 || titleHellX > width-100) titleHellVX = titleHellVX * -1;
    if (titleHellY < 100 || titleHellY > height-100) titleHellVY = titleHellVY * -1;
    
  //BUTTONS
    //Start
    fill(white);
    stroke(black);
    tactile(300, 550, 400, 100);
    rect(300, 550, 400, 100);
    fill(black);
    textFont(arialBoldSmall);
    text("START", 500, 600);
  
    //Option
    fill(white);
    tactile(300, 700, 400, 100);
    rect(300, 700, 400, 100);
    fill(black);
    text("OPTIONS", 500, 750);
  
    //Highscore
    fill(white);
    tactile(300, 850, 400, 100);
    rect(300, 850, 400, 100);
    fill(black);
    text("HIGHSCORE", 500, 900);
}

void introClicks() {
  //Start Clicked
  if (mouseX > 300 && mouseX < 700 && mouseY > 550 && mouseY < 650) {
  mode = GAME;
  }

  //Option Clicked
  if (mouseX > 300 && mouseX < 700 && mouseY > 700 && mouseY < 800) {
    mode = OPTION;
  }

  //Highscore Clicked
  if (mouseX > 300 && mouseX < 700 && mouseY > 850 && mouseY < 950) {
  mode = HIGHSCORE;
  }
}
