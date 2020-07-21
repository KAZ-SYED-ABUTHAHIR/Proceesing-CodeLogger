//Circle Waves ...

float alpha ;
float step = 20;
float limit = 200;
float i = 0;

void setup() {
  size(400, 400);
  frameRate(220);
  strokeWeight(2);
  noFill();
  cursor(HAND);
}

void draw() {
  background(0);

  for (int j=0; j<limit; j+=step) {
    alpha = map(j, 0, limit, 200, 0);
    stroke(alpha);
    ellipse(mouseX, mouseY, j+i, j+i);
  }

  i += 0.4;
  i = i%step;
 
  
}
