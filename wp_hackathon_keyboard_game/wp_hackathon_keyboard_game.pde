//wow look at all that code
int state = 0; 
String result=""; 
String[][] words = new String[3][20]; //[difficulties][words for that difficulty]
//screen shake stuff
int screenShakeAmountX = 0;
int screenShakeAmountY = 0;
int screenCounter = 0; 
int screenCounter2 = 0; 

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
    text (" \n"+result, 300+screenShakeAmountX, 400+screenShakeAmountY); 
    break;
 
  case 1:
    fill(0); 
    text ("Thanks \n"+result, 400, 500); 
    break;
  }
  
  //screen shake
  if (screenShakeAmountX > 0) { //if it's positive, decrement it
   screenShakeAmountX--; 
  }
  if (screenShakeAmountY > 0) {
   screenShakeAmountY--; 
  }
  screenCounter++;
  if (screenCounter == 5) { //this is so it only runs every 5 frames instead of every frame
    screenCounter2++;
    switch (screenCounter2) { //this is to cycle how it shakes 
      case 0:
        screenShakeAmountY = -screenShakeAmountY;
        break;
      case 1:
        screenShakeAmountX = -screenShakeAmountX;
        break;
      case 2:
        screenShakeAmountX = -screenShakeAmountX;
        screenShakeAmountY = -screenShakeAmountY;
        break;
      case 3 :
        screenShakeAmountX = -screenShakeAmountX;
        screenCounter2 = 0;
        break;
    }
    screenCounter = 0;
  }
}
 
void keyPressed() {
  //screen shake
 screenShakeAmountX += 4;
 screenShakeAmountY += 4;
 
  if (key==ENTER||key==RETURN) {
    state++;
  } else
  result = result + key;
}
