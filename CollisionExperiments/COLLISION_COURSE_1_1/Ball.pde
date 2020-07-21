class Ball {

  PVector position;
  PVector velocity;
  PVector acceleration = new PVector(0, 0.4);

  float size;
  private color ballColor;

  Ball(PVector p, float s) {
    this.position = p;
    this.size = s;
    this.velocity = PVector.random2D().mult(random(10));

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
    return (PVector.dist(this.position,other.position)<=(this.size+other.size));
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
