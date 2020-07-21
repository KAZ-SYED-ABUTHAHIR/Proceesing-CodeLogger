class FTree
{
  float angle;
  int levels ;  
  private int depth;

  float len = height/3;

  float sX = width/2;
  float sY = height-20;

  float eX = width/2;
  float eY = sY - len;

  FTree(float angle, int levels)
  {
    this.angle =  angle;
    this.levels = levels;
    this.depth =  levels+1;
  }

  void show()
  {

    strokeWeight(depth);
    line(sX, sY, eX, eY);
    drawBranches(eX, eY, len);
  }

  void drawBranches(float _eX, float _eY, float _len)
  { 
    depth--;

    if (depth>0)
    {
      pushMatrix();
      translate(_eX, _eY);
      if (depth == levels) {
        rotate(-PI+angle);
      } else { 
        rotate(angle);
      }
      strokeWeight(depth);
      line(0, 0, 0, _len*0.67);
      rotate(-2*angle);
      line(0, 0, 0, _len*0.67);
      _eX = 0;
      _eY = _len*0.67;
      _len = _len*0.67;
      drawBranches(_eX, _eY, _len);

      popMatrix();
    }
  }
}//Class END
