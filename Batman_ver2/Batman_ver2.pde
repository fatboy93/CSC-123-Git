float x1,y1,x2,y2,t;

void setup()
{
    size (600,600);
    background(0);
    frameRate(10);
    x1 = 500; y1 = 500;
}

void draw()
{
  color c_b = color(random(255),random(255), random(255));
  color black = color(0);
    t=0;
   // background(255);
    pushMatrix();
    //translate(300,300);
    noStroke();
       // translate(x1,y1);
       translate(random(width), random(height));
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
    x1-= 5;
    y1-=5;
}