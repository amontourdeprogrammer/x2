void setup() {
  size(500, 500);
  rectMode(CENTER);
  colorMode(HSB, 360, 100, 100);
}

float phase = 1.00;

void draw() {
  background(0);
  noStroke();
  
  float tailleBase = 20;
  float f = 1.57;

  for(float y = tailleBase/2; y < height; y += tailleBase) {
    for(float x = tailleBase/2; x < width; x += tailleBase) {
      float x2 = map(x, 0, width, -1, 1);
      float y2 = map(y, 0, width, -1, 1);
      float hypo = sqrt(x2*x2+y2*y2);
      float taille =
        tailleBase * 0.5 * 
        (1 + cos(phase + f * hypo));
      float angle = degrees(atan2(y2, x2) + PI);
      angle = 360 - (angle + 270) % 360;
      fill(angle, 33, map(hypo, 0, 2, 100, 0));
      ellipse(x, y, taille, taille);
    }
  }
  
  phase -= 0.02;
}