float r,g,b;
float x,y;

void setup()
{
  size(600,600);
  background(#F5F4ED);
  //x = random(30, width-30);  //set the value of x,y
 // y = random(height-60);
}



void draw()
{
  //rotate(-PI/3);
  x=150; y=100;
  //translate(x,y);
  fill(#582501);
  arc(x,y,150,150,PI,2*PI);
  triangle(x-10,y-60, x, y-85, x+10, y-60);
  fill(#F5F4ED);
  noStroke();
  arc(x-55,y, 39, 15, PI, 2*PI);
  arc(x-20,y, 40, 15, PI, 2*PI);
  arc(x+20,y, 40, 15, PI, 2*PI);
  arc(x+55,y, 39, 15, PI, 2*PI);
  
  stroke(#BCD329);
  strokeWeight(2);
  line(x+5, y-5, x+5, y+60);
  noStroke();
  
  //background(#F5F4ED);
 
 // pushMatrix();
   /* raindrops
    strokeWeight(2);  //create thickness for the raindrop
    stroke(#3EBFAE);  //fill the color for the raindrop
   // fill(#3EBFAE);
   for(x = random(30, width-30),y = random(height-60);
       x<width-30 && y<height-60; x++, y++)
      line(x, y, x+30, y+60);  //draw the line - raindrop
     */ 
 // popMatrix();

  
}