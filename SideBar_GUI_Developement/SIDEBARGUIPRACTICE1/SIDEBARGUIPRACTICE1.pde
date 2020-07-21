PGraphics sideBar;
int animationIndex;
int handleWidth = 10;
boolean sideBarOut = false;

void setup() {
  size(640, 320);
  initSideBar();
  animationIndex = -width/3+handleWidth;
}

void draw() {
  background(0);
  showSideBar();
}

void initSideBar() {
  pushStyle();
  sideBar = createGraphics(width/4, height);
  sideBar.beginDraw();
  sideBar.background(100, 100, 200, 64); 
  sideBar.fill(100, 100, 200, 128);
  sideBar.rect(width/4-handleWidth, 0, handleWidth, height);
  sideBar.endDraw();
  popStyle();
}

void showSideBar() {
  image(sideBar, animationIndex, 0);
  if (sideBarOut) {
    if (animationIndex<0) {
      animationIndex += 0.1/abs(0.1*animationIndex);
    }
  }
}
