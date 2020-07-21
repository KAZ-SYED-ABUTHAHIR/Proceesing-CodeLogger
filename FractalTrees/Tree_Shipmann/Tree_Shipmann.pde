float angle = PI/8;
float scaleFactor = 0.6;

void setup()
{
  fullScreen();
  background(51);
}

void draw()
{
  background(51);
  stroke(50,100,220);
  strokeWeight(1);
  angle = map(mouseX,0,width,0,PI);
  translate(width/2,height);
  rotate(PI);
  branch(200);
}

void branch(float len)
{
  if(len>1)
  {
  line(0,0,0,len);
  translate(0,len);
 
  pushMatrix();
    rotate(angle);
    branch(len*scaleFactor);
  popMatrix();
  
  pushMatrix();
    rotate(-angle);
    branch(len*scaleFactor);
  popMatrix();
  }
  
}
