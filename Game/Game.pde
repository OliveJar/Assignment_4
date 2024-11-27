boolean spin;
float t = 0;


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
  
  fill(255);
  rect(600, 600, 600, 900);
  
  //Darkness
  strokeWeight(height+width);
  fill(255, 100);
  stroke(0);
  ellipse(mouseX, mouseY, 2100, 2100);
  
  //Triangle/Light refraction of flashlight
  noStroke();
  fill(110, 100);
  triangle(mouseX - 150, mouseY, mouseX + 150, mouseY, map(mouseX, 0, width, 330, 870), map(mouseY, 0, width, 740, 1200));
  arc(mouseX, mouseY, 300, 300, PI, PI*2);
  
  //Reload animation
  if (spin & t < 100)
  {
    //reload animation placeholder
  fill(200, 200, 100);
  arc(map(mouseX, 0, width, 315, 885), map(mouseY, 0, width, 630, 1185), 300, 300, (frameCount*0.1) * PI - PI, (frameCount*0.1)*PI);
  }
  t++;

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
  
  /*strokeWeight(50);
  stroke(100);
  line (map(mouseX, 0, width, 90, 310), map(mouseY, 0, width, 200, 420), map(mouseX, 0, width, 80, 320), map(mouseY, 0, width, 230, 470));*/
  
  noStroke();
  fill(100);
  ellipse (map(mouseX, 0, width, 450, 750), map(mouseY, 0, width, 900, 1200), 45, 45);
  
  
  /*noStroke();
  fill(100);
  strokeWeight(1);
  translate(map(mouseX, 0, width, 110, 290), map(mouseY, 0, width, 220, 400));
  rotate(map(mouseX, 0, width, 0.5, -0.5) * map(-mouseY, 0, width, -0.9, 0.9));
  rect(0, 0, 40, 30);*/
}


void mousePressed()
{
  spin = true;
  t = 0;
}
