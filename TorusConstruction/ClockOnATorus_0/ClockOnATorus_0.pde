import peasy.*;
PeasyCam cam ;

float r = 50;
float R = 150;
int pointDensity = 250;
float step = TWO_PI/(pointDensity);

float thetaOffset = PI/2;
float phiOffset = 0;


PVector [][] points = new PVector[pointDensity+2][pointDensity+2];

float noiseX = 0;
float noiseY = 0;


void setup() {
  size(displayWidth, displayHeight, P3D);
  cam = new PeasyCam(this, 600);

  smooth();
  colorMode(HSB, 360, 255, 255);
}

void draw() {
  background(0);
  thetaOffset += 0.05;
  phiOffset += 0.01;
  float x, y, z;
  for (int i = 0; i <pointDensity+2; i++) {
    float theta = i*step + thetaOffset;
    for (int j = 0; j <pointDensity+2; j++) {
      float phi = j*step + phiOffset;
      
     float d2 = (i-pointDensity/2)*(i-pointDensity/2)+(j-pointDensity/2)*(j-pointDensity/2);

     if (d2<50) r= 50+64/d2 ; else r = 50;
     

      x = (R+r*cos(theta))*cos(phi); 
      y = (R+r*cos(theta))*sin(phi);
      z = r*sin(theta);

      points[i][j] = new PVector(x, y, z);
      
    }
  }

  float x1, y1, z1;
  float x2, y2, z2;

  lights();
  directionalLight(360, 0, 255, -10, -1, 0);
  directionalLight(120, 255, 255, 10, 1, 0);
  noStroke();



  beginShape(TRIANGLE_STRIP);

  for (int i =0; i <pointDensity+1; i++) {
    
    for (int j = 0; j <pointDensity+1; j++) {
       float d2 = (i-pointDensity/2)*(i-pointDensity/2)+(j-pointDensity/2)*(j-pointDensity/2);

     if (d2<50) 
     {
       fill(360,0,255,255);
     }
     else {
     
      fill(degrees(j*step), 255, 255, 255);
     }

      x1 = points[i][j].x; 
      y1 = points[i][j].y;
      z1=points[i][j].z;
      x2 = points[i+1][j].x; 
      y2 = points[i+1][j].y;
      z2=points[i+1][j].z;

      
      float theta = i*step+thetaOffset;  
      float phi = j*step + phiOffset;
      
      float u = map(phi, phiOffset, TWO_PI+phiOffset, 0, width);
      float v = map(theta, thetaOffset, TWO_PI+thetaOffset, 0, height);
      float u1 = map(phi, phiOffset, TWO_PI+step+phiOffset, 0, width);
      vertex(x1, y1, z1, u, v);
      vertex(x2, y2, z2, u1, v);
    }
  }
  endShape(CLOSE);
}

void drawAxes()
{
  stroke(255);
  line(0, 0, 0, 500, 0, 0); 
  line(0, 0, 0, 0, 500, 0); 
  line(0, 0, 0, 0, 0, 500);
}
