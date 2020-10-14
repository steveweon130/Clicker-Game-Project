void option() {
  background(bg);
  
  //Return to Intro Button
  stroke(black);
  strokeWeight(5);
  fill(white);
  tactile(775, 30, 200, 100);
  rect(775, 30, 200, 100);
  fill(black);
  textFont(arialBoldSmall);
  text("Return", 875, 75);
  
  //Title
  stroke(black);
  strokeWeight(5);
  fill(white);
  rect(250, 30, 500, 100);
  fill(black);
  textFont(arialBoldBig);
  text("OPTIONS", 500, 70);

  //Difficulty Explanation
  textFont(arialBoldSmall);
  textAlign(LEFT, LEFT);
  text("DIFICULTY:", 25, 225);
  textFont(arial);
  text("Harder the game, faster the target gets", 25, 275);
  textAlign(CENTER, CENTER);

  //Easy
  fill(white);
  if (diff == EASY) {
    stroke(green);
    strokeWeight(10);
  } else {
    stroke(black);
    strokeWeight(5);
  }
  tactileCircle(125, 400, 200);
  circle(125, 400, 200);
  image(Easy, 130, 390, 150, 150);
  if (diff == EASY) {
    fill(green);
    textFont(arialBoldSmall); 
  } else {
    fill(black);
    textFont(arial);
  }
  text("Easy", 135, 535);

  //Normal
  fill(white);
  if (diff == NOR) {
    stroke(yellow);
    strokeWeight(10);
  } else {
    stroke(black);
    strokeWeight(5);
  }
  tactileCircle(375, 400, 200);
  circle(375, 400, 200);
  image(Normal, 375, 400, 150, 150);
  if (diff == NOR) {
    fill(yellow);
    textFont(arialBoldSmall);
  } else {
    fill(black);
    textFont(arial);
  }
  text("Normal", 385, 535);

  //Hard
  fill(white);
  if (diff == HARD) {
    stroke(orange);
    strokeWeight(10);
  } else {
    stroke(black);
    strokeWeight(5);
  }
  tactileCircle(625, 400, 200);
  circle(625, 400, 200);
  image(Hard, 625, 400, 150, 150);
  if (diff == HARD) {
    fill(orange);
    textFont(arialBoldSmall);
  } else { 
    fill(black);
    textFont(arial);
  }
  text("Hard", 635, 535);

  //Hell
  fill(white);
  if (diff == HELL) {
    stroke(red);
    strokeWeight(10);
  } else {
    stroke(black);
    strokeWeight(5);
  }
  tactileCircle(875, 400, 200);
  circle(875, 400, 200);
  image(Hell, 875, 400, 150, 150);
  if (diff == HELL) {
    fill(red); 
    textFont(arialBoldSmall);
  } else {
    fill(black); 
    textFont(arial);
  }
  text("Hell", 885, 535);

  //Size Explanation
  fill(black);
  textAlign(LEFT, LEFT);
  textFont(arialBoldSmall);
  text("TARGET SIZE", 25, 650);
  textAlign(CENTER, CENTER);

  //Size Slider
  strokeWeight(6);
  stroke(green);
  line(100, 700, 100, 800);
  stroke(yellow);
  line(100, 800, 100, 900);
  stroke(orange);
  line(100, 900, 100, 1000);
  stroke(red);
  line(100, 1000, 100, 1100);
  stroke(black);
  tactileSlider(100, sliderY, 40);
  circle(100, sliderY, 40);
  
  //Size Difficulty Indicator
  fill(black);
  text("Size Difficulty:", 350, 700);
  text(RscoreMulti + " points/click", 350, 825);
  if (sliderY >= 680 && sliderY < 800) {
    fill(green);
    text("EASY", 350, 762.5);
  } else if (sliderY >= 800 && sliderY < 900) {
    fill(yellow);
    text("NORMAL", 350, 762.5);
  } else if (sliderY >= 900 && sliderY < 1000) {
    fill(orange);
    text("HARD", 350, 762.5);
  } else if (sliderY >= 1000 && sliderY < 1120) {
    fill(red);
    text("HELL", 350, 762.5);
  }
  
  //Size Indicator
  strokeWeight(10);
  fill(white);
  if (diff == EASY) stroke(green);
  else if (diff == NOR) stroke(yellow);
  else if (diff == HARD) stroke(orange);
  else if (diff == HELL) stroke(red);
  circle(350, 1000, size);
  
  //Background Volume Slider
  stroke(black);
  strokeWeight(6);
  line(700, 700, 700, 1100);
  tactileCircle(700, BGVolumeSliderY, 40);
  circle(700, BGVolumeSliderY, 40);
  fill(black);
  textSize(30);
  text("Background", 700, 620);
  text("Volume", 700, 660);
  
  //Game Volume Slide
  line(900, 700, 900, 1100);
  tactileCircle(900, GVolumeSliderY, 40);
  circle(900, GVolumeSliderY, 40);
  fill(black);
  text("Game", 900, 620);
  text("Volume", 900, 660);
  textSize(50);
  
  //Game Sond Test Button
  stroke(black);
  strokeWeight(5);
  fill(white);
  tactile(825, 1127.5, 150, 65);
  rect(825, 1127.5, 150, 65);
  fill(black);
  text("TEST", 900, 1155);
}

