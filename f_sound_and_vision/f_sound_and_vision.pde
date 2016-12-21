/*
Based on Daniel Shiffman tutorial https://processing.org/tutorials/video/
*/

import processing.video.*;
import processing.sound.*;

// Size of each cell in the grid, ratio of window size to video size
int videoScale = 8;
// Number of columns and rows in the system
int cols, rows;
// Variable to hold onto Capture object
Capture video;

// Work with sound 
Amplitude amp;
AudioIn soundInput;
float maxSoundVolume = 20;
float normalizedVolume;

void setup() {  
  size(640, 480);  
  // Initialize columns and rows  
  cols = width/videoScale;  
  rows = height/videoScale;
  
  // Initialize sound device and amplitude
  amp = new Amplitude(this);
  soundInput = new AudioIn(this, 0);
  // soundInput.play();
  soundInput.start();
  amp.input(soundInput);
  
  video = new Capture(this, cols, rows);
  // Start capturing the images from the camera
  video.start();
}

// Read image from the camera
void captureEvent(Capture video) {
  video.read();
}

void draw() {
  background(0);
  video.loadPixels();  
  
  // println(amp.analyze());
  normalizedVolume = map(amp.analyze(), 0, 20, 0.5, 1);
  // Begin loop for columns
  for (int i = 0; i < cols; i++) {    
    // Begin loop for rows
    for (int j = 0; j < rows; j++) {      
      // Where are you, pixel-wise?      
      int x = i*videoScale;      
      int y = j*videoScale;
      color c = video.pixels[i + j*video.width];
      
      rectMode(CENTER);
      fill(c);
      stroke(0);
      
      rect(x + videoScale/2, y + videoScale/2, videoScale * normalizedVolume, videoScale * normalizedVolume);
    }  
  }
}