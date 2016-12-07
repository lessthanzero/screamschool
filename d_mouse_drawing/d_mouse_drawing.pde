int[] coordinates = new int[2];
ArrayList xcoordinates = new ArrayList();
ArrayList ycoordinates = new ArrayList();

void setup() {
  size(300, 300);
  frameRate(25);
  background(255);
}

void draw() {
  stroke(128);
  
  for (int i = 0; i < xcoordinates.size(); i++) {
    for (int j = 0; j < xcoordinates.size(); j++) {
      println(xcoordinates.get(i) + " " + ycoordinates.get(j));
      //line(mouseX, mouseY, xcoordinates.get(i), ycoordinates.get(j));  
    }
  }
  
  
  xcoordinates.add(mouseX);
  ycoordinates.add(mouseY);
}