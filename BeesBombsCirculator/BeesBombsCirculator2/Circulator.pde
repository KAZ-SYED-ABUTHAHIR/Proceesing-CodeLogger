class Circulator {
  Orbit myOrbit;
  float offset;
  private int pointCount;
  private int pointIndex;
  private ArrayList<PVector> myPoints;

  Circulator(Orbit iMyOrbit,float iOffset)
  {
    this.myOrbit = iMyOrbit;
    myPoints = this.myOrbit.orbitPoints;
    pointCount = this.myOrbit.orbitPoints.size();
    this.offset = iOffset;
    pointIndex = int( map(this.offset,0,360,pointCount-1,0));
  }

  void circulate()
  {
    showPoint(myPoints.get(pointIndex--));
    if (pointIndex < 0) pointIndex = pointCount-1;
  }
  
  void circulate(color c)
  {
    showPoint(myPoints.get(pointIndex--),c);
    if (pointIndex < 0) pointIndex = pointCount-1;
  }
  
  void showPoint(PVector p) 
  {
    pushMatrix();
    translate(myOrbit.circle.centre.x,myOrbit.circle.centre.y);
    pushStyle();
        strokeWeight(5);
        stroke(0,150,255);
        point(p.x,p.y);
        //noStroke();
        //colorMode(HSB);
        //if(random(1)<1){
        //fill(120,255,255,255);
        //} else {
        //  fill(120+random(20),255,255,255);
        //}
        //ellipse(p.x,p.y,5,5);
      popStyle();
   popMatrix();
  }
  
   void showPoint(PVector p,color c) 
  {
    pushMatrix();
    translate(myOrbit.circle.centre.x,myOrbit.circle.centre.y);
    pushStyle();
       
        stroke(c);
        strokeWeight(10);
        
        point(p.x,p.y);
        //noStroke();
        //colorMode(HSB);
        //if(random(1)<1){
        //fill(120,255,255,255);
        //} else {
        //  fill(120+random(20),255,255,255);
        //}
        //ellipse(p.x,p.y,5,5);
      popStyle();
   popMatrix();
  }
}
