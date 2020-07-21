WaveCircles wcs;
float cx = 0,cy = 0;
float easing = 0.08;

void setup(){
  size(400,400);
  wcs = new WaveCircles();
  cursor(HAND);
}

void draw(){
  background(0);
  wcs.render();
  wcs.recycle();
  cx += (mouseX-cx)*easing;
  cy += (mouseY-cy)*easing;
  wcs.setCenter(cx+random(-1,1),cy+random(-1,1));
}
