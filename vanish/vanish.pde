Vanish v1;
Cube[] c;
boolean side;
void setup() {
  size(1024, 768);
  v1 = new Vanish(int(random(0, width)), int(random( 0, height)));
  c = new Cube[10];
  for (int i = 0; i < 10; i++) {
    c[i] = new Cube(int(random(100, width-100)), int(random(100, height-100)), int(random(50, 100)), int(random(50, 100)), random(0.1, 0.6));
  }
  side = true;
}

void draw() {
  background(255);
  v1.x = mouseX;
  v1.y = mouseY;
  //v1.draw();
  for (int i = 0; i < 10; i++) {
    c[i].update(v1.x, v1.y);
    c[i].draw();
    if (side) {
      c[i].drawSide(v1.x, v1.y);
      v1.draw();
    }
  }
}

public class Vanish {
  int x;
  int y;
  Vanish(int _x, int _y) {
    x = _x;
    y = _y;
  }
  void draw() {
    fill(0);
    noStroke();
    ellipse(x, y, 10, 10);
    stroke(0);
    strokeWeight(3);
    line(0, y, width, y);
  }
}

public class Cube {
  int x;
  int y;
  int w;
  int h;
  int x1;
  int y1;
  int w1;
  int h1;
  float ratio;
  Cube(int _x, int _y, int _w, int _h, float r) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    x1 = _x;
    y1 = _y;
    w1 = _w;
    h1 = _h;
    ratio = r;
  }

  void update(int x0, int y0) {
    x1 = int((x-x0)*(1-ratio)+x0);
    y1 = int((y-y0)*(1-ratio)+y0);
    w1 = int(w *(1-ratio));
    h1 = int(h * (1-ratio));
  }

  void draw() {
    noFill();
    stroke(0);
    strokeWeight(2);
    rect(x, y, w, h);
    rect(x1, y1, w1, h1);
    strokeWeight(2);
    line(x, y, x1, y1);
    line(x + w, y, x1 + w1, y1);
    line(x, y+h, x1, y1 + h1);
    line(x+w, y+h, x1+w1, y1+h1);
  }

  void drawSide(int x0, int y0) {
    stroke(0);
    strokeWeight(1);
    line (x0, y0, x, y);
    line (x +w, y, x0, y0);
    line (x, y+h, x0, y0);
    line(x+w, y+h, x0, y0);
  }
}

void keyPressed() {
  if (key == 'a') {
    side = !side;
  }
  if (key == 'r') {
    for (int i = 0; i < 10; i++) {
      c[i] = new Cube(int(random(100, width-100)), int(random(100, height-100)), int(random(50, 100)), int(random(50, 100)), random(0.1, 0.6));
    }
  }
}