Circle roundy;
Orbit  myOrbit;
ArrayList<Circulator> circulators;
float r = 30;
float uWidth, uHeight;
float circleSpacing = 10;

void setup() {
  //size(640, 360, P2D);
  fullScreen(P2D);
  uWidth = width+3*r;
  uHeight = height+3*r;
  frameRate(60);
  background(51);
  stroke(0, 0, 255);
  circulators = new ArrayList<Circulator>();
  for (float x = -r; x<=uWidth; x+=r+circleSpacing)
  {
    for (float y = -r; y<=uHeight; y+=r+circleSpacing)
    {
      roundy = new Circle(new PVector(x, y), r);
      roundy.show();
      myOrbit = new Orbit(roundy);
      int i =int( map(x,-r,uWidth,0,360));
      int j =int( map(y,-r,uHeight,0,360));
      float offset = 0;
      try {
      offset = map(i+j,0,720,0,360);
      }
      catch(Exception e){
        e.printStackTrace();
      }
      circulators.add(new Circulator(myOrbit,offset));
    }
  }
  noCursor();
}


void draw() {
  fill(0,16);
  rect(0,0,width,height);

  for(Circulator c: circulators)
  {
    c.circulate();
  }
  
}
