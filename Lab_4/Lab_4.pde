float x,y;


void setup()
{
  size(520,500);
  background(150);
  x=-15*sqrt(3);
  y=-30;
  noLoop();
}

void draw_triangles(float x, float y)
{
   System.out.print("run2.\n");

  pushMatrix();
     translate(x,y);
     fill(#E0B012); //yellow
     triangle(0,0,0,-30,15*sqrt(3),-15);
     fill(#E3472C); //orange
     triangle(0,0, 15*sqrt(3),-15, 15*sqrt(3),15);
     fill(#B40B0E); //red
     triangle(0,0, 15*sqrt(3), 15, 0,30);
     fill(#323A64); //blue
     triangle(0,0,0,30,-15*sqrt(3),15);
     fill(#3D936A); //green
     triangle(0,0, -15*sqrt(3), 15, -15*sqrt(3), -15);
     fill(#F5DA81); //light yellow
     triangle(0,0, -15*sqrt(3),-15, 0,-30);
  popMatrix();
}
void draw()
{ 
  noStroke();
  int count=0;
  while(y <= height+15)
  {
       while(x <= width+15*sqrt(3))
       { 
         draw_triangles(x,y);
         x = x + 30*sqrt(3);
       }
      if(count %2 == 1)
         x = 0;
      else x = -15*sqrt(3);
      y = y+45;
      count++;
  }
 // save("Lab4.jpeg");
}