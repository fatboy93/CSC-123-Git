float r,g,b;
float x,y;

void setup()
{
  size(400,400);
  background(#F5F4ED);
  //x = random(30, width-30);  //set the value of x,y
 // y = random(height-60);
}



void draw()
{
  //x=100;
 // y=100;
 //Draw the umbrella - rotated
  pushMatrix();
      translate(100,90);  //origin at 100,100
      rotate(-PI/9);    //rotate when done with verical
      //x=50; y=150;
      
      
      //translate(x,y);
      fill(#582501); //fill brown
      //arc(x,y,150,150,PI,2*PI);
      arc(0,0,150,150,PI,2*PI);  //big arc
      //triangle(0-10,y-60, x, y-85, x+10, y-60);
      triangle(-10,-60, 0, -85, 10, -60);  //top of umbrella
      fill(#F5F4ED);  //fill color backgound
      noStroke();
      //arc(x-55,y, 39, 15, PI, 2*PI);
      //arc(x-20,y, 40, 15, PI, 2*PI);
      //arc(x+20,y, 40, 15, PI, 2*PI);
      //arc(x+55,y, 39, 15, PI, 2*PI);
      //small arc at background color for waving 
      arc(-55,0, 39, 15, PI, 2*PI);
      arc(-20,0, 40, 15, PI, 2*PI);
      arc(+20,0, 40, 15, PI, 2*PI);
      arc(+55,0, 39, 15, PI, 2*PI);
      
      //draw the handle of the umbrella
      stroke(#BCD329);
      strokeWeight(2);
      //line(x+5, y-5, x+5, y+60);
      line(+5, -5, +5, +75);
      line(+5, +75, -2, +80);
      line(-2, 80, -7, 75);
      noStroke();
      
      //draw the hand of the man
      fill(#ED6E6E);
      rect(0,54,10,19);
      ellipse(7,54,5,5);
      ellipse(0,56,6,4);
      ellipse(0,61,6,4);
      ellipse(0,66,6,4);
      ellipse(0,71,6,4);
     
      rect(0,30,10,19);
      ellipse(0,30,5,6);
      ellipse(0,32,6,4);
      ellipse(0,37,6,4);
      ellipse(0,42,6,4);
      ellipse(0,47,6,4);
      
      //draw hat
      fill(#5FA5A3);  //top 
      rect(25,6,35,15);
      fill(0);
      ellipse(43,22,35,2);  //the line
      fill(#5FA5A3);
      ellipse(40,25,60,4);  //bottom of hat
      
      //draw face
      fill(#ED6E6E);      //match with hand
      rect(25,27,35,32);  //face
      ellipse(23,44,14,5);//nose
      fill(#F5F4ED);      //fill background color
      ellipse(23,52,10,4);//mouth
      fill(#582501);  //hair
      rect(40,27,20,12);
      rect(50,37,10,10);
      fill(#ED6E6E);  //match with face
      ellipse(48,40,6,8);  //ear
      
      //scarf
      fill(#D6D851);
      rect(68,65,45,20);
      arc(20,63,15,15,PI/2,2*PI-PI/6); 
      fill(#F5F4ED);
      ellipse(112,71,3,10);
      ellipse(100,65,15,3);
      
      //draw body
      fill(#5FA5A3); //match with hat
      rect(18,58,50,130);
      rect(0,80,20,50);
      strokeWeight(6);
      stroke(#5FA5A3);
      line(17,75,3,85);
      noStroke();
   popMatrix();
   
     translate(100,90);
      //lower body
      quad(140, 140, 80,140, 50, 205, 115,205);  
      quad(115,205,50,205, 50, 220, 105,220);
      
      //front leg
      fill(#551C00);
      rect(-20,220,33,40);
      arc(-4,260,33,6,0,PI);
      rect(-40,268, 48,15);
      fill(#F5F4ED);
     // arc(-40,
      
      
      
      
      
      
 
      
      
      
   //popMatrix();
  
  //Draw the man.
  
    
    
    
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