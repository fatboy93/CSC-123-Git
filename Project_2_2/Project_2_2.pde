float t, x, y, rad, count_t_r, count_s_r, count_t_l, count_s_l, count_b_l, count_b_r;
float count_t_m, count_s_m, count_b_m, count_buf, count_star;
boolean right, left, mid, buf, text_on;
float e = 2.7182818284590452353602874713527;
void setup()
{
  size(1000,650);
  background(#549AED);
  rad = 15;
  count_t_r = 0;
  count_s_r = 0;
  count_t_l = 0;
  count_s_l = 0;
  count_t_m = 0;
  count_s_m = 0;
  count_b_m = 0;
  y=0;
  count_buf = 0;
  buf = false;
  frameRate(300);
  right = false;
  left = false;
  mid = false;
  count_star = 0;
  text_on = true;
}

void drawStar(float center_x, float center_y,float rad_s, float scale_st)
{
  pushMatrix();
  translate(center_x,center_y);
  scale(scale_st);
noStroke();
  fill(#DAE03D);
  ellipse(0,0,rad_s*2,rad_s*2);
  float t=0;
  float x1, x2, x3, y1,y2,y3;
  for(int i=0; i<5;i++)
  {
      x1=rad_s * cos(t*PI);
      y1=rad_s * sin(t*PI);
      x2=rad_s*2 * cos(t*PI+PI/5);
      y2=rad_s*2 * sin(t*PI+PI/5);
      x3=rad_s * cos(t*PI+2*PI/5);
      y3=rad_s * sin(t*PI+2*PI/5);
      triangle(x1,y1,x2,y2,x3,y3);
      t=t+PI/8;
  }
  popMatrix();
}
void butterfly(float start_x, float start_y, float size_b)
{
     pushMatrix();
         translate(start_x, start_y);
         rotate(random(-PI/3, PI/3));
         scale(size_b);
        float t1=0;
        float x1,y1;
        color  c = color(random(255), random(255), random(255));
         fill(c);
         stroke(c);
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

void draw_half_circle(float start_x, float start_y,float end, float rad_cir, float inc,
                float rot)
{
   t=0;
   float x,y;
  //sin
  noFill();
  stroke(#1EAF3E);
  strokeWeight(3);
  pushMatrix();
  translate(start_x, start_y);
  rotate(rot);
  beginShape();
   for(int i=0; i<end; i+=inc)
  {
     x = .7*rad_cir*cos(t);
     y = -rad_cir*sin(t);
     curveVertex(x,y);
     t = t+PI/20;
  }
  endShape();
  popMatrix();
}
void draw_sin_1(float start_x, float start_y,float end, float rad_sin, float inc,
                float rot)
{
   t=0;
  //sin
  noFill();
  stroke(#1EAF3E);
  strokeWeight(2);
  pushMatrix();
  translate(start_x, start_y);
  rotate(rot);
  //fill(255,0,0);
  beginShape();
  for(int i=0; i<end; i+=inc)
  {
     curveVertex(-i,sin(t)*rad_sin);
     t = t+PI/25;
  }
  endShape();
  popMatrix();
}

void draw_sin_2(float start_x, float start_y, float end, float rad_sin, float inc,
                float rot)
{
   t=0;
  //sin
  noFill();
  stroke(#1EAF3E);
  strokeWeight(2);
  pushMatrix();
  translate(start_x, start_y);
  rotate(rot);
  //fill(255,0,0);
  beginShape();
  for(int i=0; i<end; i+=inc)
  {
     curveVertex(-i,-sin(t)*rad_sin);
     t = t+PI/25;
  }
  endShape();
  popMatrix();
}
void tree(float start_x, float start_y,float end, float y_t, float width_tree)
{
 // noFill();
  stroke(#3AE560,150);
  strokeWeight(4);
  translate(start_x, start_y);
  
  //fill(255,0,0);
  //beginShape();
  for(int i=0; i<end; i+=4)
  {
     quad(0,0,  width_tree,0,  width_tree,y_t ,0, y_t);
     
  }
 // endShape();
}

void right_tree()
{
    pushMatrix();
  translate(.76*width, .9*height);
  if(!right)
  {
    fill(#53552A);
    noStroke();
    ellipse(5,20, 30,10);
  }
  else
  {
    noStroke();
    fill(#5E5F47);
    ellipse(4,20, 50,28);
    fill(#3AE560);
    quad(-15, 25, 25,25, 10, -15, 0 , -15);
    
      if(count_t_r>=20 && count_s_r<310)
      {
          count_s_r++;
          draw_sin_1(+5,0, count_s_r, 12,4, PI/2);
          draw_sin_2(+6,0, count_s_r, 12,4, PI/2);
      }
      if(count_t_r < 285)
      {
          count_t_r++;
          tree(0,0,count_t_r, -count_t_r, 10);
          //quad(0,0, 30,0, 30,count ,0, count);
      }
      if(count_s_r>=285)
       {
         stroke(#1EAF3E);
         fill(#DAE03D, 90);
         strokeWeight(4);
         ellipse(6, -315, 25,50);
         fill(#1EAF3E);
         strokeWeight(1);
         triangle(-2, -340, 14, -340, 6, -360);
       }
  }
  popMatrix();
}

void left_tree()
{
   pushMatrix();
  translate(.15*width, .9*height);
  if(!left)
  {
    fill(#53552A);
    noStroke();
    ellipse(5,20, 30,10);
  }
  else
  {
    noStroke();
    fill(#5E5F47);
    ellipse(8,20, 80,40);
    fill(#3AE560);
    quad(-15, 25, 30,25, 20, -15, -3 , -15);
    
      if(count_t_l>=20 && count_s_l<460)
      {
          count_s_l++;
          draw_sin_1(+6,0, count_s_l, 13,3, PI/2);
          draw_sin_2(+9,0, count_s_l, 13,3,PI/2);
      }
      if(count_t_l < 340)
      {
          count_t_l++;
          tree(0,0,count_t_l, -count_t_l, 15);
         
      }
      if(count_s_l>=460)
       {
           
         stroke(#1EAF3E);
         strokeWeight(4);
         fill(#DAE03D, 90);
         ellipse(6, -380, 32,80);
         strokeWeight(1);
         fill(#1EAF3E);
         triangle(-2, -420, 14, -420, 6, -460);
         //left branche
         if(count_b_l<220)
             draw_sin_2(-2,-320,count_b_l++,50,10, PI/3.5);
         
         else
         {
           //left branch
             pushMatrix();
             //noStroke();
             translate(-95,-.75*height);
             rotate(-PI/3.5);
             fill(#DAE03D, 90);
             ellipse(2,2, 10,50);
             fill(#1EAF3E);
             ellipse(10,10, 15,80);
             popMatrix(); 
         }
         //right branch
         if(count_b_r <160)
             draw_sin_1(5,-330,count_b_r++,50,10, PI/2+PI/3);
         else
         {
             pushMatrix();
             //noStroke();
             translate(85,-.65*height);
             rotate(PI/3.5);
             fill(#DAE03D, 90);
             ellipse(10,10, 10,50);
             fill(#1EAF3E);
             ellipse(0,0, 15,80);
             popMatrix(); 
         }
         
       }
  }
  popMatrix();
}

void mid_tree()
{
         pushMatrix();
  translate(.5*width, .9*height);
  if(!mid)
  {
    fill(#53552A);
    noStroke();
    ellipse(5,20, 30,10);
  }
  else
  {
    noStroke();
     fill(#5E5F47);
     ellipse(7,20, 100,50);
    fill(#3AE560);
     quad(-15, 25, 30,25, 20, -15, -10 , -15);
    
    
      if(count_t_m>=20 && count_s_m<385)
      {
          count_s_m++;
          draw_sin_1(+5,0, count_s_m, 12,1,PI/2);
          draw_sin_2(+6,0, count_s_m, 12,1,PI/2);
      }
      if(count_t_m < 370)
      {
          count_t_m++;
          tree(0,0,count_t_m, -count_t_m, 10);
         
      }
      //mid branch
      if(count_s_m>=360)
       {
         if(count_b_m < 200)
         {
            draw_sin_1(0,-370, count_b_m++, 50,10,PI/2+PI/3);
            if(count_b_m<180)
            {
              //top branch
              draw_half_circle(-85, -410, count_b_m, 140, 10, PI/5);  // good
              //middle branch
              draw_half_circle(-85, -390, count_b_m, 125, 9, PI/8);//good
              //bottom branch
              draw_half_circle(-80, -350, count_b_m, 125, 10, 0); //good
            }
            
         }
        else
        {
          //right branch
            pushMatrix();
             translate(120,-.75*height);
             rotate(PI/2.7);
             fill(#DAE03D, 90);
             ellipse(10,-5, 15,50);
             fill(#1EAF3E);
             ellipse(0,0, 15,80);
             popMatrix(); 
         //left branches
           pushMatrix();
            translate(-120,-.75*height);
            quad(27,-36, 23,-43, -10, -45, 0,-10);
            quad(-22,30, -28, 22,-55, 20, -40, 55);
            quad(-22, 58, -28, 53, -55, 70, -30, 90);
            fill(#DAE03D);
            //bottom light
            pushMatrix();
              rotate(-PI/3);
              ellipse(-90,4,10, 25);  
            popMatrix();
            //mid light
            pushMatrix();
              rotate(-PI/6);
              ellipse(-60, 10, 10, 30);
            popMatrix();
            //top light
            pushMatrix();
              rotate(-PI/9.5);
              ellipse(5, -28, 10, 30);
            popMatrix();
            buf = true;
           popMatrix();
           
        }
        
       }
  }
  popMatrix();
}
void draw()
{
 
  //right tree
  right_tree();
  left_tree();
  mid_tree();
  if(buf && count_buf < 10)
  {
      butterfly(random(30,width/2),random(150,height-150), random(.1, .4));
       butterfly(random(width/2, width-30),random(150,height-150), random(.1, .4));
      count_buf++;
  }
  if(count_buf>=10 && count_star <= 20)
  {
      drawStar(random(10,width/2), random(5, 120), 3,random(.1,1));
      drawStar(random(width/2, width-100), random(5, 120), 3,random(.1,1));
      count_star ++;
  }
  
  //draw sun
  noStroke();
  fill(#DAE03D);
  ellipse(width-80,80, 100,100);
  fill(#549AED);
  ellipse(width-70, 70, 80,80);
  drawStar(width-80,55,5,1);
  if(text_on)
  {
     write_text();
  }

}
void write_text()
{
     fill(#EADC39);
  textSize(20);
  text("What are those dots??",200,100);
  text("Click it and you will see!!", 500,200);
  text("Save the best for last!!", 300, 500);
  text("Click the middle dot last!?!", 320, 540);
  
}

void mousePressed()
{
  if((pow(.76*width+6-mouseX,2)+pow(.9*height+20-mouseY,2)) <= 15*15)
  {
    right = true;
    if(text_on)
    background(#549AED);
    text_on = false;
  }
  if((pow(.15*width+6-mouseX,2)+pow(.9*height+20-mouseY,2)) <= 15*15)
  {
    left = true;
    if(text_on)
    background(#549AED);
    text_on = false;
  }
  if((pow(.5*width+6-mouseX,2)+pow(.9*height+20-mouseY,2)) <= 15*15)
  {
    mid = true;
    if(text_on)
    background(#549AED);
     text_on = false;
  }
}