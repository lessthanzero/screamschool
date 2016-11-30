import processing.pdf.*;

boolean saveFrame = false;
color c1 = color(2, 14, 213);
color white = #ffffff;
String dirPath = dataPath("");
int dim;
int Y_AXIS = 1;
int X_AXIS = 2;

void setup() {
  
  size(180, 180);
  println("Setup");
  background(0);
  frameRate(24); //60 is default
  
}

void draw() {
  
  println(frameCount);
  //println(millis());
  
  if (saveFrame == true) {
    beginRecord(PDF, "avatar.pdf");
  }
  
  fill(c1);
  stroke(255);
  strokeWeight(2);
  
  rectMode(CENTER);
  translate(width/2, height/2);
  rotate(PI/4);
  translate(-1 * width/2, -1 * height/2);
  rect(width/2, height/2, 80, 80, 2);
  
  if(saveFrame == true) {
    endRecord();
    saveFrame = false; 
  }
  
  //noStroke();
  //fill(white);
  //for (int i = 0; i < 3; i++) {
  //  ellipse(i * 30, 50, 20, 20);
  //}
  
}

void mousePressed() {
  saveFrame = true;
}

void keyPressed() {
  
  if (key == 's') {
    saveFrame(dirPath + "snapshot-#####.png");
  }
  
}

void drawRadialGradient(float x, float y) {
  
  int radius = dim/2;
  float h = random(0, 360);
  
  for (int r = radius; r > 0; --r) {
    fill(h, 90, 90);
    ellipse(x, y, r, r);
    h = (h + 1) % 360;
  }
  
}

void drawLinearGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  } else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
  
}