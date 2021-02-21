import processing.sound.*;

SoundFile file;

String audioName = "../../music/zapsplat_upbeat_music.mp3";
String path;


void setup(){
  path = sketchPath(audioName);
  file = new SoundFile(this, path);
  //file.play();
}
