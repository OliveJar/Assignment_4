class Animation {
  float t;
  float z = 0;
  void display()
  {
    if (s >= 1)
    {
      t=s;
    }
    z = dSize;
    rectMode(CENTER);
    fill(10);
    rect(600, 600, width, height);
    fill(0);
    strokeWeight(2);
    stroke(90);
    rect(600, 655, 285 + z*2, 680 + z*2);
    noStroke();
    fill(90);
    quad(457.5 - z, 315 - z, 457.5 -z, 995 + z, 742.5 - t*0.6 - z, 995 - t*0.2 + z, 742.5 - t*0.6 - z, 315 + t*0.1 - z);
    fill(10);
    ellipse(675 - t*0.5 -z, 700, 50 - t*0.1, 50);
  }
}
