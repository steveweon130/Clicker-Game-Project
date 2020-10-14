void tactile(float x, float y, float w, float h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    fill(yellow);
  } else {
    fill(white);
  }
}

void tactileCircle(float x, float y, float r) {
  if (dist(x, y, mouseX, mouseY) < r/2) {
    fill(purple);
  } else {
    fill(white);
  }
}

void tactileSlider(float x, float y, float r) {
  if (dist(x, y, mouseX, mouseY) < r/2) {
    fill(white);
  } else if (sliderY >= 680 && sliderY < 800) {
    fill(green);
  } else if (sliderY >= 800 && sliderY < 900) {
    fill(yellow);
  } else if (sliderY >= 900 && sliderY < 1000) {
    fill(orange);
  } else if (sliderY >= 1000 && sliderY < 1120) {
    fill(red);
  }
}

void Quit() {
  GG.pause();
  GG.rewind();
  nyan.pause();
  nyan.rewind();
  nyanX = -198;
  nyanCounter = 0;
  score = 0;
  Rscore = nf(score, 0, 3);
  lives = 4;
  ballX = 500;
  ballVX = 1;
  ballY = 700;
  ballVY = 1;
  mode = INTRO;
    if (diff == EASY) {
      P1.play();
      P1.setGain(BGVolume-20);
      P2.pause();
      P3.pause();
      P4.pause();
      P2.rewind();
      P3.rewind();
      P4.rewind();
  } else if (diff == NOR) {
      P2.play();
      P2.setGain(BGVolume-30); 
      P1.pause();
      P3.pause();
      P4.pause();
      P1.rewind();
      P3.rewind();
      P4.rewind();
  } else if (diff == HARD) {
      P3.play();
      P3.setGain(BGVolume-30); 
      P1.pause();
      P2.pause();
      P4.pause();
      P1.rewind();
      P2.rewind();
      P4.rewind();
  } else if (diff == HELL) {
      P4.play();
      P4.setGain(BGVolume-30);
      P1.pause();
      P2.pause();
      P3.pause();
      P1.rewind();
      P2.rewind();
      P3.rewind();
  }
}
