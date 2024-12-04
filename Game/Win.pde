class win
{
  PImage Win;
  
  void display()
  {
    Win = new PImage();
    Win = loadImage("Win Screen.png");
    image(Win, 600, 530);
  }
}
