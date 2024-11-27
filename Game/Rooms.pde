class Rooms
{
  float doorDistance;

  void display()
  {
    doorDistance = distance;
    
    rectMode(CENTER);
    fill(255);
    quad(0, 0, 500, 500, 500, 950, 0, 1200);
    quad(1200, 0, 700, 500, 700, 950, 1200, 1200);
    fill(180);
    rect(600, 725 - (doorDistance*0.125), 200 + doorDistance, 450 + doorDistance*0.75);
  }
}
