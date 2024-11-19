boolean spin;
float t = 0;


void setup()
{
  size(400, 400);
}

void draw()
{
  noCursor();
  background(10);
  rectMode(CENTER);
  ellipseMode(CENTER);
  
  fill(255);
  rect(200, 200, 300, 300);
  
  strokeWeight(height+width);
  fill(255, 100);
  stroke(0);
  ellipse(mouseX, mouseY, 700, 700);
  noStroke();
  fill(110, 100);
  triangle(mouseX - 50, mouseY, mouseX + 50, mouseY, map(mouseX, 0, width, 110, 290), map(mouseY, 0, width, 220, 400));
  arc(mouseX, mouseY, 100, 100, PI, PI*2);
  
  if (spin & t < 100)
  {
  fill(200, 200, 100);
  arc(map(mouseX, 0, width, 105, 295), map(mouseY, 0, width, 210, 395), 100, 100, (frameCount*0.1) * PI - PI, (frameCount*0.1)*PI);
  }
  t++;

  strokeWeight(1);
  fill(100);
  stroke(0);
  ellipse(map(mouseX, 0, width, 105, 295), map(mouseY, 0, width, 210, 395), 50, 50);
  ellipse(map(mouseX, 0, width, 110, 290), map(mouseY, 0, width, 220, 395), 50, 50);
  
  fill(110);
  strokeWeight(30);
  stroke(120);
  line (map(mouseX, 0, width, 110, 290), map(mouseY, 0, width, 220, 400), map(mouseX, 0, width, 150, 250), map(mouseY, 0, width, 300, 400));
  
  /*strokeWeight(50);
  stroke(100);
  line (map(mouseX, 0, width, 90, 310), map(mouseY, 0, width, 200, 420), map(mouseX, 0, width, 80, 320), map(mouseY, 0, width, 230, 470));*/
  
  noStroke();
  fill(100);
  ellipse (map(mouseX, 0, width, 150, 250), map(mouseY, 0, width, 300, 400), 30, 30);
  
  
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
