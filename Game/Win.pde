class win
{
  PImage Win;
  
  void display()
  {
    Win = new PImage();
    Win = loadImage("Win Screen.png");
    image(Win, 600, 530);
    fill(80, 150, 0);
    rect(600, 1130, width, 140);
  }
}
