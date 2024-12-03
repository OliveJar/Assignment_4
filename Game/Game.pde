boolean spin;
Rooms room1;
float distance;
Animation animation;
Monster monster;
gameOver GameOver;
boolean gameStart = false;
boolean doorPressed;
boolean flash = true;
float soundDelay = 20;
float menuDelay = 20;
float s;
float dSize;
boolean menu;
int room = 1;
boolean isChased = false;
float flicker = 1;
int flFrames;
float chase;
float monsterDelay;
float monsterTimer = 200;
PFont basic;
boolean isGameOver = false;
boolean isGameWon;
float JumpscareTimer = 100;
float Opacity = 255;

PImage menuScreen;
PImage start;

import processing.sound.*;

SoundFile clickOn;
SoundFile clickOff;
SoundFile Screach;

void setup()
{
  size(1200, 1200);
  frameRate(60);
}

void draw()
{
  background(10);
  rectMode(CENTER);
  ellipseMode(CENTER);
  imageMode(CENTER);

  basic = createFont("Heavitas.ttf", 40);
  textFont(basic);
  
  menuScreen = new PImage();
  menuScreen = loadImage("Menu Screen.png");
  start = new PImage();
  start = loadImage("Start Screen.png");

  //Create Room, Monster, and load sound
  room1 = new Rooms();
  room1.display();
  GameOver = new gameOver();
  animation = new Animation();
  monster = new Monster();
  clickOn = new SoundFile(this, "clickOn.mp3");
  clickOff = new SoundFile(this, "clickOff.mp3");
  Screach = new SoundFile(this, "Screach.mp3");
  
  soundDelay--;
  monsterDelay = (frameCount*0.1)%20;
  
  if (isGameOver)
    {
      JumpscareTimer--;
    }
  
  GameOver.display();

  if (!gameStart && !menu)
  {
    cursor();
    pushMatrix();
    image(start, 600, 530);
    popMatrix();

  }

  if (menu && !gameStart)
  {
    cursor();
    pushMatrix();
    image(menuScreen, 600, 530);
    popMatrix();
    

    menuDelay--;
  }

  if (gameStart && !isGameOver)
  {
    noCursor();
    if (monsterDelay == 0)
    {
      chase = random(0, 5);
    }
    
    //Triangle/Light refraction of flashlight
    noStroke();
    fill(20, 100*flicker);
    triangle(mouseX - 250, mouseY, map(mouseX, 0, width, 330, 870), map(mouseY, 0, width, 740, 1200), 0, 1200);
    triangle(mouseX + 250, mouseY, map(mouseX, 0, width, 330, 870), map(mouseY, 0, width, 740, 1200), 1200, 1200);

    //Darkness
    strokeWeight(height+width);
    fill(255, 100*flicker);
    stroke(0);
    ellipse(mouseX, mouseY, 1900, 1900);

    //Triangle/Light refraction of flashlight
    noStroke();
    fill(110, 100*flicker);
    triangle(mouseX - 250, mouseY, mouseX + 250, mouseY, map(mouseX, 0, width, 330, 870), map(mouseY, 0, width, 740, 1200));
    arc(mouseX, mouseY, 500, 500, PI, PI*2);
    strokeWeight(50);
    noFill();
    stroke(0, 100*flicker);
    ellipse(mouseX, mouseY, 450, 450);

    //On and Off
    if (flash)
    {
      fill(0);
      rect(600, 600, width, height);
    }
      
     if(chase > 3)
     {
       flFrames++;
       isChased = true;
     }
     if(chase < 1)
     {
       isChased = false;
     }
     if (isChased)
     {
       pushMatrix();
       monster.display();
       popMatrix();
     }
     if(!isChased)
     {
       monsterTimer = 200;
     }
     println(chase);

    //Flashlight tip
    strokeWeight(1.5);
    fill(100);
    stroke(0);
    ellipse(map(mouseX, 0, width, 325, 875), map(mouseY, 0, width, 700, 1190), 75, 75);
    noStroke();
    ellipse(map(mouseX, 0, width, 333, 865), map(mouseY, 0, width, 715, 1190), 75, 75);
    ellipse(map(mouseX, 0, width, 342, 855), map(mouseY, 0, width, 730, 1190), 75, 75);
    stroke(0);
    ellipse(map(mouseX, 0, width, 350, 850), map(mouseY, 0, width, 740, 1190), 75, 75);

    //Handle
    fill(110);
    strokeWeight(45);
    stroke(120);
    line (map(mouseX, 0, width, 350, 850), map(mouseY, 0, width, 740, 1200), map(mouseX, 0, width, 450, 750), map(mouseY, 0, width, 900, 1200));

    noStroke();
    fill(100);
    ellipse (map(mouseX, 0, width, 450, 750), map(mouseY, 0, width, 900, 1200), 45, 45);
    
    //-----------------------------------------------------------------------------------------------------------//
    
    if (isChased && !flash)
    {
      monsterTimer--;
    }
    if(monsterTimer <= 1)
    {
      flash = true;
      println("GameOver");
      isGameOver = true;
    }
    
  }

  if (distance <= -495)
  {
    fill(255, 100);
    text("Open", 600, 600);
  }

  if (doorPressed)
  {
    flash = true;
    animation.display();
    s += 3;

    if (s >= 300)
    {
      s = 0;
      doorPressed = false;
      distance = 0;
      flash = false;
      clickOn.play();
      soundDelay = 30;
    } else if (s >= 250)
    {
      dSize *= 1.5;
    } else if (s >= 200)
    {
      dSize++;
    }
  }
}

void mousePressed()
{

  if (!gameStart)
  {
    menu = true;
  }

  if (mouseX > 150 && mouseX < 740 && mouseY > 320 && mouseY < 980 && distance <= -495)
  {
    doorPressed = true;
    clickOff.play();
    soundDelay = 30;
  }

  if (menu && mouseX >= 450 && mouseX <= 750 && mouseY >= 865 && mouseY <= 965 && menuDelay <= 0 && !gameStart)
  {
    gameStart = true;

    //Turn on flashlight
    flash = false;
    clickOn.play();
    soundDelay = 20;
  }
}
void keyPressed()
{
  if (key == 'w' && gameStart && !flash)
  {
    distance -= 2;
  }
  if (key == 's' && gameStart)
  {
    distance += 2;
  }

  if (key == 'e' && !flash && soundDelay <= 0 && gameStart && !isGameOver)
  {
    flash = true;
    clickOff.play();
    soundDelay = 20;
  } else if (key == 'e' && flash && soundDelay <= 0 && gameStart)
  {
    flash = false;
    clickOn.play();
    soundDelay = 30;
  }
}
