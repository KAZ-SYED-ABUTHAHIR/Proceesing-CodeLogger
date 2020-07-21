Drop[] rain = new Drop[1500];

void setup()
{
  size(640, 360);
  for (int i=0; i<rain.length; i++)
  {
    rain[i] = new Drop();
  }
}
void draw()
{
  background(230, 230, 250);
  for (int i=0; i<rain.length; i++)
  {
    rain[i].show();
    rain[i].fall();
  }
}
