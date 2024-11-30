class Rooms
{
  float doorDistance;
  int roomNumber = 1;

  void display()
  {
    doorDistance = constrain(distance, -500, 200);
    distance = doorDistance;
    rectMode(CENTER);

    if (roomNumber == 1)
    {
      fill(255);
      quad(0, 0, 600, 700, 600, 700, 0, 1200);
      quad(1200, 0, 600, 700, 600, 700, 1200, 1200);
      fill(180);
      rect(600, 683 + (doorDistance*0.08), 200 - doorDistance, 205 - doorDistance);
      fill(100);
      rect(600, 695 + (doorDistance*0.08), 85 - doorDistance*0.4, 180 - doorDistance);
      fill(0);
      ellipse(625 - (doorDistance*0.1), 700, 10 - (doorDistance*0.08), 10 - (doorDistance*0.08));
    }

    if (roomNumber == 2 && s >= 250)
    {
      fill(255);
      quad(0, 0, 600, 700, 600, 700, 0, 1200);
      quad(1200, 0, 600, 700, 600, 700, 1200, 1200);
      fill(180);
      rect(600, 683 + (doorDistance*0.08), 200 - doorDistance, 205 - doorDistance);
      fill(100);
      rect(600, 695 + (doorDistance*0.08), 85 - doorDistance*0.4, 180 - doorDistance);
      fill(0);
      ellipse(625 - (doorDistance*0.1), 700, 10 - (doorDistance*0.08), 10 - (doorDistance*0.08));
    }
  }
}
