void game() {
  GG.rewind();
  if (diff == EASY) {
    EasyGame();
  } else if (diff == NOR) {
    NormalGame();
  } else if (diff == HARD) {
    HardGame();
  } else if (diff == HELL) {
    HellGame();
  }
  
  //Moving Balls
  ballX = ballX + ballVX;
  ballY = ballY + ballVY;
  
  //Bouncing Ball
  if (ballX < size/2 || ballX > width - size/2) {
    ballVX = ballVX * -1;
    bump.rewind();
    bump.setGain(GVolume-30);
    bump.play();
  }

  if (ballY < 200 + size/2 || ballY > height - size/2) {
    ballVY = ballVY * -1;
    bump.rewind();
    bump.setGain(GVolume-30);
    bump.play();
  }
  
  //Game Tab
  fill(bg);
  stroke(black);
  strokeWeight(0);
  rect(0, 0, width, 200);

  //Pause Button
  strokeWeight(5);
  tactile(25, 25, 125, 125);
  rect(25, 25, 125, 125);
  strokeWeight(0);
  fill(black);
  rect(65, 45, 15, 80);
  rect(95, 45, 15, 80);

  //Score Board
  fill(0);
  textFont(arial);
  textAlign(LEFT, CENTER);
  text("Score = " + Rscore, 175, 37.5);
  
  //Lives
  text("Lives = ", 175, 117.5);
  if (lives == 1) {
    image(heart, 380, 125, 50, 50);
  } else if (lives == 2) {
    image(heart, 380, 125, 50, 50);
    image(heart, 450, 125, 50, 50);
  } else if (lives == 3) {
    image(heart, 380, 125, 50, 50);
    image(heart, 450, 125, 50, 50);
    image(heart, 520, 125, 50, 50);
  } else if (lives > 3) {
    image(heart, 380, 125, 50, 50);
    image(heart, 450, 125, 50, 50);
    image(heart, 520, 125, 50, 50);
    text("X" + (lives - 3), 560, 117.5);
  }
  
  //High Score Board
  textAlign(CENTER, CENTER);
  if (diff == EASY) {
    if (EasyHS <= score) {
      EasyHS = score;
      fill(green);
      text("NEW BEST!!", 825, 100);
    }
  } else if (diff == NOR) {
    if (NormalHS <= score) {
      NormalHS = score;
      fill(yellow);
      text("NEW BEST!!", 825, 100);
    }
  } else if (diff == HARD) {
    if (HardHS <= score) {
      HardHS = score;
      fill(orange);
      text("NEW BEST!!", 825, 100);
    }
  } else if (diff == HELL) {
    if (HellHS <= score) {
      HellHS = score;
      fill(red);
      text("NEW BEST!!", 825, 100);
    }
  }
  
  //Nyan Cat
  strokeWeight(0);
  fill(white);
  tactile(nyanX, nyanY, 198, 120);
  rect(nyanX, nyanY, 198, 120);
  imageMode(CORNER);
  image(NyanCat, nyanX, nyanY, 198, 120);
  imageMode(CENTER);
  
  nyanCounter = nyanCounter + random(1, 25);
  
  //Nyan Cat appear
  if (nyanCounter >= 10000) {
    nyan.play();
    nyan.setGain(BGVolume-30);
    nyanX = nyanX + 17.5;
  }
  
  //Nyan Cat Gone
  if (nyanX > width) {
    nyan.pause();
    nyan.rewind();
    nyanX = -198;
    nyanCounter = 0;
    nyanY = random(320, 1100);
  }
}

void gameClicks() {  
  if (diff == EASY) {
    EasyGameClicks();
  } else if (diff == NOR) {
    NormalGameClicks();
  } else if (diff == HARD) {
    HardGameClicks();
  } else if (diff == HELL) {
    HellGameClicks();
  }
}
