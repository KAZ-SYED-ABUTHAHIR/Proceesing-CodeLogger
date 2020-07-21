Circle roundy;
Orbit  myOrbit;
ArrayList<Circulator> circulators;
ArrayList<Integer> hues;
float r = 10;
float uWidth, uHeight;
float circleSpacing = 10;


void setup() {
  //size(640, 360, P2D);
  fullScreen(P2D);
  uWidth = width+3*r;
  uHeight = height+3*r;
  frameRate(120);
  background(51);
  stroke(0, 0, 255);
  circulators = new ArrayList<Circulator>();
  hues = new ArrayList<Integer>();
  for (float x = -r; x<=uWidth; x+=r+circleSpacing)
  {
    for (float y = -r; y<=uHeight; y+=r+circleSpacing)
    {
      roundy = new Circle(new PVector(x, y), r);
      
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
      int hue = (int)map(offset,0,360,0,255);
      hues.add(hue);
      circulators.add(new Circulator(myOrbit,offset));
      
    }
  }
  noCursor();
  colorMode(HSB);
}


void draw() {
  fill(0,16);
  rect(-1,-1,width+1,height+1);
  int i=0;
  for(Circulator c: circulators)
  {
    color clr = color(hues.get(i++),255,255,255);
    c.circulate(clr);
    //c.myOrbit.circle.show();
  }
  
}
