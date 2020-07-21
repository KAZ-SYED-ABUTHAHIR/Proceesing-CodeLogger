import peasy.*;

PVector [][] globe;
int GRID = 80;
PeasyCam cam;

float r = 200;
float m = 0;
float mchange = 0;
float a = 1; 
float b = 1;
float colorOffset = 0;


void setup() {
  size(700, 600, P3D);
  frameRate(30);
  background(100);
  cam = new PeasyCam(this, 600);
  globe = new PVector [GRID+1][GRID+1];
  lights();
  stroke(255);
  strokeWeight(1);
  noStroke();
  colorMode(HSB);
}

void draw() {
  background(0);
  lights();
   m = map(sin(mchange), -1, 1, 0, 7);
   mchange += 0.02;
  //directionalLight(51, 102, 255, 0, -1, 0);
  //directionalLight(100, 102, 255, 0, 1,0);
  //directionalLight(200, 102, 255, 0, 0, 1);
  //directionalLight(200, 102, 255, 0, 0, -1);
  float x, y, z;

  for (int i=0; i<GRID+1; i++)
  {
    float lat = map(i, 0, GRID, -HALF_PI, HALF_PI);
    float r2 = supershape(lat, m, 0.2, 1.7, 1.7);
    
    for (int j=0; j<GRID+1; j++)
    {
      float lon = map(j, 0, GRID, -PI, PI);
      float r1 = supershape(lon, m, 0.2, 1.7, 1.7);
      x = r*r1*cos(lon)*r2*cos(lat);
      y = r*r1*sin(lon)*r2*cos(lat);
      z = r*r2*sin(lat);
      globe[i][j] = new PVector(x, y, z);
    }
  }



  for (int i=0; i<GRID; i++)
  {
    float hue = map(i, 0, GRID, 0, 255*6);
    fill((hue+colorOffset) % 255, 255, 255);

    beginShape(TRIANGLE_STRIP);

    for (int j=0; j<GRID+1; j++)
    {        
     //float hue = map(j, 0, GRID, 0, 255*6);
     //fill((hue+colorOffset) % 255, 255, 255);

      PVector v = globe[i][j];
      vertex(v.x, v.y, v.z);
      PVector u = globe[i+1][j];
      vertex(u.x, u.y, u.z);
      colorOffset += 0.001;
    }
    endShape();
  }
}

float getRadius(float latitude, float longitude)
{
  float rad = 200*(cos(latitude)*sin(2*longitude)+0.5*sin(2*latitude)*cos(3*longitude));
  return rad;
}

float supershape(float theta, float m, float n1, float n2, float n3) {
  float t1 = abs((1/a)*cos(m * theta / 4));
  t1 = pow(t1, n2);
  float t2 = abs((1/b)*sin(m * theta/4));
  t2 = pow(t2, n3);
  float t3 = t1 + t2;
  float r = pow(t3, - 1 / n1);
  return r;
}
