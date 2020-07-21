class WaveCircle {
  PVector center;
  float life;
  float diameter;
  color circleColor;
  boolean colored = true;

  final static int MAX_LIFE = 200;


  WaveCircle(PVector _center, float _diameter) {
    this.center = _center.copy();
    this.diameter = _diameter;
    this.life = WaveCircle.MAX_LIFE-this.diameter;
    pushStyle();
    colorMode(HSB);
    this.circleColor = color(random(255), 255, 255);
    popStyle();
  }

  WaveCircle(PVector _center) {
    this(_center, 0);
    pushStyle();
    colorMode(HSB);
    this.circleColor = color(random(255), 255, 255);
    popStyle();
  }

  void update() {
    this.life -= 1;
    this.diameter += 1;
  }

  void show() {
    pushStyle();
    strokeWeight(2);
    if (colored) {
      colorMode(HSB);
      //stroke(hue(this.circleColor), 255, 255, map(this.life, 0, pow(WaveCircle.MAX_LIFE, 0.99), 0, 255));
      stroke(map(this.life, 0, WaveCircle.MAX_LIFE*3, 0, 255), 255, 255, map(this.life, 0, pow(WaveCircle.MAX_LIFE, 0.99), 0, 255));
    } else {
      stroke(255, map(this.life, 0, pow(WaveCircle.MAX_LIFE, 0.99), 0, 255));
    }
    noFill();
    ellipse(this.center.x, this.center.y, this.diameter, this.diameter);
    popStyle();
  }
  void setColored(boolean _colored) {
    this.colored = _colored;
  }
}