void optionClicks() {
  //Return Button Clicked
  if (mouseX > 775 && mouseX < 975 && mouseY > 30 && mouseY < 130) {
    mode = INTRO;
  }

  //Difficulty Buttons Clicked
  if (dist(125, 400, mouseX, mouseY) < 100) diff = EASY;
  if (dist(375, 400, mouseX, mouseY) < 100) diff = NOR;
  if (dist(625, 400, mouseX, mouseY) < 100) diff = HARD;
  if (dist(875, 400, mouseX, mouseY) < 100) diff = HELL;

  //Size Slider Control
  controlSliderY();
  
  //Background Volume Slider Control 
  controlBGVolumeSliderY();
  
  //Game Volume Slider Control
  controlGVolumeSliderY();
  
  //Game Sound Test Clicked
  if (mouseX > 825 && mouseX <975 && mouseY > 1127.5 && mouseY < 1192.5) {
    bump.setGain(GVolume-30);
    bump.play();
    bump.rewind();
  }
}

void controlSliderY() { //Size Slider Control
  if (mouseX >= 90 && mouseX <= 110 && mouseY >= 700 && mouseY <= 1100) {
    sliderY = mouseY;
    sliderYon = true;
  } else {
    sliderYon = false;
  }
  size = map(sliderY, 700, 1100, 250, 50);
  scoreMulti = map(sliderY, 700, 1100, 1, 10);
  RscoreMulti = nf(scoreMulti, 0, 3);
}

void controlBGVolumeSliderY() { //Background Volume Slider Control
   if (mouseX >= 680 && mouseX <= 720 && mouseY > 700 && mouseY <= 1100) {
    BGVolumeSliderY = mouseY;
    BGVolumeSliderYon = true;
  } else {
    BGVolumeSliderYon = false;
  }
  BGVolume = map(BGVolumeSliderY, 700, 1100, 50, -50);
}

void controlGVolumeSliderY() { //Game Volume Slider Control
   if (mouseX >= 880 && mouseX <= 920 && mouseY > 700 && mouseY <= 1100) {
    GVolumeSliderY = mouseY;
    GVolumeSliderYon = true;
  } else {
    GVolumeSliderYon = false;
  }
  GVolume = map(GVolumeSliderY, 700, 1100, 50, -50);
}

void mouseDragged() {
  if (sliderYon == true) {
    controlSliderY();
  }
  
  if (BGVolumeSliderYon == true) {
    controlBGVolumeSliderY();
  }
  
  if (GVolumeSliderYon == true) {
    controlGVolumeSliderY();
  }
}
