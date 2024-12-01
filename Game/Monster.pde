class Monster
{
  PVector position;
  PImage monster[];

  void display()
  {
    imageMode(CENTER);
    monster = new PImage[3];
    monster[1] = loadImage("monster_fullsmile.png");
    position = new PVector (mouseX, mouseY);

    if (isChased)
    {
      translate(mouseX, mouseY);
      scale(0.5, 0.5);
      image(monster[1], 0, 0);
      
      if (flFrames == 4)
      {
        flicker = random(0.5,1.5);
        flFrames = 0;
      }
    }
  }
}
