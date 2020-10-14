void pause() {
  background(255,255,255,70);
  textFont(arialBoldBig);
  text("PAUSED", width/2, 500);
  
  //Resume Button
  stroke(black);
  strokeWeight(5);
  fill(white);
  tactile(350, 650, 100, 100);
  rect(350, 650, 100, 100);
  fill(black);
  triangle(370, 670, 370, 730, 430, 700);
  
  //Quit Button
  fill(white);
  tactile(550, 650, 100, 100);
  rect(550, 650, 100, 100);
  fill(black);
  textFont(arialBoldSmall);
  text("Quit", 600, 700);
}

void pauseClicks() {
  if (mouseX > 350 && mouseX < 450 && mouseY > 650 && mouseY < 750) {
    mode = GAME;
  }
  
  if (mouseX > 550 && mouseX < 650 && mouseY > 650 && mouseY < 750) {
    Quit();
  }
}
