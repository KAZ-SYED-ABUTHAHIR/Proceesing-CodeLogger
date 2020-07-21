class Star
{
  float x;
  float y;
  float z;
  
  float pz;
    
  int speed;
  
  Star(int speed)
  {
    x = random(-width,width);
    y = random(-height,height);
    z = random(width);
    this.speed = speed;
  }
  
  void update()
  {
    z = z-speed;
    if (z < 1)
    {
      z = random(width);
      x = random(-width,width);
      y = random(-height,height);
      pz = z;
    }
    
  }
  
  void show()
  {
    fill(0,255,255);
    noStroke();
    
    float px = map(x/(pz+0.5),0,1,0,width);
    float py = map(y/(pz+0.5),0,1,0,height);
    
    float sx = map(x/z,0,1,0,width);
    float sy = map(y/z,0,1,0,height);
    float rad = map(z,0,width,0,8);
    //ellipse(sx,sy,rad,rad);
    
    stroke(0,0,255);
    line(px,py,sx,sy);
    
    pz = z;
  }
  
}
