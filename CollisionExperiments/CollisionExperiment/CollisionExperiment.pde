Ball balls[];
Ball b      ;

final int COUNT = 500   ;
final float MAX_SIZE = 30;
final float MIN_SIZE = 1;



void setup() {
  size(displayWidth,displayHeight);
  frameRate(24);
  balls = new Ball[COUNT];
  
  for (int i=0; i<COUNT; i++) {
    PVector p = new PVector(random(MAX_SIZE,width-MAX_SIZE), random(MAX_SIZE,height-MAX_SIZE));
    balls[i] = new Ball(p, random(MIN_SIZE, MAX_SIZE));
    
  }
  background(0);
}


void draw() {
  fill(0, 16);
  rect(0, 0, width, height);

    for (int i=0; i<COUNT; i++) {
      for (int j=i+1; j<COUNT; j++) {
        balls[i].interact(balls[j]);
        if (balls[i].isCollided(balls[j])) {
          balls[i].scatter(balls[j]);
        }
      }
    }
    
    for (int i=0; i<COUNT; i++) {
      balls[i].update();
      balls[i].show();
    }

  
  if(mousePressed) background(0);
 }
