void setup()
{
  size(720, 480);
  background(255);
}

void draw()
{
  background(255);
  noStroke();
  fill(0);
  ellipse(width/2, height/2, mouseX, mouseY);
}
