void NormalGame() {
  background(125);
  
  //Normal Ball
  fill(255);
  stroke(yellow);
  strokeWeight(10);
  tactileCircle(ballX, ballY, size);
  ellipse(ballX, ballY, size, size);
  image(Normal, ballX, ballY, size*.75, size*.75);
}

void NormalGameClicks() {
  if (dist(mouseX, mouseY, ballX, ballY) < 5 + size/2) {
    score = score + 1*scoreMulti;
    Rscore = nf(score, 0, 3);
    ballVX = ballVX* 1.1;
    ballVY = ballVY* 1.1;
    coin.play();
    coin.setGain(GVolume-20);
    coin.rewind();
  } else if (mouseX > 25 && mouseX < 125 && mouseY > 25 && mouseY < 125) {
    mode = PAUSE;
   
  } else if (mouseX > nyanX && mouseX < nyanX+198 && mouseY > nyanY && mouseY < nyanY+120) { //Nyan Cat Catch Bonus
    lives = lives + 1;
    lifeUp.play();
    lifeUp.setGain(GVolume-20);
    lifeUp.rewind();
  } else if (mouseY > 200) {
    lives = lives - 1;
    denied.play();
    denied.setGain(GVolume-20);
    denied.rewind();
    if (lives == -1) mode = GAMEOVER;
  }
}
