//wow look at all that code
int state = 0; 
String result=""; 
 
void setup() { //runs once
  size(1000, 1000);
}
 
void draw() { //runs 60 times per second
 
 
  background(255); 
 
 
  switch (state) {
  case 0:
    fill(0); 
    text ("Please enter something and hit enter to go on \n"+result, 400, 400); 
    break;
 
  case 1:
    fill(255, 2, 2); 
    text ("Thanks \n"+result, 133, 633); 
    break;
  }
}
 
void keyPressed() {
 
  if (key==ENTER||key==RETURN) {
 
    state++;
  } else
  result = result + key;
}
