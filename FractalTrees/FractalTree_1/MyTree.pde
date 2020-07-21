class FTree
{
  float angle;
  int levels ;

  float len = height/3;
  float sX = width/2;
  float eX = width/2;
  float sY = height-20;
  float eY = sY - len;


  FTree(float angle, int levels)
  {
    this.angle =  angle;
    this.levels = levels;
  }

  void show()
  {
    line(sX, sY, eX, eY);
    pushMatrix();
    translate
  
    
    drawBranches(eX, eY, len);
  }

  void drawBranches(float _sX, float _sY, float _len)
  { 
    levels--;
    pushMatrix();
    
    translate(_sX, _sY);
    rotate(angle);
    float _eX = 0; 
    float _eY = (_len*0.67);
    stroke(0,255,255);
    line(0, 0, _eX, _eY);

    rotate(-2*angle);
    stroke(0,255,0);
    line(0, 0, _eX, _eY);
    if (levels>0) 
    { 
      drawBranches(_eX, _eY, _len*0.67);
      //rotate(PI-angle);
      //drawBranches(_eX, _eY, _len*0.67);
    }

    popMatrix();
    if (levels>0) 
    { 
     // drawBranches(_eX+_sX, _eY+_sY, _len*0.67);
      //rotate(PI-angle);
      //drawBranches(_eX, _eY, _len*0.67);
    }
  }
}
