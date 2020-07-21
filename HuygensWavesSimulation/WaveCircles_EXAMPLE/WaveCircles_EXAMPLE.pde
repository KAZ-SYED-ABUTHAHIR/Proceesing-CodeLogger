final int CIRCLESIZE = 400;
final int MAX_ALPHA=255;
final int STEP_RADIUS=10;
final int DELTA_ALPHA=int(MAX_ALPHA/(float(CIRCLESIZE)/STEP_RADIUS));
final float DELTA_RADIUS=1.5;
final float EASING = 0.1;
float cx = 0, cy = 0;

float radStep;

void setup() {
  size(800, 800);
  background(0);
  smooth();
  noFill();

  strokeWeight(2);
  ellipseMode(CENTER);
  
  radStep=0;
}

void draw() {  
  background(0);
  blendMode(ADD);
  //cx += (mouseX - cx)*EASING;
  //cy += (mouseY - cy)*EASING;
  
  translate(width/2, height/2);

  for (int rad = 0; rad < CIRCLESIZE; rad += STEP_RADIUS) {
    float rad2=(rad+ radStep)%CIRCLESIZE;
    float alphaLevel=MAX_ALPHA - (rad2/STEP_RADIUS)*DELTA_ALPHA;
    stroke(255, alphaLevel);   
    for(float xStep = -40;xStep<41;xStep+=20){
    
    ellipse(xStep, 0, rad2, rad2);
    
    }
   
    //Consider changing the name of i to "rad" for radius
  }

  radStep=(radStep+DELTA_RADIUS);
}
