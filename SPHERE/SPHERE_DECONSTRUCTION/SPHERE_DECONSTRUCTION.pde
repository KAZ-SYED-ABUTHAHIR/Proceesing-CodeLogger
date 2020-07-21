import peasy.*;

PVector [][] globe;
int GRID = 120;
PeasyCam cam;

float r = 200;
float noiseFactor=0;

void setup() {
  size(700, 600, P3D);
  frameRate(60);
  background(100);
  cam = new PeasyCam(this, 600);
  globe = new PVector [GRID+1][GRID+1];
  lights();
  //stroke(255);
  //strokeWeight(0);
  noStroke();
  colorMode(HSB);
}

void draw() {
  background(0);
  //lights();
  directionalLight(51, 102, 255, 0, -1, 0);
  directionalLight(100, 102, 255, 0, 1, 0);
  float x, y, z;
  //float offset = 50*noise(noiseFactor);
  //noiseFactor += 0.05;

  for (int i=0; i<GRID+1; i++)
  {
    float lon = map(i, 0, GRID, 0, PI);

    for (int j=0; j<GRID+1; j++)
    {
      float lat = map(j, 0, GRID, -2*HALF_PI, 2*HALF_PI);
      
      r = getRadius(lat,lon);
      x = r*sin(lon)*cos(lat);
      y = r*sin(lon)*sin(lat);
      z = r*cos(lon);
      globe[i][j] = new PVector(x, y, z);
      point(globe[i][j].x, globe[i][j].y, globe[i][j].z);
    }
  }


  for (int i=0; i<GRID; i++)
  {
    beginShape(TRIANGLE_STRIP);
    for (int j=0; j<GRID+1; j++)
    {
      PVector v = globe[i][j];
      vertex(v.x, v.y, v.z);
      PVector u = globe[i+1][j];
      vertex(u.x, u.y, u.z);
    }
    endShape();
  }
}

float getRadius(float latitude, float longitude)
{
  float rad = 200*(cos(latitude)*sin(longitude)+0.5*sin(5*latitude)*cos(3*longitude));
  return rad;
}
