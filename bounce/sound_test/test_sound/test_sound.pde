  
import processing.sound.*;
SoundFile file;

void setup() {
  size(800, 800);
  background(255);
    
  // Load a soundfile from the /data folder of the sketch and play it back
  file = new SoundFile(this, "../../data/cat_sound_final.wav");
  file.play();
}      

void draw() {
}
