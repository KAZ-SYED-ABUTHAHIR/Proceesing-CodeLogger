FTree myTree ;

void setup()
{
  size(400,400);
  background(255);
  stroke(0,0,255,128);
  strokeWeight(2);
  //line(10,10,10,100);
  //translate(10,10);
  //rotate(PI/2);
  // line(0,0,0,90);
  myTree = new FTree(PI/6,8);
  myTree.show();
}

void draw()
{
}
