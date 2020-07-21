class WaveCircles {
  ArrayList<WaveCircle> wavecircles = new ArrayList<WaveCircle>();
  private int step = 10;
  PVector center = new PVector(-width/2, -height/2);

  WaveCircles() {
    for (int i = 0; i < WaveCircle.MAX_LIFE; i += this.step) {
      WaveCircle wc = new WaveCircle(this.center, i);
      if(i%2 == 0) wc.crest = true; 
      this.wavecircles.add(wc);
    }
  }

  void render() {
    for (WaveCircle wc : this.wavecircles) {
      wc.update();
      wc.show();
    }
  }

  void recycle() {
    boolean _crest;
    for (int i = 0; i < wavecircles.size(); i ++) {
      if (wavecircles.get(i).life < 0) {
        _crest = this.wavecircles.get(i).crest;
        this.wavecircles.remove(i);
        this.wavecircles.add(new WaveCircle(this.center, 0));
        if(i%2 == 0) this.wavecircles.get(wavecircles.size()-1).crest = _crest;
      }
    }
  }

  void setCenter(float cx, float cy) {
    this.center = new PVector(cx, cy);
  }
}//EOC
