class Monster
{
  PVector position;
  PImage monster[];

  void display()
  {
    //load monster image
    imageMode(CENTER);
    monster = new PImage[3];
    monster[1] = loadImage("monster_fullsmile.png");
    position = new PVector (mouseX, mouseY);

    //make monster image 'lag' behind flashlight to give the player the sense that their being followed
    if (isChased)
    {
      position.x = pmouseX;
      position.y = pmouseY;
      translate(position.x, position.y);
      scale(0.5, 0.5);
      image(monster[1], 0, 0);

      if (flFrames == 2)
      {
        flicker = random(0.5, 1.5);
        flFrames = 0;
      }
    }
  }
}
