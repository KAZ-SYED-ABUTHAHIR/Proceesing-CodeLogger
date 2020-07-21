class Circulator {
  Orbit myOrbit;

  private int pointCount;
  private int pointIndex;
  private ArrayList<PVector> myPoints;

  Circulator(Orbit iMyOrbit,float iOffset)
  {
    this.myOrbit = iMyOrbit;
    myPoints = this.myOrbit.orbitPoints;
    pointCount = this.myOrbit.orbitPoints.size();
    pointIndex = int( map(iOffset,0,360,pointCount-1,0));
  }

  void circulate()
  {
    showPoint(myPoints.get(pointIndex--));
    if (pointIndex < 0) pointIndex = pointCount-1;
  }
  
  void showPoint(PVector p) 
  {
    pushMatrix();
    translate(myOrbit.circle.centre.x,myOrbit.circle.centre.y);
    pushStyle();
        //strokeWeight(5);
        //stroke(0,150,255);
        //point(p.x,p.y);
        noStroke();
        colorMode(HSB);
        if(random(1)>0.99){
        fill(120,255,255,128);
        } else {
          fill(120+random(20),255,255,128);
        }
        ellipse(p.x,p.y,35,35);
      popStyle();
   popMatrix();
  }
}
