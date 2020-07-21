import peasy.*;

PeasyCam cam ;


float r = 50;
float R = 100;
int pointDensity = 150;
float step = TWO_PI/(pointDensity);

PVector [][] points = new PVector[pointDensity+2][pointDensity+1];
float zRot = 0;

void setup() {
  size(displayWidth,displayHeight, P3D);
  cam = new PeasyCam(this, 400);

  smooth();
  colorMode(HSB,360,255,255);
  
}

void draw() {
  background(0);
  //rotateZ(zRot);
  zRot += 0.05;
  float x, y, z;
  for (int i = 0; i <pointDensity+2; i++) {
    float theta = i*step;
    for (int j = 0; j <pointDensity+1; j++) {
      float phi = j*step;
      //R = 50+15 *sin(phi*4-frameCount*0.33);  //*cos(frameCount*0.1);
      //r = 50+5* cos(theta*8-frameCount*0.2);
      //R=1+50*phi;
      //r=1000*theta%2;
      //R =20 + 100*(phi%(TWO_PI/12));
      r = 100*sin(pow(theta,1)*6-frameCount*0.01)*cos(phi%(TWO_PI/8)-frameCount*0.01); // Flower Design
      R = 50*sin(frameCount*0.01);
      x = (R+r*cos(theta))*cos(phi); 
      y = (R+r*cos(theta))*sin(phi);
      z = r*sin(theta);
      point(x, y, z);
      points[i][j] = new PVector(x,y,z);
    }
  }
  float x1,y1,z1;
  float x2,y2,z2;
  //float x3,y3,z3;
  //float x4,y4,z4;
  lights();
  directionalLight(360,0,255,-10,-1,0);
   directionalLight(120,255,255,10,1,0);
  noStroke();
  beginShape(QUAD_STRIP);
  for (int i = 0; i <pointDensity+1; i++) {
    //fill(degrees(i*step)-(360*sin(0.01*frameCount%360)),255,255);
    for (int j = 0; j <pointDensity; j++) {
     fill(degrees(j*step),255,255,255);
      
      x1 = points[i][j].x; y1 = points[i][j].y;z1=points[i][j].z;
      x2 = points[i+1][j].x; y2 = points[i+1][j].y;z2=points[i+1][j].z;
      //x3 = points[i][j+1].x; y3 = points[i][j+1].y;z3=points[i][j+1].z;
      //x4= points[i+1][j+1].x; y4 = points[i+1][j+1].y;z4=points[i+1][j+1].z;
      vertex(x1,y1,z1);
      vertex(x2,y2,z2);
    
      //vertex(x3,y3,z3);
      //vertex(x4,y4,z4);
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
