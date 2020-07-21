class Orbit {
  final private int DETAIL = 256;
  float step = TWO_PI/(DETAIL);
  ArrayList<PVector> orbitPoints;
  Circle circle;
  private float r;
  private PVector oCentre;
  
  Orbit(Circle iCircle)
  {
    orbitPoints = new ArrayList<PVector>();
    this.circle = iCircle;
    this.r = this.circle.radius;
    this.oCentre = this.circle.centre.copy();
    calcOrbit();
  }
  
  void calcOrbit() {
    
    for(int i=0;i<=DETAIL;i++)
    {
      //float x = this.r * sin(i*step);
      //float y = this.r * cos(i*step);
      float Rx =  10+ this.r *  sin(2*i*step);
      float Ry =  10+ this.r *  sin(1*i*step);
      float x = Rx * sin(i*step);
      float y = Ry * cos(i*step);
      orbitPoints.add(new PVector(x,y));
    }
  
  }
  
  void showOrbit() {
    pushMatrix();
    translate(oCentre.x,oCentre.y);

    for(PVector p: orbitPoints)
    {
      pushStyle();
        strokeWeight(5);
        stroke(0,0,255);
        point(p.x,p.y);
      popStyle();
    }
    popMatrix();
  }
  
}
