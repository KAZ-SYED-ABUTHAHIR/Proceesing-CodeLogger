

//Ball balls[] = new Ball[COUNT];
Ball balls[];
Ball b;
final int COUNT = 3;


void setup() {
  size(640, 360);
  frameRate(8);
  balls = new Ball[COUNT];
  for (int i=0; i<COUNT; i++) {
    PVector p = new PVector(random(width-50), random(height-50));
    balls[i] = new Ball(p, 20);
  }
}

void draw() {
  fill(0, 128);
  rect(0, 0, width, height);
  for (int i=0; i<COUNT; i++) {
    for (int j=0; j<COUNT; j++) {
      if (j != i) {
        if (balls[i].isCollided(balls[j])) {
          println("Ball "+i+" collided with "+"Ball "+j);
        }
      }
    }
  }
  for (int i=0; i<COUNT; i++) {
    balls[i].update();
    balls[i].show();
  }
}
