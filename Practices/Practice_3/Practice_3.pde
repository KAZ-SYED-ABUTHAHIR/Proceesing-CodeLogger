int y;

void setup()
{
  size(640,360);
  stroke(255);
  noLoop();
  y = height;
  frameRate(30);
}

void draw()
{
  background(0);
  line(0,y,width,y);
  y -= 1;
  if(y<0) y = height;
}

void mousePressed()
{
redraw();
}
