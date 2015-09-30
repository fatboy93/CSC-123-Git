float r,g,b;
float x=0,y=0,cx,cy, scale_factor = 1;

void setup()
{
  size(400,400);
  background(#F5F4ED);
  frameRate(35);
  //noLoop();
  //x = random(30, width-30);  //set the value of x,y
 // y = random(height-60);
}



void draw()
{
  background(#F5F4ED);
  //x=100;
 // y=100;
 //Draw the umbrella - rotated
 
  pushMatrix();
      translate(x,y);  //important to make body move forward
      translate(300,90);  //origin at 100,100
      scale(.5);
      rotate(-PI/9);    //rotate when done with verical
      //x=50; y=150;
      
      
      //translate(x,y);
      fill(#582501); //fill brown
      //arc(x,y,150,150,PI,2*PI);
      arc(0,0,150,150,PI,2*PI);  //big arc
      //triangle(0-10,y-60, x, y-85, x+10, y-60);
      noStroke();
      triangle(-10,-60, 0, +85, +10, -60);  //top of umbrella
      fill(#F5F4ED);  //fill color backgound
      //noStroke();
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
      line(-2, +80, -7, +75);
      noStroke();
      
      //draw the hand of the man
      fill(#ED6E6E);
      rect(0, +54,+10,+19);
      ellipse(+7,+54, 5, 5);
      ellipse(0,+56, 6, 4);
      ellipse(0,+61, 6, 4);
      ellipse(0,+66, 6, 4);
      ellipse(0,+71, 6, 4);
     
      rect(0,30,10,19);
      ellipse(0,+30,5,6);
      ellipse(0,+32,6,4);
      ellipse(0,+37,6,4);
      ellipse(0,+42,6,4);
      ellipse(0,+47,6,4);
      
      //draw hat
      fill(#5FA5A3);  //top 
      rect(+25,+6,35,15);
      fill(0);
      ellipse(+43,+22,35,2);  //the line
      fill(#5FA5A3);
      ellipse(+40,+25,60,4);  //bottom of hat
      
      //draw face
      fill(#ED6E6E);      //match with hand
      rect(+25,+27,35,32);  //face
      ellipse(+23,+44,14,5);//nose
      fill(#F5F4ED);      //fill background color
      ellipse(+23,+52,10,4);//mouth
      fill(#582501);  //hair
      rect(+40,+27,20,12);
      rect(+50,+37,10,10);
      fill(#ED6E6E);  //match with face
      ellipse(+48,+40,6,8);  //ear
      
      //scarf
      fill(#D6D851);
      rect(+68,+65,45,20);
      arc(+20,+63,15,15,PI/2,2*PI-PI/6); 
      fill(#F5F4ED);
      ellipse(+112,+71,3,10);
      ellipse(+100,+65,15,3);
      
      //draw body
      fill(#5FA5A3); //match with hat
      rect(+18,+58,50,130);
      rect(0,+80,20,50);
      strokeWeight(9);
      stroke(#5FA5A3);
      line(+17,+75,+4,+85);
      noStroke();
      
   popMatrix();
   
   pushMatrix();
      translate(x,y);
      translate(300,90);
      scale(.5);
      //lower body
      quad(+140, +140, +80,+140, +50, +205, +115,+205);  
      quad(+115,+205,+50,+205, +50, +220, +105,+220);
      //clear back
      fill(#F5F4ED);
      rect(+125,+140,15,40);
      
      strokeWeight(8);
      stroke(#5FA5A3);
      line(+120,+140,+160,+180);
      line(+160,+180,+145,+200);
      noStroke();
      
      //front leg
      fill(#551C00);
      rect(+52,+220,33,40);//leg
      arc(+68,+260,33,6,0,PI);//curve near leg
      rect(+36,+268, 44,15);//shoe
      ellipse(+34,+278,8,9);//curve in front
      fill(#F5F4ED);
      ellipse(+67,+268, 20,4);//curve for shoe
      strokeWeight(5);
      stroke(#F5F4ED);
      line(+50,+268,+35,+270);//front of shoe
      noStroke();
      fill(#F5F4ED);
      ellipse(+60,+283,26,6);
      
      //back leg
      fill(#551C00);
      quad(+125,+160, +116,+205, +140,+230,+150,+207); 
      quad(+149,+207,+139,+230, +170,+240,+180,+215);
      //shoe  ->reuse the shoe above
      pushMatrix();
          //translate(x,y);
          rotate(-PI/2.9);    //adjust rotation and translate to fit the back leg
          translate(-185,-4);
          rect(36,268, 44,15);//shoe
          ellipse(34,278,8,9);//curve in front
          fill(#F5F4ED);
          ellipse(67,268, 20,4);//curve for shoe
          strokeWeight(5);
          stroke(#F5F4ED);
          line(50,268,35,270);//front of shoe
          noStroke();
          fill(#F5F4ED);
          ellipse(60,283,26,6);
      popMatrix();
   popMatrix();
   
   x-=random(-1,4);
   y += random(-3,3);
   //Raindrops
   
       //raindrops
        strokeWeight(2);  //create thickness for the raindrop
        stroke(#3EBFAE);  //fill the color for the raindrop
       // fill(#3EBFAE);
       for(int i=0; i<120; i++)
       {
         cx = random(0, width-30);
         cy = random(height-60);
         line(cx, cy, cx+30, cy+60);  //draw the line - raindrop
       }
       
       //cx+=30;
       //cy+=30;
      // y = height;
       for(int i=0; i<15; i++)
       {
         cx = random(width);
         line(cx,height-20, cx+10, height-60);
         cx = random(width);
         line(cx,height, cx+20, height-40);
       }
       noStroke();
       
       //background(#F5F4ED);
save("Lab2_output.jpg");
}

void mousePressed()
{
 // x+=20;
 // background(#F5F4ED);
  /*
    //raindrops
        strokeWeight(2);  //create thickness for the raindrop
        stroke(#3EBFAE);  //fill the color for the raindrop
       // fill(#3EBFAE);
       for(int i=0; i<120; i++)
       {
         x = random(0, width-30);
         y = random(height-60);
         line(x, y, x+30, y+60);  //draw the line - raindrop
       }
       
       
       y = height;
       for(int i=0; i<15; i++)
       {
         x = random(width);
         line(x,height-20, x+10, height-60);
         x = random(width);
         line(x,height, x+20, height-40);
       }
       noStroke();*/
       //background(#F5F4ED);
       
}