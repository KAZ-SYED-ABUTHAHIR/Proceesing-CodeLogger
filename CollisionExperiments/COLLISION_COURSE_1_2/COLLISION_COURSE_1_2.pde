


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
    balls[i] = new Ball(p, 20);
  }
}

void draw() {
  fill(0, 128);
  rect(0, 0, width, height);
  long  startTime = 0;
  
  startTime = millis();  
  for(int c=0;c<10000;c++){
  for (int i=0; i<COUNT; i++) {
    for (int j=0; j<COUNT; j++) {
      if (balls[i].isCollided(balls[j])) {
        //println("Ball "+i+" collided with "+"Ball "+j);
        //println(i+","+j);
        //delay(1000);
        //balls[i].scatter(balls[j]); //scatter is empty for the time being !
      }
    }
  }
  } 
  //println(millis()-startTime); 
  sumTime += millis()-startTime;
  println("Average Time = "+sumTime/frameCount);
  
  for (int i=0; i<COUNT; i++) {
    balls[i].update();
    balls[i].show();
  }
  
}
