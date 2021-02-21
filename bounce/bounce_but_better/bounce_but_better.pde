PVector location; 
PVector velocity;  
PVector gravity;   
PImage[] cats = new PImage[6];
PImage cat1;
PImage cat2;
int p = 1;
int i = 0;
int score = 0;

void setup() {
  size(640, 360);
  location = new PVector(100, 100);
  velocity = new PVector(3, 7);
  gravity = new PVector(0, 0.4);



  cats[0] = loadImage("../../catpics/grey-cat.png");
  cats[0].resize(100, 50);
  cats[1] = loadImage("../../catpics/blue-cat.png");
  cats[1].resize(100, 50);
  cats[2] = loadImage("../../catpics/green-cat.png");
  cats[2].resize(100, 50);
  cats[3] = loadImage("../../catpics/purple-cat.png");
  cats[3].resize(100, 50);
  cats[4] = loadImage("../../catpics/yellow-cat.png");
  cats[4].resize(100, 50);
  cats[5] = loadImage("../../catpics/pop-cat.png");
  cats[5].resize(100, 50);
}

 
public Class Cat(){
}

void draw() { //<>//
  background(255);
  

  //  switch(score){
    // case 3: image(cats[0], location.x, location.y);
     //case 6: image(cats[1], location.x, location.y); break;
     //case 9: image(cats[2], location.x, location.y); break;
   
      
    //}
    if(score >= 3){
      image(cats[0], location.x, location.y-50);
    }
    if(score >= 6){
      image(cats[1], location.x-100, location.y-50);
      
    }
 

  
  location.add(velocity);
  velocity.add(gravity);

  // Bounce off edges
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
}
