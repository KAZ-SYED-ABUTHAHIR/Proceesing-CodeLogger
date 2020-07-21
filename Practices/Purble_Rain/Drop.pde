class Drop
{
  float x = random(0,width);
  float y = random(0,height);
  private color dropColor =  color(random(255),random(255),random(255));
  float ySpeed  = 0;
  
  float z = random(0,20);
  float len = map(z,0,20,10,20);
  
  Drop()
  {
  }
  
  void fall()
  {
    y = y + ySpeed;
    ySpeed = ySpeed + map(z,0,20,0,.25);
    if (y > height)
    {
      y = random(-200,10);
      ySpeed = 0;
    }
    
  }
  
  void show()
  {
    stroke(dropColor);
    strokeWeight(map(z,0,20,0,4));
    line(x,y,x,y+len);
  }
}
