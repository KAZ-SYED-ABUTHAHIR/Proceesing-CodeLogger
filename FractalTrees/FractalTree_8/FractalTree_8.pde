FTree myTree ;
float angIndex = 12.0;

void setup()
{
  size(600,600);
  background(255);
 
  
  //myTree = new FTree(PI/2,8);
  //myTree.show();
}

void draw()
{
  background(255);
  myTree = new FTree(PI/angIndex,8);
  myTree.show();
  if(angIndex<0.5)
  {
    angIndex = 12.0;
  }
  
  angIndex = angIndex-0.01;
}
