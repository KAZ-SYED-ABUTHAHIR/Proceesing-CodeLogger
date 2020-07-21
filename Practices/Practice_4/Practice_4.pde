void setup()
{
  size(640,360);
  noStroke();
  noLoop();
}

void draw()
{
  drawCircles(width/2,280,8);
}


void drawCircles(int x,int radius,int level)
{
  float tt = 126.0*level/8.0;
  fill(tt);
  ellipse(x,height/2,radius*2,radius*2);
  if(level>1) {
    level -= 1;
    drawCircles(x-radius/2,radius/2,level);
    drawCircles(x+radius/2,radius/2,level);
  }
}
