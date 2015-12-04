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


  

void visualBlast(){
  
    pushMatrix();
      translate(x_b, y_b);
      rotate(gun_heading.heading());
      smooth();
      noStroke();
      fill(255,0,0);
      ellipse(0,0,75,15);
      fill(255);
      ellipse(0,0,50,10);
    popMatrix();
}