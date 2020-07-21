class Circle {
  PVector centre;
  float radius;
  
  Circle(PVector iCentre,float iRadius) {
    this.centre = iCentre.copy();
    this.radius = iRadius;
  }
  
    
  void show() {
    pushStyle();
      noFill();
      stroke(51,255);
      strokeWeight(0.5);
      ellipse(centre.x,centre.y,radius*2,radius*2);
    popStyle();
  }
}
