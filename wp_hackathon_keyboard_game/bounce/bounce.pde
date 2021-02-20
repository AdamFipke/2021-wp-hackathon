float locationX = 300;
float locationY = 50;
float vy = 0;
float vx = 0;
float gravity = 0.6;
float bounce = -1.5;
int var;


void setup() 
{
  size(640, 360);
  //smooth();
  noStroke();
}
void draw() 
{
  background(0);
  ellipse(locationX, locationY, 30, 30);

  vy += gravity;
  locationY += vy;
  if (locationY > height)
  {
    vy = vy*(bounce/1.5);
  }
  int var = (int)(random(0, 1));
  locationX += vx;
  vx += gravity/10;

  if (locationX > width) {
    vx = vx-2;
  }
  if (locationX < 0) {
    vx = vx +2;
  }
}
