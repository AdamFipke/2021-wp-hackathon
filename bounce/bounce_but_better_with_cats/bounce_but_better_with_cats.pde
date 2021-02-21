PVector location; 
PVector velocity;  
PVector gravity;   
PImage[] cats = new PImage[6];
PImage cat1;
PImage cat2;
int p = 1;
int i = 0;
int score = 0;
Cat c1;
Cat c2;
Cat c3;
Cat c4;
Cat c5;
Cat c6;

void setup() {
  size(360,640);
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
  background(255);




   if (score >= 3) {
     c1.display();
     c1.move();
  }
  if(score >= 6){
    c2.display();
    c2.move();
  }
  if(score >= 9){
    c3.display();
    c3.move();
  }
  if(score >= 12){
    c4.display();
    c4.move();
  }
  if(score >= 15){
    c5.display();
    c5.move();
  }
  
  //if(game DONE)
  //c6.display();
  //c6.move();
  



  location.add(velocity);
  velocity.add(gravity);

//   Bounce off edges
 if ((location.x > width) || (location.x < 0)) {
   velocity.x = velocity.x * -1;
  }
  if (location.y > height) {
    velocity.y = velocity.y * -0.95; 
    location.y = height;
    score++;
  }


  stroke(255);
  strokeWeight(2);
  fill(127);
  ellipse(location.x, location.y, 48, 48);
  println(score);
  score++;
}
