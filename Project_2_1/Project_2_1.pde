float n,d,rad_rose, rad_b, end, end2, cx, cy;
color c1,c2,c3,c4, c5;
boolean butterfly, rot_b, rose, start_rot, second;
float e = 2.7182818284590452353602874713527;
float ang, rad_e,  rad_st;


void setup()
{
  size(600,600);
  
  background(0);
   rad_rose = 50;
   n=7;
   d=8;
   end=0;
   frameRate(30);
   cx = -width/5;
   cy = 2*height/3;
   c1 = color(random(255),random(255), random(255));
   c2 = color(random(255),random(255), random(255));
   c3 = color(random(255),random(255), random(255));
   c4 = color(random(255),random(255), random(255));
   c5 = color(random(255),random(255), random(255));
   butterfly = false;
   rad_b = 5;
   rot_b=false;
   ang=0;
   rose = true;
   start_rot = false;
   second = false;
   rad_e = 10;
   rad_st=1;
   end2=0;
   
//  noLoop();
}
void draw_galaxy(float kx, float ky, float rad_st, float end2)
{
  float t=0;
  float sx,sy;
       for(int i=0; i<end2; i++)
       {
         sx = kx + rad_st*cos(t);
         sy = ky + rad_st*sin(t);
         pushMatrix();
           translate(sx,sy);
           drawStar(0,0,.5);
         popMatrix();
         t+=random(PI/20, PI/10);
         rad_st+=random(.1,.5);
       }
}
void drawStar(float center_x, float center_y,float rad)
{
noStroke();
  fill(240);
  ellipse(center_x,center_y,rad*2,rad*2);
  float t=0;
  float x1,y1,x2,y2,x3,y3;
  for(int i=0; i<5;i++)
  {
      x1=center_x + rad * cos(t*PI);
      y1=center_y + rad * sin(t*PI);
      x2=center_x + rad*2 * cos(t*PI+PI/5);
      y2=center_y + rad*2 * sin(t*PI+PI/5);
      x3=center_x + rad * cos(t*PI+2*PI/5);
      y3=center_y + rad * sin(t*PI+2*PI/5);
      triangle(x1,y1,x2,y2,x3,y3);
      t=t+PI/8;
  }
}
void draw_butterfly(float cx, float cy, float rad_b, color c, float ang)
{
  float x1, y1;
  float t1=0;
  
  stroke(c);
  pushMatrix();
  translate(cx,cy);
  if(rot_b)
      rotate(radians(ang));
    beginShape();
    for(int i=0; i<50; i++)
        {
            x1 = rad_b*(sin(t1))*(pow(e,cos(t1)) - 2*cos(4*t1) - pow(sin(t1/12),5));
            y1 = -rad_b*(cos(t1))*(pow(e,cos(t1)) - 2*cos(4*t1) - pow(sin(t1/12),5));
            curveVertex(x1,y1);
            t1 += PI/10;
        }
    endShape();
  popMatrix();
}
void draw_rose( float cx,float cy, float rad_rose, float n, float d, float end, color c)
{
     float x, y;
     float t=0;
     pushMatrix();
     translate(cx,cy);
     noFill();
     stroke(c);
     strokeWeight(.1);
     beginShape();
     for(int i=0; i<end; i++)
     {
         x = rad_rose*cos(n/d*t)*cos(t);
         y = rad_rose*cos(n/d*t)*sin(t);
         curveVertex(x,y);
         t += PI/10;
     }
     endShape();
    popMatrix();
}
void draw()
{
  if(rose)
   {  draw_rose(4*width/5, 4*height/5, rad_rose, n, d, end,c1);
     draw_rose(width/5, 4*height/5, rad_rose, n, d, end,c2);
     draw_rose(width/5, height/5, rad_rose, n, d, end,c3);
     draw_rose(4*width/5, height/5, rad_rose, n, d, end,c4);
   }
     
     if(end<170)
       end++;
     else
     {
       if(rad_rose<100)
         rad_rose+=3;
         else 
         butterfly = true;
     }
     if(butterfly)
       draw_butterfly(width/2, height/2,rad_b,c5, ang);
     
     if(butterfly && rad_b < 35)
           rad_b+=1;
     if(butterfly && rad_b>=35)
       {
           rad_rose+=random(-10,2);
           rot_b = true;
           ang+=2;
           if(ang > 300)
           {
             frameRate(180);
               rad_b+=10;
               c5 = (#FCF07A);
               if(rad_b>100)
               {
                 rose = false;
                 ang+=20;
               }
           }
            
       if(rad_b > 5000)
       {
         frameRate(60);
         butterfly = false;
         start_rot = false;
         background(0); 
         second = true;
       }
     }
     
     if(second)
     {
       //for(int i=0; i<10;i++)
         draw_galaxy(width/2, height/2, rad_st, end2);
         if(end2 < 700)
           end2++;
         
     }
       /*background(0);
         pushMatrix();
         translate(2*width/3,2*height/3);
         fill(#72D85E);
         ellipse(0,0, rad_e*2,rad_e*2);
         if(rad_e < 50)
             rad_e++;
         else
         {
           fill(#2A9AD1);
           triangle(-20,20, -30,-30, -10,10);
           triangle(30,30, 10, 20, 30, 35);
           triangle(30,-30, 10, -0, 10, 10);
         }
         popMatrix();*/
     
     
}

void mousePressed()
{
      start_rot = true;
}