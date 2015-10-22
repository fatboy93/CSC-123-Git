float cx, cy;
void setup()
{
    size(500, 500);
    cx = width/2;
    cy = height/2;
    noLoop();
}
void spiderWeb(float x, float y, float cx, float cy, float rad, color c, float theta)
{
     beginShape();
    for(int i=0; i<100; i++)
    {
        x = cx + rad*cos(theta);
        y = cy + rad*sin(theta);
      
        stroke(c);
       line(x,y,cx,cy);
        curveVertex(x,y);
        ellipse(x,y,10,10);
        rad += random(2,4);
        theta += 2*PI/20;
    }
    endShape();
}
void draw()
{
   // fill(random(255), random(255), random(255));
   noFill();
   color c1 = color(random(255), random(255), random(255));
    color c2 = color(random(255), random(255), random(255));
  
   
    float x,y,x1, y1, rad=5, theta=0;
    float rad2 = 8;
   
    
     beginShape();
    stroke(c2);
    for(int i=0; i<100; i++)
    {
        x1 = cx + rad2*cos(theta+PI/30);
        y1 = cy + rad2*sin(theta+PI/30);
        line(x1,y1,cx,cy);
        curveVertex(x1,y1);
         ellipse(x1,y1,10,10);
       // strokeWeight(random(1,30));
        rad2 +=random(2,4);
        theta += 2*PI/20;
    }
    endShape();
}

void mousePressed()
{

}