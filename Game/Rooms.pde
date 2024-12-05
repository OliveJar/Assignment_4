class Rooms
{
  float doorDistance;
  int roomNumber;
  PImage hand;
  PImage blood;

  void display()
  {
    doorDistance = constrain(distance, -500, 100);
    distance = doorDistance;
    rectMode(CENTER);
    roomNumber = room;
    imageMode(CENTER);
    hand = new PImage();
    hand = loadImage("BloodyHand.png");
    blood = new PImage();
    blood = loadImage("BloodDrop.png");

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
      
      if (gameStart)
      {
      //Arrow
      strokeWeight(20 - (doorDistance*0.1));
      stroke(255, 0, 0);
      line(20 + (doorDistance*0.5), 890, 480 + (doorDistance*0.6), 690);
      line(480 + (doorDistance*0.6), 690, 400 + (doorDistance*0.7), 620 + (doorDistance*0.5));
      line(480 + (doorDistance*0.6), 690, 420 + (doorDistance*0.7), 800 - (doorDistance*0.5));
      
      line(1180 - (doorDistance*0.5), 890, 720 - (doorDistance*0.6), 690);
      line(720 - (doorDistance*0.6), 690, 800 - (doorDistance*0.7), 620 + (doorDistance*0.5));
      line(720 - (doorDistance*0.6), 690, 780 - (doorDistance*0.7), 800 - (doorDistance*0.5));
      pushMatrix();
      translate(610 - (doorDistance*0.03), 683 + (doorDistance*0.1));
      scale(0.1 - (doorDistance*0.0008), 0.1 - (doorDistance*0.0008));
      image(hand, 0, 0);
      popMatrix();
      }
      noStroke();
      
    }

    if (roomNumber == 2)
    {
      fill(255, 10, 10);
      rect(600, 350, 1200, 700);
      fill(100, 0, 0);
      quad(0, 0, 600, 700, 600, 700, 0, 1200);
      quad(1200, 0, 600, 700, 600, 700, 1200, 1200);
      fill(180);
      rect(600, 683 + (doorDistance*0.08), 200 - doorDistance, 205 - doorDistance);
      fill(100);
      rect(600, 695 + (doorDistance*0.08), 85 - doorDistance*0.4, 180 - doorDistance);
      fill(0);
      ellipse(625 - (doorDistance*0.1), 700, 10 - (doorDistance*0.08), 10 - (doorDistance*0.08));
      
      fill(255, 0, 0);
      ellipse(acceleration.x, acceleration.y, 10, 10);

    }

    if (roomNumber == 3)
    {
      fill(255);
      quad(0, 0, 600, 700, 600, 700, 0, 1200);
      quad(1200, 0, 600, 700, 600, 700, 1200, 1200);
      
      strokeWeight(50 - (doorDistance*0.1));
      stroke(255, 0, 0);
      line(600, 1200, 600, 600);

      noStroke();
      fill(180);
      rect(600, 683 + (doorDistance*0.08), 200 - doorDistance, 205 - doorDistance);
      fill(100);
      rect(600, 695 + (doorDistance*0.08), 85 - doorDistance*0.4, 180 - doorDistance);
      fill(0);
      ellipse(625 - (doorDistance*0.1), 700, 10 - (doorDistance*0.08), 10 - (doorDistance*0.08));
      
    }
    if (roomNumber == 4)
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
      
      fill(10, 255, 10);
      rect(600, 583 + (doorDistance*1.2), 150 - (doorDistance*0.1), 75 - (doorDistance*0.05));
      fill(0);
      text("Exit", 550, 593 + (doorDistance*1.2));
    }
  }
}
