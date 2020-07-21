class Ball {

  PVector position;
  PVector velocity;
  PVector acceleration = new PVector(0, 0);
  
  //private float scatterThreshold = 1.0 ;//!!!???

  float size;
  float mass = 1.0;
  private color ballColor;

  Ball(PVector p, float s) {
    this.position = p;
    this.size = s;
    this.velocity = PVector.random2D().mult(random(5));

    pushStyle();
    colorMode(HSB);
    this.ballColor = color(random(255), 255, 255, 200);
    popStyle();
  }

  void update() {
    this.velocity.add(this.acceleration);
    this.position.add(this.velocity);

    this.acceleration.mult(0);
    bounce();
  }

  boolean isCollided(Ball other) {
    //return (PVector.dist(this.position, other.position)<=(this.size+other.size)/2 && PVector.dist(this.position, other.position)>(this.size+other.size)/2-scatterThreshold);
    return (PVector.dist(this.position, other.position)<=(this.size+other.size)/2);  
}

  void scatter(Ball other) {
    //try to put Balls at correct places without interpenetrating ...
    
    
    PVector posOther = other.position.copy();
    PVector velOther = other.velocity.copy();
    PVector posThis = this.position.copy();
    PVector velThis = this.velocity.copy();

    //if(PVector.sub(velThis,velOther).mag()<1) { Not a Good Way !
    //  return;
    //}
    //REF: https://en.wikipedia.org/wiki/Elastic_collision

    float massFactorThis = 2*other.mass/(this.mass+other.mass); //2m2/(m1+m2)
    float massFactorOther = 2*this.mass/(this.mass+other.mass); //2m1/(m1+m2)
    PVector V1_V2 = PVector.sub(velThis, velOther); //v1-v2
    PVector V2_V1 = PVector.sub(velOther, velThis); //v2-v1
    PVector X1_X2 = PVector.sub(posThis, posOther); //x1-x2
    PVector X2_X1 = PVector.sub(posOther, posThis); //x2-x1

    float dotProductThis  = massFactorThis*PVector.dot(V1_V2, X1_X2)/(X1_X2.magSq()); 
    float dotProductOther = massFactorOther* PVector.dot(V2_V1, X2_X1)/(X2_X1.magSq());

    PVector secondTermThis = X1_X2.mult(dotProductThis);
    PVector secondTermOther = X2_X1.mult(dotProductOther);
    this.velocity.sub(secondTermThis);
    other.velocity.sub(secondTermOther);
    
  }

  void show() {
    noStroke();

    fill(this.ballColor);
    ellipse(position.x, position.y, size, size);
  }

  private void bounce() {
    if (position.x>width-size/2) {
      this.velocity.x = -1*this.velocity.x;
      this.position.x = width-size/2;
    }
    if (position.x < size/2) {
      this.velocity.x = -1*this.velocity.x;
      this.position.x = size/2;
    }
    if (position.y>height-size/2) {
      this.velocity.y = -1*this.velocity.y;
      this.position.y = height-size/2;
    }
    if (position.y < size/2) {
      this.velocity.y = -1*this.velocity.y;
      this.position.y = size/2;
    }
  }
}
