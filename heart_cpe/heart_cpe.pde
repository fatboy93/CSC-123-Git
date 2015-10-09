float x1,y1,t1,t2,x2,y2, temp;
float temp_x1, temp_y1;

void setup()
{
    size(600,600);
    background(0);
    t1=0;
    //noLoop();
    frameRate(10);
    temp = 0;
}

void draw()
{
  pushMatrix();
    translate(random(width),random(height));
    //translate(200,200);
    scale(1,1.5);
    stroke(random(255), random(255), random(255));
    for(int i=0; i<25; i++)
    {
      x1 = 16*pow(sin(t1),3);
      y1 = -( 13*cos(t1) - 5*cos(2*t1) - 2*cos(3*t1) - cos(4*t1));
      t2 = t1+PI/12;
      x2 = 16*pow(sin(t2),3);
      y2 = -(13*cos(t2) - 5*cos(2*t2) - 2*cos(3*t2) - cos(4*t2));
      line(x1,y1,x2,y2);
      //strokeWeight(3);
      temp = t1;
      temp_x1 = x1;
      temp_y1 = y1;
    
      while(t1<t2)
      { 
         x1 = 16*pow(sin(t1),3);
         y1 = -( 13*cos(t1) - 5*cos(2*t1) - 2*cos(3*t1) - cos(4*t1));
         line(0,-6.5,x1,y1);
         t1 +=.1; 
      }
      t1 = temp;
      x1 = temp_x1;
      y1 = temp_y1;
      t1 += PI/12;
    }
    popMatrix();
}