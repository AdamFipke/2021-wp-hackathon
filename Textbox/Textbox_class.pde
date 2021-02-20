public class TEXTBOX {
   public int X = 0, Y = 0, H = 35, W = 200;
   public int TEXTSIZE = 24;
   
   // COLORS
   public color Background = color(140, 140, 140);
   public color Foreground = color(0, 0, 0);
   public color BackgroundSelected = color(160, 160, 160);
   public color Border = color(30, 30, 30);
   
   public boolean BorderEnable = false;
   public int BorderWeight = 1;
   
   public String Text = "";
   public int TextLength = 0;

   private boolean selected = false;
   
   //screen shake stuff
  int screenShakeAmountX = 0;
  int screenShakeAmountY = 0;
  int screenCounter = 0; 
  int screenCounter2 = 0; 
   
   TEXTBOX() {
      // CREATE OBJECT DEFAULT TEXTBOX
   }
   
   TEXTBOX(int x, int y, int w, int h) {
      X = x; Y = y; W = w; H = h;
   }
   
   void DRAW() {
     
     //screen shake stuff
     shakeScreen();
     int Xtemp = X;
     int Ytemp = Y;
     X = X + screenShakeAmountX;
     Y = Y + screenShakeAmountY;
     
      // DRAWING THE BACKGROUND
      if (selected) {
         fill(BackgroundSelected);
      } else {
         fill(Background);
      }
      
      if (BorderEnable) {
         strokeWeight(BorderWeight);
         stroke(Border);
      } else {
         noStroke();
      }
      
      rect(X, Y, W, H);
      
      // DRAWING THE TEXT ITSELF
      fill(Foreground);
      textSize(TEXTSIZE);
      text(Text, X + (textWidth("a") / 2), Y + TEXTSIZE);
      
      X = Xtemp;
      Y = Ytemp;
   }
   
   // IF THE KEYCODE IS ENTER RETURN 1
   // ELSE RETURN 0
   boolean KEYPRESSED(char KEY, int KEYCODE) {
       //screen shake
       screenShakeAmountX += 4;
       screenShakeAmountY += 4;
     
      if (selected) {
         if (KEYCODE == (int)BACKSPACE) {
            BACKSPACE();
         } else if (KEYCODE == 32) {
            // SPACE
            addText(' ');
         } else if (KEYCODE == (int)ENTER) {
            return true;
         } else {
            // CHECK IF THE KEY IS A LETTER OR A NUMBER
            boolean isKeyCapitalLetter = (KEY >= 'A' && KEY <= 'Z');
            boolean isKeySmallLetter = (KEY >= 'a' && KEY <= 'z');
            boolean isKeyNumber = (KEY >= '0' && KEY <= '9');
      
            if (isKeyCapitalLetter || isKeySmallLetter || isKeyNumber) {
               addText(KEY);
            }
         }
      }
      
      return false;
   }
   
   private void addText(char text) {
      // IF THE TEXT WIDHT IS IN BOUNDARIES OF THE TEXTBOX
      if (textWidth(Text + text) < W) {
         Text += text;
         TextLength++;
      }
   }
   
   private void BACKSPACE() {
      if (TextLength - 1 >= 0) {
         Text = Text.substring(0, TextLength - 1);
         TextLength--;
      }
   }
   
   // FUNCTION FOR TESTING IS THE POINT
   // OVER THE TEXTBOX
   private boolean overBox(int x, int y) {
      if (x >= X && x <= X + W) {
         if (y >= Y && y <= Y + H) {
            return true;
         }
      }
      
      return false;
   }
   
   void PRESSED(int x, int y) {
      if (overBox(x, y)) {
         selected = true;
      } else {
         selected = false;
      }
   }
   
   void shakeScreen() {
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
}
