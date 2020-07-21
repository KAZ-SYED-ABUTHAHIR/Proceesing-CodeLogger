import peasy.PeasyCam;
PeasyCam cam;

final int DRAGGED_RIGHT = -1;
final int DRAGGED_LEFT  = 1;
float angle = 0;

int gesture=0;

PImage earthMap, moonMap, jupiterMap, ayishaMap;
PShape globe;

void setup() {
  fullScreen(P3D);
  frameRate(120);
  background(100);
  earthMap = loadImage("earth.jpg");
  moonMap = loadImage("moonmap4k.jpg");
  jupiterMap = loadImage("jupitermap.jpg");
  ayishaMap = loadImage("pp.jpg");
  
  cam = new PeasyCam(this, 800);
  noStroke();
  noFill();
  lights();

  globe = createShape(SPHERE, 200);
  globe.setTexture(jupiterMap);
}

void draw() {
  background(0);
  if (gesture==1) {
    cam.rotateY(-0.01);
  } else if (gesture==2)
  {
    cam.rotateY(0.01);
  }
  lights();
  //cam.rotateY(gesture*0.02);

  shape(globe);
}

void mouseDragged()
{
  if ((mouseX-pmouseX)>10)
  {
    gesture = DRAGGED_RIGHT;
  } else if ((pmouseX-mouseX)>10)
  {
    gesture = DRAGGED_LEFT;
  }
}

void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == RIGHT)
    {
      gesture = DRAGGED_RIGHT;
    } else if (keyCode == LEFT)
    {
      gesture = DRAGGED_LEFT;
    }
  }
}
