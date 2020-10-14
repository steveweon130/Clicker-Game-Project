// Steve Weon
// 1-2a
// October 9, 2020 ~ Oct, 13, 2020
// Clicker Game Project

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//MODE VARIABLES
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
final int OPTION = 4;
final int HIGHSCORE = 5;

//DIFFICULTY VARIABLE
int diff;
final int EASY = 1;
final int NOR = 2;
final int HARD = 3;
final int HELL = 4;

//TARGET VARIABLES
float size = 150;
float scoreMulti = 5.5;
String RscoreMulti;
float score = 0;
String Rscore;
int lives = 4;
float ballX = 500;
float ballVX = 1;
float ballY = 700;
float ballVY = 1;
float nyanX = -198;
float nyanY = 0;
float nyanCounter = 1;

//IMAGE
PImage Easy, Normal, Hard, Hell;
PImage heart, NyanCat;

//FONT
PFont cursive;
PFont arial;
PFont arialBoldSmall;
PFont arialBoldBig;

//SOUND VARIABLE
Minim minim;
AudioPlayer P1, P2, P3, P4;
AudioPlayer denied, GG, nyan, bump, coin, lifeUp;

//COLOR PALLETE
color bg = #92A8D1;
color black = #000000;
color white = #FFFFFF;
color green = #00FF00;
color yellow = #FFFF00;
color orange = #FF7D00;
color red = #FF0000;
color purple = #FF00FF;

//TITLE SCREEN ANIMATION VARIABLES
float titleX, titleY, titleVX, titleVY;
float titleEasyX, titleEasyY, titleEasyVX, titleEasyVY;
float titleNormalX, titleNormalY, titleNormalVX, titleNormalVY;
float titleHardX, titleHardY, titleHardVX, titleHardVY;
float titleHellX, titleHellY, titleHellVX, titleHellVY;

//OTHER VARIABLES
float sliderY;
boolean sliderYon = false;
float BGVolumeSliderY, GVolumeSliderY;
boolean BGVolumeSliderYon, GVolumeSliderYon = false;
float BGVolume, GVolume;
float EasyHS = 0;
float NormalHS = 0;
float HardHS = 0;
float HellHS = 0;

void setup() {
  size(1000, 1200);
  textAlign(CENTER, CENTER);
  imageMode(CENTER);

  mode = INTRO;
  diff = EASY;
  
  //Images
  Easy = loadImage("Easy.png");
  Normal = loadImage("Normal.png");
  Hard = loadImage("Hard.png");
  Hell = loadImage("Hell.png");
  heart = loadImage("heart.png");
  NyanCat = loadImage("nyan.gif");

  //Fonts
  cursive = createFont("Title.ttf", 100);
  arial = createFont("arial.ttf", 50);
  arialBoldSmall = createFont("arialbd.ttf", 50);
  arialBoldBig = createFont("arialbd.ttf", 100);

  //Minim
  minim = new Minim(this);
  P1 = minim.loadFile("Easy.mp3"); //https://www.youtube.com/watch?v=_dIixq6Y15Q&list=PLJvmvIVC7FtA0YHExWefOKFEf811KRHtd&index=2
  P2 = minim.loadFile("Normal.mp3"); //https://www.youtube.com/watch?v=BkoPRtXUL7E&list=PLJvmvIVC7FtA0YHExWefOKFEf811KRHtd&index=3
  P3 = minim.loadFile("Hard.mp3"); //https://www.youtube.com/watch?v=4ZMB6RhGv6s
  P4 = minim.loadFile("Hell.mp3"); //https://www.youtube.com/watch?v=kS8R7VtpqNI
  bump = minim.loadFile("bump.wav"); //From Mr. Pelletier's demonstration
  coin = minim.loadFile("coin.mp3"); //https://www.youtube.com/watch?v=RfkcI8dhfsQ
  lifeUp = minim.loadFile("1up.mp3"); //https://www.youtube.com/watch?v=LBXvLygvRRA
  denied = minim.loadFile("denied.mp3"); //https://www.youtube.com/watch?v=XBMxskyDk9o&list=PLya__OBTLMkPQwGj-_xlnVb2-F_w_HN5i&index=26
  GG = minim.loadFile("Gameover.mp3"); //https://www.youtube.com/watch?v=rGG13VhjIvE&list=PLya__OBTLMkPQwGj-_xlnVb2-F_w_HN5i&index=90
  nyan = minim.loadFile("nyan.mp3"); //https://www.youtube.com/watch?v=nuCiwJsOAhE
  
  //Target Variables
  ballVX = random(-5, 5);
  ballVY = -random(-5, 5);
  nyanY = random(300, 1100);
  
  //Title Screen Animation Variables
    titleX = 100;
    titleY = 280;
    titleVX = 5;
    titleVY = -5;
    
    titleEasyX = 300;
    titleEasyY = 700;
    titleEasyVX = 5;
    titleEasyVY = -5;
    
    titleNormalX = 500;
    titleNormalY = 900;
    titleNormalVX = 10;
    titleNormalVY = -10;
    
    titleHardX = 400;
    titleHardY = 800;
    titleHardVX = 15;
    titleHardVY = -15;

    titleHellX = 600;
    titleHellY = 600;
    titleHellVX = 20;
    titleHellVY = -20;
    
  //Slider Variables
  sliderY = 900;
  RscoreMulti = nf(scoreMulti, 0, 3);
  Rscore = nf(score, 0, 3);
  BGVolumeSliderY = 900;
  BGVolume = 0;
  GVolumeSliderY = 900;
  GVolume = 0;
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else if (mode == OPTION) {
    option();
  } else if (mode == HIGHSCORE) {
    highscore();
  } else {
    background(white);
    fill(red);
    textSize(50);
    text("Mode Error: Mode is " + mode, width/2, height/2);
  }
  
  //Music
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
