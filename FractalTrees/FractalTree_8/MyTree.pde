class FTree
{
  float angle;
  int levels ;  

  float len = height/4;

  float sX = width/2;
  float sY = height-20;

  float eX = width/2;
  float eY = sY - len;

  FTree(float angle, int levels)
  {
    this.angle =  angle;
    this.levels = levels;
  }

  void show()
  {
    strokeWeight(levels);
    stroke(0, 0, 255, 128);
    line(sX, sY, eX, eY);
    drawBranches(eX, eY, len, levels);
  }

  void drawBranches(float _eX, float _eY, float _len, int i)
  { 
    if (i>0)
    {

      translate(_eX, _eY);
      if (i==levels)
      {
        rotate(-PI+angle);
      } else
      {
        rotate(angle);
      }
      strokeWeight(i);
      line(0, 0, 0, _len*0.67);
      
      pushMatrix();
      drawBranches(0, _len*0.67,  _len*0.67,  --i);
      popMatrix();
      
      translate(0,0);
      rotate(-2*angle);
      strokeWeight(i+1);
      line(0,0,0,_len*0.67);
          
      pushMatrix();
      drawBranches(0, _len*0.67,  _len*0.67,  i--);
      popMatrix();
    }
  }
}//Class END
