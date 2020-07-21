import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam camera;

int cell = 20;
int cols ;
int rows ;
float time = 0;
float angle = 0;

void setup()
{
  size(600, 400, P3D);

  background(255);
  noStroke();
  colorMode(HSB);

  cols =  width/(cell)  ;
  rows =  height/(cell) ;

  camera = new PeasyCam(this, width/2, height/2, 100, 800);
}

void draw()
{
  background(0);

  camera.rotateY(0.01);  
  for (int j=0; j<rows; j=j+1)
  {
    for (int i=0; i<cols; i=i+1)
    {
      int b  =  int(map(i, 0, cols-1, 0, 255));
      int h  =  int(map(j, 0, rows-1, 0, 255));
      fill(h, 255, b);
      translate(cell, 0);
      box(cell, cell, 20);
    }
    translate(-width, cell);
  }

  time = time + 1;
  if (time>255) time = 0;
}
