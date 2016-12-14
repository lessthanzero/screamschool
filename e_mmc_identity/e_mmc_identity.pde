PShape logo;
int fileWidth = 600;
int fileHeight = 240;
color primaryColor = color(255);
color secondaryColor = color(0);
int currentMode;

MyCircle c1 = new MyCircle(0, 0, 10, 1.5);
MyCircle c2 = new MyCircle(300, 0, 20, 0.5);
MyCircle c3 = new MyCircle(530, 0, 40, 4.5);
MyCircle c4 = new MyCircle(780, 0, 130, 3.0);

void setup() {
  size(1200, 630);
  // The file "logo.svg" must be in the data folder
  // of the current sketch to load successfully
  logo = loadShape("logo.svg");
  currentMode = 0;
} 

void draw(){
  blendMode(currentMode);
  logo.disableStyle();
  background(secondaryColor);
  //logo.setFill(primaryColor);
  fill(primaryColor);
  noStroke();
  shape(logo, width/2 - fileWidth/2, height/2 - fileHeight/2, fileWidth, fileHeight);
  c1.update();
  c2.update();
  c3.update();
  c4.update();
}

void mouseClicked() {
  primaryColor = color(random(0, 255), random(0, 255), random(0, 255));
  secondaryColor = color(random(0, 255), random(0, 255), random(0, 255));
  currentMode = int(random(0, 9));
  println(currentMode);
}