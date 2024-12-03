class gameOver
{
  PVector jumpscare;
  PImage monster[];
  void display()
  {
    
    if (isGameOver)
    {
      fill(100);
      rect(600, 600, width, height);
    }
    
    if (isGameOver && JumpscareTimer>0)
    {
      imageMode(CENTER);
      rectMode(CENTER);
      monster = new PImage[3];
      monster[1] = loadImage("monster_fullsmile.png");
      jumpscare = new PVector (0.5, 0.5);
      fill(255, 10, 10);
      if (JumpscareTimer < 100)
    {
      Opacity -= 2.5;
      fill(255, 10, 10, Opacity);
    }
      rect(600, 600, width, height);
      translate(600, 600);
      scale((sin(frameCount*0.4))+1.5, (sin(frameCount*0.4))+1.5);
      Screach.play();
      rotate(sin(frameCount*0.2));
      image(monster[1], 0, 0);
    }
  }
}
