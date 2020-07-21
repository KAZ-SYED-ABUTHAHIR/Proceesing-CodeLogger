class Ball {
  PVector position;
  PVector velocity;
  PVector acceleration = new PVector(0.0, 0.0)  ;
  float e = -1.0                              ; //Restitusion Coefficieint with walls.
  float speed;
  float velocityFriction = 1.0;

  private PVector previousPosition = new PVector(0, 0);

  float size ;
  float mass ;
  float charge = 1.0;
  private color ballColor;

  Ball(PVector p, float s) {
    this.position = p;
    
    this.size = s;
    this.mass = s*0.1;
    
    if (random(1)>=1.0) {
      this.velocity = new PVector(0, 0);
    } else {
      this.velocity = PVector.random2D().mult(random(5));
    }
     this.speed = this.velocity.mag();
    pushStyle();
    colorMode(HSB);
    //this.ballColor = color(random(255)+10, 255, 255, 128);
    this.ballColor = color(constrain(this.speed*5,0,255),0,255-constrain(this.speed*5,0,255), 128);
    popStyle();
  }

  void update() {
    this.previousPosition = this.position.copy();
    this.velocity.add(this.acceleration);
    this.speed = this.velocity.mag();
    this.position.add(this.velocity);
    //Velocity damping use wisely
    this.velocity.mult(velocityFriction);

    this.acceleration.mult(0); //In the case of presence of a global field set the acceleration accordingly.
    bounce();
  }
  
  void interact(Ball other)
  {
    PVector direction = PVector.sub(this.position,other.position);
    direction.setMag(1.0);
    float dist = PVector.dist(this.position, other.position);
    if(dist > (this.size+other.size)/2) {
     PVector force = direction.mult(-G*this.mass*other.mass/(dist*dist));//Gravity
     // PVector force = direction.mult(-G*this.mass*other.mass*(dist-200));//Pseudo Force
     //PVector force = direction.mult(-G*this.mass*other.mass*abs(this.speed-other.speed+5));//Pseudo Force
    //PVector force = direction.mult(-G*this.mass*other.mass*(PVector.dot(this.velocity,other.velocity))/(dist*dist+100));
    this.acceleration.add(PVector.div(force,this.mass));
    other.acceleration.add(PVector.div(force,-other.mass));
    } 
  }

  boolean isCollided(Ball other) {
    return (PVector.dist(this.position, other.position)<(this.size+other.size)/2);
  }

  void scatter(Ball other) {
    //try to put Balls at correct places without interpenetrating ...
    //On balls rollback to previous frame's position.
    
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
    this.ballColor = color(constrain(this.speed*25,0,255),0,255-constrain(this.speed*25,0,255), 128);
    fill(this.ballColor);
    ellipse(position.x, position.y, size, size);
    popStyle();
  }

  private void bounce() {
    //On walls rollback to previous frame's position.
    if (position.x>width-size/2) {
      this.velocity.x = e*this.velocity.x;
      this.position = this.previousPosition.copy();
    }
    if (position.x < size/2) {
      this.velocity.x = e*this.velocity.x;
      this.position = this.previousPosition.copy();
    }
    if (position.y>height-size/2) {
      this.velocity.y = e*this.velocity.y;
      this.position = this.previousPosition.copy();
    }
    if (position.y < size/2) {
      this.velocity.y = e*this.velocity.y;
      this.position = this.previousPosition.copy();
    }
  }
}
