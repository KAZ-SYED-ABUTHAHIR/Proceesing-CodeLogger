

int pastX,pastY;

void setup()
{
  size(640,360);
  background(255);
  
  strokeWeight(5);
}

void draw()
{
 
}

void mousePressed()
{
  pastX = mouseX;
  pastY = mouseY;
  background(0);
}

void mouseDragged()
{
  stroke(mouseX,mouseY,mouseX-mouseY);
  line(pastX,pastY,mouseX,mouseY);
  //ellipse(mouseX,mouseY,16,10); //This is to draw ellipses.
  pastX=mouseX;
  pastY=mouseY;
}
  
