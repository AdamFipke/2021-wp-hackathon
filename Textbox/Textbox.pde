ArrayList<TEXTBOX> textboxes = new ArrayList<TEXTBOX>();
String word = ""; 


void setup() {
  Layout();
}

public void settings() {
  size(1000, 1000);
}

void draw() {
  background(180);

  for (TEXTBOX text : textboxes) {
    text.DRAW();
  }
}

void Layout() {
  TEXTBOX message = new TEXTBOX((width - 200) / 2, 150, 200, 30);
  textboxes.add(message);
}

void mousePressed() {
  for (TEXTBOX text : textboxes) {
    text.PRESSED(mouseX, mouseY);
  }
}

void keyPressed() {
  for (TEXTBOX text : textboxes) {
    text.KEYPRESSED(key, keyCode);
  }
  //if the key == the corrisponding letter in the word
  if (key==ENTER||key==RETURN) {
    //conditional to check if the word is correct?
    word = "";
  } else
    word = word + key;
}
