
void setup()
{
  size(640,360);
  background(56);
  noStroke();
  noFill();
  noLoop();
}

void draw()
{
  drawCircles(width*0.5,height*0.5,200,4);
  drawCircles(width*0.25,height*0.4,300,14);
  drawCircles(width*0.6,height*0.4,120,8);
}


void drawCircles(float xc,float yc,int size,int num)
{
  float grayValues = 255/num;
  float steps = size/num ;
  
  for(int i=0;i<num;i++)
  {
    fill(grayValues*i);
    ellipse(xc,yc,size-steps*i,size-steps*i);
  }
}
