float x1,y1,t, rad1, rad2, rad,t1, rot;
float e = 2.7182818284590452353602874713527;
color c;
void setup()
{
    size(600,600);
    background(0);
    rad1 = 1;
    rad2 = 1;
    rad = 5;
    rot=0;
    frameRate(150);
}

void draw()
{
    t = 0;
    pushMatrix();
        translate(width/2, height/2);
        rotate(radians(rot++));
        noFill();
        stroke(random(255),random(255), random(255));
        beginShape();
        for(int i=0; i<43; i++)
        {
            x1 = rad1*pow(cos(t),3);
            y1 = rad2*pow(sin(t),3);
            curveVertex(x1,y1);
            t += PI/20;
        }
        endShape();
    popMatrix();
    if(rad1<750)
     {
       rad1 ++;
       rad2 ++;
       if((rad1 > 500 && rad1 <505) || (rad1 >600 && rad1 < 605) || 
          (rad1 >700 && rad1<705))
       {
         pushMatrix();
         translate(random(50, width-50), random(50, height-50));
         rotate(random(-PI/3, PI/3));
         t1=0;
         
         c = color(random(255), random(255), random(255));
         fill(c);
         stroke(c);
         beginShape();
         for(int j=0; j<43; j++)
         {
            x1 = rad*(sin(t1))*(pow(e,cos(t1)) - 2*cos(4*t1) - pow(sin(t1/12),5));
            y1 = -rad*(cos(t1))*(pow(e,cos(t1)) - 2*cos(4*t1) - pow(sin(t1/12),5));
            t1+=PI/20;
            curveVertex(x1,y1);
         } 
         endShape();
       popMatrix();
       }
     }
     else
      noLoop();
     
    save("Lab5.jpeg"); 
}  