PVector v1, v2;
float curX;
float curY;
color[] b_c;
float rot, speed;
float change_color = 0;
color c_b1 = color(random(255), random(255), random(255));
boolean collide = false;
boolean ball_on = false;
void setup()
{
  size(500,500);
  speed = 2.5;
   curX = width/2;
   curY = height/2;
    rot = 0;
}
void ball(float cx, float cy, float rad)
{
    fill(random(255),random(255), random(255));
    ellipse(cx,cy,rad*2, rad*2);
}
void batman(float start_x, float start_y, color c_b)
{
   
  color black = color(0);
    float t=0;
   // background(255);
    pushMatrix();
    //translate(300,300);
    noStroke();
       // translate(x1,y1);
       translate(start_x, start_y);
        //if(move)
         //{
           if(v1.x >0)
             rotate(rot+PI/2);
           else
             rotate(rot-PI/2);
       //  }
       
       // stroke(random(255), random(255), random(255));
       scale(.2);
       fill(c_b);
        ellipse(0,0,300,140);
       
        fill(black);
        arc(-44,-60,60,70, PI/2 - PI/8, PI+PI/3);
        arc(44,-60,60,70, -PI/3, PI/2+PI/8);
       // stroke(#61C96E);
        line(-30,-28, -25, -75);
        line(30,-28,25, -75);
       // stroke(#1F2ADE);
        line(-25,-75, -15, -55);
        line(25,-75, 15, -55);
        //stroke(#8F1BDE);
        line(-15,-55,15,-55);
        //stroke(#E85823);
        fill(black);
      
       noStroke();
        ellipse(-80,62,60,70);
         ellipse(-28,62,57,70);
         ellipse(28,62,57,70);
         ellipse(80,62,60,70);
       //top
       fill(black);
       triangle(-32,-25, -49,-70, -25,-70);
       triangle(32,-25,49,-70,25,-70);
       fill(c_b);
       triangle(-30,-28, -25, -80, -15,-55);
       triangle(30,-28,25,-80,15,-55);
       //head
       fill(black);
       quad(-15,-55,-25, -80, 25,-80, 15,-55);
       
    popMatrix();
}

void draw()
{
  background(0);
  if(ball_on)
  {
    v2.x = random(10,width-10);
    v2.y = random(10,height-10);
    ball(v2.x, v2.y, 10);
    ball_on = false;
  }
  //if(pow(v1.x - v2.x,2) + pow(v1.y - v2.y, 2) - rad*rad <= 0)
      
      
    v1 = new PVector(mouseX - curX, mouseY-curY);
    v1.normalize();
    v1.mult(speed);
    rot = atan((mouseY-curY)/(mouseX-curX));
    //if(pow(curX - width/2,2)+pow(curY-height/2,2)-100*100 < 0)
      curX += v1.x;
      curY += v1.y;
  //}
  if(change_color++ % 60 == 0)
      c_b1 = color(random(255),random(255), random(255));
    pushMatrix();
       // translate(curX, curY);
        batman(curX, curY, c_b1);
       // butterfly(curX, curY, .5, c_b1);
        //butterfly(curX+30, curY-30, .7, c_b2);
       // butterfly(curX-20, curY+30, .3, c_b3);
        
    popMatrix();

  
   if(curX > width-20 || curX < 20)
       v1.x = -v1.x;
   if(curY > height-20 || curY < 20)
       v1.y = -v1.y;
   
}