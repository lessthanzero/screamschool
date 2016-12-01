import processing.pdf.*; //add library for PDF import

boolean saveFrame = false; //set trigger for 
color c1 = color(2, 14, 213); //set color variable with RGB notation
color white = #ffffff; //set color variable with HEX notation
String dirPath = dataPath(""); //get path to working directory

void setup() { //setup runs once
  
  size(180, 180); //set size of program's "artboard"
  background(0); //initially set black background for "artboard"
  frameRate(24); //60 frames per second is default
  
} // end setup block

void draw() { //draw executes each frame
  
  println(frameCount); //print to console
  //println(millis());
  
  if (saveFrame == true) {
    beginRecord(PDF, "avatar.pdf");
  }
  
  fill(c1); //set color of fill
  stroke(255); //set color of stroke
  strokeWeight(2); //set color of 
  
  //rectMode(CENTER); //set anchor point
  
  translate(width/2, height/2); //move coordinate system
  rotate(PI/4); //rotate artboard with coordinate system
  translate(-1 * width/2, -1 * height/2); //move coordinate system back to initial position
  
  rect(width/2, height/2, 80, 80, 2); //draw rectangle
  
  if(saveFrame == true) {
    endRecord();
    saveFrame = false; 
  }
  
} //end draw block

void mousePressed() {
  saveFrame = true;
}

void keyPressed() {
  
  if (key == 's') {
    //saveFrame(dirPath + "snapshot-#####.png");
  }
  
}