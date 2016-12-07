String[] lines;
int index = 0;

void setup() {
  size(400, 400);
  
  stroke(255);
  frameRate(25);
  lines = loadStrings("positions.txt");
  //println(lines.length);
}

void draw() {
  noLoop();
  background(0);
  //for (int i = 0; i < lines.length; i++) {
  for (int i = 0; i < width/10; i++) {
    for (int j = 0; j < height/10; j++) {
      if (lines[j] != null) {
        String[] pieces = split(lines[j], '\t');
        if (pieces.length == 2) {
          int x = int(pieces[0]) * 2;
          int y = int(pieces[1]) * 2;
          noStroke();
          fill(random(0, map(x, 0, 100, 0, 255)));
          //rect(i*10, y, 10, 10);
          int dim = int(map(y, 0, 200, 0, 10));
          println(i, j, dim);
          rect(i*10, j*10, dim, dim);
        }
      }
    }
  }
}