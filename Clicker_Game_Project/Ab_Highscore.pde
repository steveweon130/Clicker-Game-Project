void highscore() {
  background(bg);
  
  //Title
  stroke(black);
  strokeWeight(5);
  fill(white);
  rect(250, 30, 500, 100);
  fill(black);
  textFont(arialBoldBig);
  textSize(75);
  text("HIGHSCORE", 500, 70);
  
  //Return to Intro Button
  stroke(black);
  strokeWeight(5);
  fill(white);
  tactile(775, 1080, 200, 100);
  rect(775, 1080, 200, 100);
  fill(black);
  textFont(arialBoldSmall);
  text("Return", 875, 1125);
  
  //Easy High Score
  fill(green);
  text("Highest Score in Easy Difficulty:", width/2, 200);
  text(EasyHS, width/2, 250);
  
  //Normal High Score
  fill(yellow);
  text("Highest Score in Normal Difficulty:", width/2, 450);
  text(NormalHS, width/2, 500);
  
  //Hard High Score
  fill(orange);
  text("Highest Score in Hard Difficulty:", width/2, 700);
  text(HardHS, width/2, 750);
  
  //Hell High Score
  fill(red);
  text("Highest Score in Hell Difficulty:", width/2, 950);
  text(HellHS, width/2, 1000);
}

void highscoreClicks() {
  //Return Button Clicked
  if (mouseX > 775 && mouseX < 975 && mouseY > 1080 && mouseY < 1180) {
    mode = INTRO;
  }
}
