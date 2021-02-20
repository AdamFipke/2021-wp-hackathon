float locationX = 300;
float locationY = 50;
float vy = 0;
float vx = 0.1;
float gravity = 0.6;
float bounce = -1.5;
int var;


void setup() 
{
  size(640, 360);
  smooth();
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




  if (locationX >=300) {
    vx += .1;
    locationX += vx;
  }
  if (locationX<300) {
    vx -= .1;
    locationX += vx;
  }
  if(locationX < 0 || locationX > width){
   // vx*= -0.9;
   // vx*=(bounce/1.6);
   vx*=-0.9;
    println(vx);
  }



  if (locationX > width) {
  vx = vx-2;
  }
  if (locationX < 0) {
    vx = vx +2;
  }
}
