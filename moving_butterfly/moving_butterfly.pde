float e =  2.7182818284590452353602874713527;
PVector v1;
float speed, curX, curY, rot;
boolean move;
color  c_b1, c_b2, c_b3;
color c_b = color(random(255),random(255), random(255));
void setup()
{
    size(600,600);
    background(0);
    //noLoop();
    speed = 2.5;
    curX = width/2;
    curY = height/2;
    move = false;
    rot=0;
    c_b1 = color(random(255), random(255), random(255));
    c_b2 = color(random(255), random(255), random(255));
    c_b3 = color(random(255), random(255), random(255));
}

void batman(float start_x, float start_y)
{
   
  color black = color(0);
    float t=0;
   // background(255);
    pushMatrix();
    //translate(300,300);
    noStroke();
       // translate(x1,y1);
       translate(start_x, start_y);
        if(move)
         {
           if(v1.x >0)
             rotate(rot+PI/2);
           else
             rotate(rot-PI/2);
         }
       
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
void butterfly(float start_x, float start_y, float size_b, color c1)
{
     pushMatrix();
         translate(start_x, start_y);
         if(move)
         {
           if(v1.x >0)
             rotate(rot+PI/2);
           else
             rotate(rot-PI/2);
         }
         
         scale(size_b);
        float t1=0;
        float x1,y1;
         fill(c1);
         stroke(c1);
         beginShape();
         for(int j=0; j<43; j++)
         {
            x1 = 10*(sin(t1))*(pow(e,cos(t1)) - 2*cos(4*t1) - pow(sin(t1/12),5));
            y1 = -10*(cos(t1))*(pow(e,cos(t1)) - 2*cos(4*t1) - pow(sin(t1/12),5));
            t1+=PI/20;
            curveVertex(x1,y1);
         } 
         endShape();
       popMatrix();
}
void draw()
{
  background(0);
  fill(255);
 ellipse(width/2, height/2, 200,200);
  if(move)
  {
    
    v1 = new PVector(mouseX - curX, mouseY-curY);
    v1.normalize();
    v1.mult(speed);
    rot = atan((mouseY-curY)/(mouseX-curX));
    if(pow(curX - width/2,2)+pow(curY-height/2,2)-100*100 < 0)
      curX += v1.x;
      curY += v1.y;
  }
    pushMatrix();
       // translate(curX, curY);
        batman(curX +80, curY);
        butterfly(curX, curY, .5, c_b1);
        butterfly(curX+30, curY-30, .7, c_b2);
        butterfly(curX-20, curY+30, .3, c_b3);
        
    popMatrix();
   
   
   
  
   if(curX > width-20 || curX < 20)
       v1.x = -v1.x;
   if(curY > height-20 || curY < 20)
       v1.y = -v1.y;
       
}

void mousePressed()
{
    move = true;
   // v1 = new PVector(mouseX - curX, mouseY-curY);
   // v1.normalize();
   // v1.mult(speed);
   // rot = atan((mouseY-curY)/(mouseX-curX));
    //println(rot);
}

void mouseDragged()
{
    v1 = new PVector(mouseX - curX, mouseY-curY);
    v1.normalize();
    v1.mult(speed);
    rot = atan((mouseY-curY)/(mouseX-curX));
}