String[] lines;
int index = 0;

void setup() {
  size(200, 200);
  background(0);
  stroke(255);
  frameRate(25);
  lines = loadStrings("positions.txt");
}

void draw() {
  
  if (index < lines.length) {
    
    String[] pieces = split(lines[index], '\t');
    
    if (pieces.length == 2) {
      int x = int(pieces[0]) * 2;
      int y = int(pieces[1]) * 2;
      fill(random(0, 255));
      ellipse(x, y, 10, 10);
    }
    // Go to the next line for the next run through draw()
    index++;
  }
}