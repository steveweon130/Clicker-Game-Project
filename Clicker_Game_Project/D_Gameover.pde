void gameover() {
  //Music Control
  P1.pause();
  P2.pause();
  P3.pause();
  P4.pause();
  P1.rewind();
  P2.rewind();
  P3.rewind();
  P4.rewind();
  GG.setGain(BGVolume-30);
  GG.play();
  nyan.pause();
  nyan.rewind();
  
  background(red);
  
  //Gameover Sign Outline
  textFont(cursive);
  fill(black);
  text("''GAME OVER''", 500+5, 500);
  text("''GAME OVER''", 500, 500+5);
  text("''GAME OVER''", 500+5, 500);
  text("''GAME OVER''", 500, 500+5);
  
  //Gameover Sign itself
  fill(white);
  text("''GAME OVER''", 500, 500);
  
  //Score Display
  textFont(arialBoldSmall);
  text("Score = " + score, 500, 650);
  
  //Highscore Display
  if (diff == EASY) text("Highest Score in EASY: " + EasyHS, 500, 725);
  else if (diff == NOR) text("Highest Score in NORMAL: " + NormalHS, 500, 725);
  else if (diff == HARD) text("Highest Score in HARD: " + HardHS, 500, 725);
  else if (diff == HELL) text("Highest Score in HELL: " + HellHS, 500, 725);
  
  //New Best Alert
  fill(yellow);
  if (diff == EASY) {
    if (score >= EasyHS) {
      text("''NEW BEST IN EASY DIFFICULTY''", 500, 800);
    }
  } else if (diff == NOR) {
    if (score >= NormalHS) {
      text("''NEW BEST IN NORMAL DIFFICULTY''", 500, 800);
    }
  } else if (diff == HARD) {
    if (score >= HardHS) {
      text("''NEW BEST IN HARD DIFFICULTY''", 500, 800);
    }
  } else if (diff == HELL) {
    if (score >= HellHS) {
      text("''NEW BEST IN HELL DIFFICULTY''", 500, 800);
    }
  }
  
  //Replay Button
  strokeWeight(5);
  stroke(black);
  fill(white);
  tactile(775, 1075, 200, 100);
  rect(775, 1075, 200, 100);
  fill(black);
  text("Quit", 875, 1125);
}

void gameoverClicks() {
  if (mouseX > 775 && mouseX < 975 && mouseY > 1075 && mouseY < 1175) {
    Quit();
  }
}
