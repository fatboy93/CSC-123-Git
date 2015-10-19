void setup()
{
  size(400,400);
  noLoop();
}

void draw()
{  
  for(int i=0; i<5; i++)
     drawSpiral(random(400),random(400), color(random(255), random(255), random(255)),
                 random(3,10), random(5,30),random(1,5)); 
}

void drawSpiral(float cx, float cy, color c, float numRings,
                float dotsPerRing, float inc)
{
    float x, y, rad =0, theta=0;
    //fill(c);
    stroke(c);
    for(int i=0; i<dotsPerRing*numRings; i++)
    {
      //draw the spiral with ellipses
        x = cx + rad*cos(theta);
        y = cy + rad*sin(theta);
        //ellipse(x,y,10,10);
       line(cx, cy, x,y);
        rad += inc;    //increase the rad
       theta += (2*PI)/dotsPerRing; 
    }

}      