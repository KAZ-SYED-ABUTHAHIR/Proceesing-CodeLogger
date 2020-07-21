class Blob
{
  PVector pos;
  PVector vel;
  float r;

  Blob(float x, float y)
  {
    pos  = new PVector(x,y);
    vel = PVector.random2D();
    vel.mult(random(3,5));
    r = 40;
  }
  
  void update()
  {
    pos.add(vel);
    if(pos.x > width-10 || pos.x < 10){
      vel.x *= -1;
    }
    if(pos.y > height-10 || pos.y < 10){
      vel.y *= -1;
    }
  }

  void show()
  {
    noFill();
    stroke(0);
    ellipse(pos.x,pos.y,r*2,r*2);
  }
}
