import processing.pdf.*;

boolean saveFrame = false;
color c1 = color(2, 14, 213);
color white = #ffffff;
String dirPath = dataPath("");

void setup() {
  
  size(180, 180);
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
  
}

void mousePressed() {
  saveFrame = true;
}

void keyPressed() {
  
  if (key == 's') {
    saveFrame(dirPath + "snapshot-#####.png");
  }
  
}