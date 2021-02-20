ArrayList<TEXTBOX> textboxes = new ArrayList<TEXTBOX>();
String word = ""; 

void setup() {
   Layout();
}

public void settings() {
   size(400, 400);
}

void draw() {
   background(180);
   
   for(TEXTBOX text : textboxes) {
      text.DRAW(); 
   }
}

void Layout() {
    TEXTBOX receive = new TEXTBOX();
    receive.W = 200;
    receive.H = 30;
    receive.X = (width - receive.W) / 2;
    receive.Y = 75;
    
    textboxes.add(receive);
    
    TEXTBOX message = new TEXTBOX((width - receive.W) / 2, 150, 200, 30);
    textboxes.add(message);
}

void mousePressed() {
    for(TEXTBOX text : textboxes) {
      text.PRESSED(mouseX, mouseY); 
   }
}

void keyPressed() {
    for(TEXTBOX text : textboxes) {
      text.KEYPRESSED(key, keyCode); 
   }
   word = word + key;
}
