PVector location; 
PVector velocity;  
PVector gravity;   
PImage[] cats = new PImage[7];
PImage cat1;
PImage cat2;

int score;

void setup() {
  size(640, 360);
  location = new PVector(100, 100);
  velocity = new PVector(3, 7);
  gravity = new PVector(0, 0.4);



  cats[0] = loadImage("../../catpics/grey-cat.png");
  cats[0].resize(100, 50);
  cats[1] = loadImage("../../catpics/blue-cat.png");
  cats[2] = loadImage("../../catpics/green-cat.png");
  cats[3] = loadImage("../../catpics/purple-cat.png");
  cats[4] = loadImage("../../catpics/blue-cat.png");
  cats[5] = loadImage("../../catpics/blue-cat.png");
  cats[6] = loadImage("../../catpics/blue-cat.png");
}

void draw() {
  background(255);
  image(cats[0], location.x, location.y);
  // image(cat2, location.x, 0);

  location.add(velocity);
  velocity.add(gravity);

  // Bounce off edges
  if ((location.x > width) || (location.x < 0)) {
    velocity.x = velocity.x * -1;
  }
  if (location.y > height) {
    velocity.y = velocity.y * -0.95; 
    location.y = height;
  }


  stroke(255);
  strokeWeight(2);
  fill(127);
  ellipse(location.x, location.y, 48, 48);
}
