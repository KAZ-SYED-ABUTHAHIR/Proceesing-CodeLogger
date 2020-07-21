class Ball {

  PVector position;
  PVector velocity;
  PVector acceleration = new PVector(0, 0.0);
  float e = -0.20                           ; //Restitusion Coefficieint

  private PVector previousPosition = new PVector(0, 0);

  float size;
  float mass ;
  private color ballColor;

  Ball(PVector p, float s) {
    this.position = p;
    
    this.size = s;
    this.mass = s*0.1;
    
    if (random(1)>0.5) {
      this.velocity = new PVector(0, 0);
    } else {
      this.velocity = PVector.random2D().mult(random(30));
    }

    pushStyle();
    colorMode(HSB);
    this.ballColor = color(random(255), 255, 255, 32);
    popStyle();
  }

  void update() {
    this.previousPosition = this.position.copy();
    this.velocity.add(this.acceleration);
    this.position.add(this.velocity);

    //this.acceleration.mult(0);
    bounce();
  }

  boolean isCollided(Ball other) {
    return (PVector.dist(this.position, other.position)<(this.size+other.size)/2);
  }

  void scatter(Ball other) {
    //try to put Balls at correct places without interpenetrating ...
    this.position = this.previousPosition.copy();
    other.position = other.previousPosition.copy();

    PVector posOther = other.position.copy();
    PVector velOther = other.velocity.copy();
    PVector posThis = this.position.copy();
    PVector velThis = this.velocity.copy();

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
    pushStyle();
    noStroke();
    fill(this.ballColor);
    ellipse(position.x, position.y, size, size);
    popStyle();
  }

  private void bounce() {
    if (position.x>width-size/2) {
      this.velocity.x = e*this.velocity.x;
      //this.position.x = width-size/2;
      this.position = this.previousPosition.copy();
    }
    if (position.x < size/2) {
      this.velocity.x = e*this.velocity.x;
      //this.position.x = size/2;
      this.position = this.previousPosition.copy();
    }
    if (position.y>height-size/2) {
      this.velocity.y = e*this.velocity.y;
      //this.position.y = height-size/2;
      this.position = this.previousPosition.copy();
    }
    if (position.y < size/2) {
      this.velocity.y = e*this.velocity.y;
      //this.position.y = size/2;
      this.position = this.previousPosition.copy();
    }
  }
}
