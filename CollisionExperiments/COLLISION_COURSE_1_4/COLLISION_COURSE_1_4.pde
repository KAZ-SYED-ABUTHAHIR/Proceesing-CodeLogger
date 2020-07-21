


Ball balls[];
Ball b;
final int COUNT = 50;
float sumTime = 0;


void setup() {
  size(640, 360);
  frameRate(30);
  balls = new Ball[COUNT];
  for (int i=0; i<COUNT; i++) {
    PVector p = new PVector(random(width-50), random(height-50));
    balls[i] = new Ball(p, random(5,25));
  }
}

void draw() {
  fill(0, 32);
  rect(0, 0, width, height);
 // long  startTime = 0;

  //startTime = millis();  
  //for (int c=0; c<100000; c++) { //For Timing ...
    for (int i=0; i<COUNT; i++) {
      for (int j=i+1; j<COUNT; j++) {

        if (balls[i].isCollided(balls[j])) {
          balls[i].scatter(balls[j]); //scatter is empty for the time being !
        }
      }
    }
  //} For Timing ...
  //println(millis()-startTime); 
  //sumTime += millis()-startTime;
  //println("Average Time = "+sumTime/frameCount);

  for (int i=0; i<COUNT; i++) {
    balls[i].update();
    balls[i].show();
  }
}
