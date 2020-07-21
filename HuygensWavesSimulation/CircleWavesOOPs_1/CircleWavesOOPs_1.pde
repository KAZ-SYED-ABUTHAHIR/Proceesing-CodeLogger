WaveCircles wcs,wcsLeftReflected;
float cx = 0,cy = 0;
float easing = 0.2;

void setup(){
  size(400,400);
  wcs = new WaveCircles();
  wcsLeftReflected = new WaveCircles();
  cursor(HAND);
}

void draw(){
  background(0);
  wcs.render();
  wcsLeftReflected.render();
  wcs.recycle();
  wcsLeftReflected.recycle();
  cx += (mouseX-cx)*easing;
  cy += (mouseY-cy)*easing;
  wcs.setCenter(cx+random(-1,1),cy+random(-1,1));
  wcsLeftReflected.setCenter(-cx-random(-1,1),cy+random(-1,1));

  println(wcs.wavecircles.size());
}
