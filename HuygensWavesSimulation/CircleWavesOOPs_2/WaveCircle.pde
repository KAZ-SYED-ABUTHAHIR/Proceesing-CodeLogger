class WaveCircle {
  PVector center;
  float life;
  float diameter;
  color circleColor;
  boolean colored = false;
  float speed = 1.0f;
  boolean crest = false;

  final static int MAX_LIFE = 300;


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
    this.life -= this.speed;
    this.diameter += this.speed;
  }

  void show() {
    pushStyle();
    strokeWeight(2);
    blendMode(ADD);
    if (colored) {
      colorMode(HSB);
      //stroke(hue(this.circleColor), 255, 255, map(this.life, 0, pow(WaveCircle.MAX_LIFE, 0.99), 0, 255));
      stroke(map(this.life, 0, WaveCircle.MAX_LIFE*3, 0, 255), 255, 255, map(this.life, 0, pow(WaveCircle.MAX_LIFE, 0.99), 0, 255));
    } else {
      if(crest){
      stroke(255, map(this.life, 0, WaveCircle.MAX_LIFE, 0, 255));
      
      } else {
        stroke(182, map(this.life, 0, WaveCircle.MAX_LIFE, 0, 255));
        
      }
    }
    noFill();
    ellipse(this.center.x, this.center.y, this.diameter, this.diameter);
    popStyle();
  }
  void setColored(boolean _colored) {
    this.colored = _colored;
  }
}
