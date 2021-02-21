PVector location; 
PVector velocity;  
PVector gravity;   
PImage[] cats = new PImage[6];
PImage cat1;
PImage cat2;
int p = 1;
int i = 0;
float score = 0;
Cat c1;
Cat c2;
Cat c3;
Cat c4;
Cat c5;
Cat c6;

void setup() {
  size(1000, 1000);
  location = new PVector(100, 100);
  velocity = new PVector(3, 7);
  gravity = new PVector(0, 0.4);
  c1 = new Cat(loadImage("../../catpics/grey-cat.png"));
  c2 = new Cat(loadImage("../../catpics/blue-cat.png"));
  c3 = new Cat(loadImage("../../catpics/green-cat.png"));
  c4 = new Cat(loadImage("../../catpics/purple-cat.png"));
  c5 = new Cat(loadImage("../../catpics/yellow-cat.png"));
  c6 = new Cat(loadImage("../../catpics/pop-cat.png"));
  
}




void draw() {
  background(170);




  if (score >= 5) {
    c1.display();
    c1.move();
    score = score + 0.1;
  }
  if (score >= 10) {
    c2.display();
    c2.move();
  }
  if (score >= 15) {
    c3.display();
    c3.move();
  }
  if (score >= 20) {
    c4.display();
    c4.move();
  }
  if (score >= 26) {
    c5.display();
    c5.move();
  }

  if (score >= 30) {
    c6.display();
    c6.move();
  }



}
