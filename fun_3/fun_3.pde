PVector v1, v2;
float curX;
float curY;
color[] b_c;
float rot, speed;
float change_color = 0;
color c_b1 = color(random(255), random(255), random(255));
boolean collide = false;
boolean ball_on = false, stop_game = false;
float bx, by;
int points;
int time = 700;
void setup()
{
  size(500,500);
  speed = 2.5;
   curX = width/2;
   curY = height/2;
    rot = 0;
    bx = random(50,width-50);
    by = random(50,height-50);
   // v2.x = .3*width;
    //v2.y = .3*height;
    points = 0;
}
void ball(float cx, float cy, float rad, color c)
{
    fill(c);
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
  if(time>0)
   { background(0);
    if(collide)
    {
       bx = random(50,width-50);
       by = random(50,height-50);
       c_b1 = color(random(255), random(255), random(255));
       collide = false;
       points++;
    }
    ///if(ball_on)
      ball(bx,by, 10, c_b1);
    if(pow(curX - bx,2) + pow(curY - by, 2) - 2*15*15 <= 0)
          collide = true;
        
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
     fill(255);    
     textSize(20);
     text("Points: ", 10,20 );
     text(points, 80,20);
     text("Time: ",410,20);
     text(time/60, 465,20);
     time--;
  }
   else
   {  
       pushMatrix();
         translate(width/2, height/2);
         textAlign(CENTER);
         fill(255);
         textSize(50);
         text("Game over!!!", 0, 0);
         textSize(40);
         text("Scores: ", 0, 50);
         text(points, 100,50);
       popMatrix();
   }
   
   
 
}