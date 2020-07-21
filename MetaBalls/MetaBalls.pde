//Isosurface

Blob [] blobs = new Blob[10];

void setup()
{
  fullScreen();
  colorMode(HSB);
  for (int i=0; i<blobs.length; i++)
  {
    blobs[i] = new Blob(random(width), random(height));
  }
}

void draw()
{
  background(0);
  
  loadPixels();
  for (int x=0; x<width; x++) {
    for (int y=0; y<height; y++) {
      int pixelIndex = x + y*width;
      float colSum = 0;
      for (Blob b : blobs) {
        float d = dist(x, y, b.pos.x, b.pos.y);
        colSum += 100*b.r/d;
      }
      pixels[pixelIndex] = color(colSum,255,255);
      pixels[pixelIndex] = color(colSum,255,255);
    }
  }
  updatePixels();
  for (Blob b : blobs)
  {
    b.update();
    //b.show();
  }
}

void keyPressed()
{
  if(keyCode == ESC)
  exit();
}
