public class Cat {
  PVector location; 
  PVector velocity;  
  PVector gravity;
  PImage cat;
  int c = 0;
  Cat(PImage cat) {
    this.cat = cat;
    this.cat.resize(100,50);
    this.location = new PVector(100, 100);
    this.velocity = new PVector(3, 7);
    this.gravity = new PVector(0, 0.4);
  }
  void display() {
    image(cat, this.location.x, this.location.y);
    c++;
  }
  void move(){
     location.add(velocity);
  velocity.add(gravity);

  // Bounce off edges
  if ((this.location.x > width) || (this.location.x < 0)) {
    this.velocity.x = this.velocity.x * -1;
  }
  if (this.location.y > height) {
    this.velocity.y = this.velocity.y * -0.95; 
    this.location.y = height;
    
  }
    
  }
}
