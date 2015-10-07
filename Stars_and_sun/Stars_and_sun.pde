//Stars code

float center_x,center_y;
float x1,x2,x3,y1,y2,y3;
float diam, rad;
float t;

void setup() {
  background(0);
  size(400,400);
  center_x = random(width);
  center_y = random(height);
  diam = 15;
  rad = diam/2;
  frameRate(30);
  //noLoop();
}


void draw() {
  //background(0);
      center_x = random(width);
      center_y = random(height);
  //for(int i=0; i<200;i++)
  
    pushMatrix();
        translate(random(width), random(height));
        scale( random(.1,.7));
        drawStar(center_x, center_y, diam, rad);
    popMatrix();
    pushMatrix();
        translate(random(width), random(height));
        scale( random(.1,.7));
        drawSun(center_x, center_y, diam, rad); 
    popMatrix();
  
}

void drawSun(float center_x,float center_y,float diam,float rad)
{
noStroke();
  //fill(200,200,50);
    fill( random(255), random(255), random(255));
  ellipse(center_x,center_y,diam,diam);
  t=0;

  for(int i=0; i<10;i++)
  {
      x1=center_x + (rad+2)* cos(t*PI);
      y1=center_y + (rad+2) * sin(t*PI);
      x2=center_x + diam * cos(t*PI+PI/20);
      y2=center_y + diam * sin(t*PI+PI/20);
      x3=center_x + (rad+2) * cos(t*PI+2*PI/10);
      y3=center_y + (rad+2) * sin(t*PI+2*PI/10);
      triangle(x1,y1,x2,y2,x3,y3);
      t=t+PI/15.5;
  }
}

void drawStar(float center_x, float center_y, float diam,float rad)
{
noStroke();
  fill( random(255), random(255), random(255));
  ellipse(center_x,center_y,diam,diam);
  t=0;

  for(int i=0; i<5;i++)
  {
      x1=center_x + rad * cos(t*PI);
      y1=center_y + rad * sin(t*PI);
      x2=center_x + diam * cos(t*PI+PI/5);
      y2=center_y + diam * sin(t*PI+PI/5);
      x3=center_x + rad * cos(t*PI+2*PI/5);
      y3=center_y + rad * sin(t*PI+2*PI/5);
      triangle(x1,y1,x2,y2,x3,y3);
      t=t+PI/8;
  }
}