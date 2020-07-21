WaveCircles wcs, wcsLeftReflected,wcsTopReflected,wcsRightReflected,wcsBottomReflected;
float cx, cy;
float easing = 1.0;

void setup() {
  size(400, 400);
  cx = 0; 
  cy = 0;
  wcs = new WaveCircles();
  wcsLeftReflected = new WaveCircles();
  wcsTopReflected = new WaveCircles();
  wcsRightReflected = new WaveCircles();
  wcsBottomReflected = new WaveCircles();
  smooth(8);
  cursor(HAND);
}

void draw() {
  background(0);
  cx += (mouseX-cx)*easing;
  cy += (mouseY-cy)*easing;
  
  wcs.setCenter(cx, cy);
  wcsLeftReflected.setCenter(-cx, cy);
  wcsTopReflected.setCenter(cx, -cy);
  wcsRightReflected.setCenter(2*width-cx, cy);
  wcsBottomReflected.setCenter(cx,2*height-cy);
  
  wcs.render();
  wcsLeftReflected.render();
  wcsTopReflected.render();
  wcsRightReflected.render();
  wcsBottomReflected.render();
  
  wcs.recycle();
  wcsLeftReflected.recycle();
  wcsTopReflected.recycle();
  wcsRightReflected.recycle();
  wcsBottomReflected.recycle();
  
  
 
}
