float x1,y1,x2,y2,t;

void setup()
{
    size (600,600);
    background(255);
    frameRate(10);
    x1 = 500; y1 = 500;
}

void draw()
{
    t=0;
    background(255);
    pushMatrix();
    translate(300,300);
       // translate(x1,y1);
       //translate(random(width), random(height));
        stroke(random(255), random(255), random(255));
       // scale(random(.1,.4));
        //ellipse(0,0,300,100);
        strokeWeight(7);
        //stroke(255,0,0);
        arc(0,0,300,140,PI/2 + PI/4, 3*PI/2 - PI/6);
        arc(0,0,300,140,-PI/2 + PI/6, PI/4);
       // stroke(#9B5151);
        arc(-44,-60,60,70, PI/2 - PI/8, PI);
        arc(44,-60,60,70, 0, PI/2+PI/8);
       // stroke(#61C96E);
        line(-30,-28, -25, -75);
        line(30,-28,25, -75);
       // stroke(#1F2ADE);
        line(-25,-75, -15, -55);
        line(25,-75, 15, -55);
        //stroke(#8F1BDE);
        line(-15,-55,15,-55);
        //stroke(#E85823);
        arc(-80,62,60,70, PI+PI/8, 2*PI - PI/7);
        arc(-28,62,54.5,70, PI+PI/6, 2*PI);
        arc(28,62,54.5,70,PI, 2*PI - PI/6);
        arc(80,62,60,70,PI+PI/7,2*PI - PI/8);
    
    popMatrix();
    x1-= 5;
    y1-=5;
}