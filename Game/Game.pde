boolean spin;
Rooms room1;
float distance;
Animation animation;
Monster monster;
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


import processing.sound.*;

SoundFile clickOn;
SoundFile clickOff;

void setup()
{
  size(1200, 1200);
}

void draw()
{
  noCursor();
  background(10);
  rectMode(CENTER);
  ellipseMode(CENTER);

  //Create Room, Monster, and load sound
  room1 = new Rooms();
  room1.display();
  animation = new Animation();
  monster = new Monster();
  clickOn = new SoundFile(this, "clickOn.mp3");
  clickOff = new SoundFile(this, "clickOff.mp3");
  soundDelay--;
  monsterDelay = (frameCount*0.1)%20;

  if (!gameStart && !menu)
  {
    cursor();
    textSize(60);
    fill(255);
    text("A 3D Horror Game", 390, 376);
    fill(255, 20, 0);
    text("A 3D Horror Game", 390, 380);
    fill(255);
    text("Click anywhere to start", 330, 1004);
    fill(255, 20, 0);
    text("Click anywhere to start", 330, 1000);
    //println(mouseX, mouseY);
  }

  if (menu && !gameStart)
  {
    cursor();
    fill(255);
    text("and left-click to interact", 300, 270);
    fill(255, 20, 0);
    text("Use 'w' and 's' to walk", 330, 200);

    fill(255, 20, 0);
    text("When you see the monster", 280, 1030);
    fill(255);
    text("Use 'e' to turn off your flashlight", 210, 1130);

    fill(10, 255, 0);
    rect(600, 900, 300, 100);
    fill(0);
    text("Play", 550, 920);

    menuDelay--;
  }

  if (gameStart)
  {
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
      //animation.display();
      //reload animation placeholder
      fill(0);
      rect(600, 600, width, height);
      //fill(0, 0);
      //stroke(100, 255, 10);
      //arc(map(mouseX, 0, width, 315, 885), map(mouseY, 0, width, 630, 1185), 200, 200, (frameCount*0.1) * PI - PI, (frameCount*0.1)*PI);
    }
      
     if(chase > 3)
     {
       flFrames++;
       monsterTimer = 200;
       isChased = true;
     }
     if(chase < 1)
     {
       isChased = false;
       monsterTimer = 200;
     }
     if (isChased)
     {
       pushMatrix();
       monster.display();
       popMatrix();
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
    }
    
  }

  if (distance <= -495)
  {
    fill(255, 100);
    text("Open", 600, 600);
  }

  if (doorPressed)
  {
    animation.display();
    s++;

    if (s >= 300)
    {
      s = 0;
      doorPressed = false;
      distance = 0;
    } else if (s >= 250)
    {
      dSize *= 1.2;
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
    clickOn.play();
    soundDelay = 30;
  }

  if (menu && mouseX >= 450 && mouseX <= 750 && mouseY >= 800 && mouseY <= 1000 && menuDelay <= 0 && !gameStart)
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
  if (key == 'w' && gameStart)
  {
    distance -= 2;
  }
  if (key == 's' && gameStart)
  {
    distance += 2;
  }

  if (key == 'e' && !flash && soundDelay <= 0 && gameStart)
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
