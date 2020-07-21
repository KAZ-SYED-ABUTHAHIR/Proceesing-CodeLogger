FTree myTree ;
float angIndex = 12.0;

void setup()
{
  size(600,600);
  
  colorMode(HSB,8);
}

void draw()
{
  background(0,0,255);
  myTree = new FTree(PI/angIndex,12);
  myTree.show();
  if(angIndex<1)
  {
    angIndex = 12.0;
  }
  
  angIndex = angIndex-0.01;
}
