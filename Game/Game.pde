boolean spin;
Rooms room1;
float distance;
Animation animation;
Monster monster;
gameOver GameOver;
win winState;
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
float JumpscareTimer = 50;
float Opacity = 255;
boolean escaped = false;
float x = 600;
float y = 1;
PVector acceleration;

PImage menuScreen;
PImage start;

import processing.sound.*;

//Load sound
SoundFile clickOn;
SoundFile clickOff;
SoundFile Screach;
SoundFile Background;
SoundFile Door;

void setup()
{
  size(1200, 1200);
  frameRate(60);

  Background = new SoundFile(this, "Background Music.mp3");
  Background.play();
}

void draw()
{
  background(10);
  rectMode(CENTER);
  ellipseMode(CENTER);
  imageMode(CENTER);

  //acceleration of blood drop in room 2
  y = (y*1.3)%height;
  acceleration = new PVector(x, y);
  if (y > 1100)
  {
    x = random(mouseX-250, mouseX+250);
  }

  //font
  basic = createFont("Heavitas.ttf", 40);
  textFont(basic);

  //load menu and start screen images
  menuScreen = new PImage();
  menuScreen = loadImage("Menu Screen.png");
  start = new PImage();
  start = loadImage("Start Screen.png");

  //Create Room, Monster and sound
  room1 = new Rooms();
  winState = new win();
  room1.display();
  GameOver = new gameOver();
  animation = new Animation();
  monster = new Monster();
  clickOn = new SoundFile(this, "clickOn.mp3");
  clickOff = new SoundFile(this, "clickOff.mp3");
  Screach = new SoundFile(this, "Screach.mp3");
  Door = new SoundFile(this, "Door.mp3");

  //delay for flashlight and monster agro tick
  soundDelay--;
  monsterDelay = (frameCount*0.2)%20;

  //loop background music
  if (!(Background.isPlaying()))
  {
    Background.play();
  }

  //checks to see if the game is over
  if (isGameOver)
  {
    cursor();
    JumpscareTimer--;
  }

  //updates game over screen
  GameOver.display();

  //displays start screen
  if (!gameStart && !menu)
  {
    cursor();
    pushMatrix();
    image(start, 600, 530);
    popMatrix();
  }

  //displays menu screen
  if (menu && !gameStart)
  {
    cursor();
    pushMatrix();
    image(menuScreen, 600, 530);
    popMatrix();


    menuDelay--;
  }

  //checks to see if game has started
  if (gameStart && !isGameOver)
  {
    noCursor();
    //temporarily stops monster agro timer when opening doors
    if (monsterDelay == 0 && !doorPressed)
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

    //evrytime monster agro ticks randomize chance of monster chasing player and if its inside a cerain rance chase player or stop chasing player
    if (chase >= 3)
    {
      flFrames++;
      isChased = true;
    }
    if (chase < 3)
    {
      isChased = false;
    }
    if (isChased)
    {
      pushMatrix();
      monster.display();
      popMatrix();
    }
    if (!isChased)
    {
      flicker = 1;
      monsterTimer = 70;
    }
    //println(chase);

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

    //Flashlight handle
    fill(110);
    strokeWeight(45);
    stroke(120);
    line (map(mouseX, 0, width, 350, 850), map(mouseY, 0, width, 740, 1200), map(mouseX, 0, width, 450, 750), map(mouseY, 0, width, 900, 1200));
    noStroke();
    fill(100);
    ellipse (map(mouseX, 0, width, 450, 750), map(mouseY, 0, width, 900, 1200), 45, 45);

    //-----------------------------------------------------------------------------------------------------------//

    //when the player is being chased with their flashlight on decrease the monster timer which when it hits zero the player loses
    if (isChased && !flash)
    {
      monsterTimer--;
    }
    if (monsterTimer <= 1)
    {
      flash = true;
      println("GameOver");
      isGameOver = true;
    }
  }

  //Measures the distance the player is from the door and if the player enteres a certain range from the door the player is able to open it
  if (distance <= -495)
  {
    fill(255, 100);
    text("Open", 600, 600);
  }

  //Checks to see if the player has won, if they did then display the win screen
  if (escaped)
  {
    winState.display();
  }

  //if the door is indeed opened by the player within the acceptable range, play the door oppening animation, turn off flashlight, reset distance from door, go to the next room, show the next room and turn flashlight on again.
  if (doorPressed)
  {
    flash = true;
    animation.display();
    s += 6;

    if (s >= 300)
    {
      dSize = 1;
      s = 1;
      doorPressed = false;
      distance = 0;
      flash = false;
      clickOn.play();
      soundDelay = 30;
      room++;
    } else if (s >= 200)
    {
      dSize *= 1.5;
    } else if (s >= 150)
    {
      dSize++;
    }
  }
  if (room == 5)
  {
    escaped = true;
    cursor();
  }
}

void mousePressed()
{
  //when player clicks on start screen proceed to the menu screen
  if (!gameStart)
  {
    menu = true;
  }

  //-------------resets the game if player clicks on play again, on the lose screen and win screen
  if (isGameOver && mouseX > 450 && mouseY > 620 && mouseX < 750 && mouseY < 720)
  {
    isGameOver = false;
    room1.roomNumber = 1;
    gameStart = false;
    menu = false;
    JumpscareTimer = 100;
  }

  if (escaped && mouseX > 450 && mouseY > 620 && mouseX < 750 && mouseY < 720)
  {
    escaped = false;
    room1.roomNumber = 1;
    gameStart = false;
    menu = false;
    JumpscareTimer = 100;
  }
  //-------------

  //Checks to see if the player clicked within the door dimensions/parameters
  if (mouseX > 150 && mouseX < 740 && mouseY > 320 && mouseY < 980 && distance <= -495)
  {
    doorPressed = true;
    Door.play();
    clickOff.play();
    soundDelay = 30;
  }

  //checks to see if player clicked play on the menu screen, if yes then take them to the first room and turn on their flashlight
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
  //Movement keys
  if (key == 'w' && gameStart && !flash)
  {
    distance -= 2;
  }
  if (key == 's' && gameStart)
  {
    distance += 2;
  }

  //-------Flashlight key
  //off
  if (key == 'e' && !flash && soundDelay <= 0 && gameStart && !isGameOver)
  {
    flash = true;
    clickOff.play();
    soundDelay = 20;
  }
  //on
  else if (key == 'e' && flash && soundDelay <= 0 && gameStart)
  {
    flash = false;
    clickOn.play();
    soundDelay = 30;
  }
  //-------- yes its "reversed" I only noticed this once I nearly finished coding the light however and refused to correct it because I knew which was which
}
