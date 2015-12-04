color c = color(0);
float x_b = 0;
float y_b = 0;
float speed_b = 30;
boolean moving;
boolean shoot = false;
/*
void setup() {
  size(1000,500);
  moving = false;
}
*/
/*
void draw() {
  background(255);
  move();
  if(shoot){
visualBlast();
  }
 }

*/

void move() {
  if(moving==false && x_b < 1500)
      x_b = x_b + speed_b*2.5*gun_heading.x;
      println(y_b);
  }
  

void visualBlast(){
  
    pushMatrix();
      rotate(gun_heading.heading());
      smooth();
      noStroke();
      fill(255,0,0);
      ellipse(x_b,y_b,75,15);
      fill(255);
      ellipse(x_b,y_b,50,10);
    popMatrix();
}