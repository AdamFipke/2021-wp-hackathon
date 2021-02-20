PVector location; 
PVector velocity;  
PVector gravity;   

void setup() {
  size(640,360);
  location = new PVector(100,100);
  velocity = new PVector(3,7);
  gravity = new PVector(0,0.4);

}

void draw() {
  background(0);
  
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
  ellipse(location.x,location.y,48,48);
}
