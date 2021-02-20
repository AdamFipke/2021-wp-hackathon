//wow look at all that code
int state = 0; 
String result=""; 
String[][] words = new String[3][20]; //[difficulties][words for that difficulty]
 
void setup() { //runs once
  size(1000, 1000);
  textFont(loadFont("CourierNewPS-BoldMT-20.vlw")); 
  textSize(16); 
}
 
void draw() { //runs 60 times per second
 
 
  background(200); 
 
 
  switch (state) {
  case 0:
    fill(0); 
    text (" \n"+result, 400, 400); 
    break;
 
  case 1:
    fill(0); 
    text ("Thanks \n"+result, 400, 500); 
    break;
  }
}
 
void keyPressed() {
 
  if (key==ENTER||key==RETURN) {
 
    state++;
  } else
  result = result + key;
}
