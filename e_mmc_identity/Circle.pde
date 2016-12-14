class MyCircle { 
  
  float ypos, xpos, radius, speed;
  
  MyCircle (float x, float y, float r, float s) {  
    ypos = y;
    xpos = x;
    radius = r;
    speed = s;
  }
  
  void update() { 
    ypos += speed; 
    if (ypos > height) { 
      ypos = 0; 
    } 
    ellipse(xpos, ypos, radius, radius); 
  }
  
} 