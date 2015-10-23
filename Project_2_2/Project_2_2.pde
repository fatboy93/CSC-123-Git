float t, x, y, rad, count_t_r, count_s_r, count_t_l, count_s_l, count_b_l, count_b_r;
float count_t_m, count_s_m;
boolean right, left, mid;
void setup()
{
  size(800,650);
  background(#549AED,200);
  rad = 15;
  count_t_r = 0;
  count_s_r = 0;
  count_t_l = 0;
  count_s_l = 0;
  count_t_m = 0;
  count_s_m = 0;
  y=0;
  frameRate(300);
  right = false;
  left = false;
  mid = false;
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
  translate(.8*width, .9*height);
  if(!right)
  {
    fill(#53552A);
    noStroke();
    ellipse(5,20, 30,10);
  }
  else
  {
    noStroke();
    fill(#3AE560);
    quad(-15, 25, 25,25, 10, -15, 0 , -15);
    ellipse(4,20, 45,28);
      if(count_t_r>=20 && count_s_r<260)
      {
          count_s_r++;
          draw_sin_1(+5,0, count_s_r, 12,3, PI/2);
          draw_sin_2(+6,0, count_s_r, 12,3, PI/2);
      }
      if(count_t_r < 245)
      {
          count_t_r++;
          tree(0,0,count_t_r, -count_t_r, 10);
          //quad(0,0, 30,0, 30,count ,0, count);
      }
      if(count_s_r>=260)
       {
         stroke(#1EAF3E);
         fill(#DAE03D, 90);
         strokeWeight(4);
         ellipse(6, -275, 25,50);
         fill(#1EAF3E);
         strokeWeight(1);
         triangle(-2, -303, 14, -303, 6, -320);
       }
  }
  popMatrix();
}

void left_tree()
{
   pushMatrix();
  translate(.2*width, .9*height);
  if(!left)
  {
    fill(#53552A);
    noStroke();
    ellipse(5,20, 30,10);
  }
  else
  {
    noStroke();
    fill(#3AE560);
    quad(-15, 25, 30,25, 20, -15, -3 , -15);
    ellipse(8,20, 45,28);
      if(count_t_l>=20 && count_s_l<460)
      {
          count_s_l++;
          draw_sin_1(+6,0, count_s_l, 13,6, PI/2);
          draw_sin_2(+9,0, count_s_l, 13,6,PI/2);
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
         triangle(-2, -423, 14, -423, 6, -460);
         //left branche
         if(count_b_l<220)
             draw_sin_2(-2,-320,count_b_l++,50,10, PI/3.5);
         
         else
         {
           //left branch
             pushMatrix();
             translate(-95,-.75*height);
             rotate(-PI/3.5);
             fill(#DAE03D, 90);
             ellipse(2,2, 10,50);
             fill(#1EAF3E);
             ellipse(10,10, 15,80);
             popMatrix(); 
         }
         if(count_b_r <160)
             draw_sin_1(0,-320,count_b_r++,50,10, PI/2+PI/3);
         else
         {
             pushMatrix();
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
    fill(#3AE560);
    quad(-15, 25, 25,25, 10, -15, 0 , -15);
      if(count_t_m>=20 && count_s_m<260)
      {
          count_s_m++;
          draw_sin_1(+5,0, count_s_m, 12,3,PI/2);
          draw_sin_2(+6,0, count_s_m, 12,3,PI/2);
      }
      if(count_t_m < 240)
      {
          count_t_m++;
          tree(0,0,count_t_m, -count_t_m, 10);
         
      }
      if(count_s_m>=260)
       {
         stroke(#1EAF3E);
         strokeWeight(4);
         fill(#DAE03D, 90);
         ellipse(6, -275, 25,50);
         strokeWeight(1);
         fill(#3AE560);
         triangle(-2, -303, 14, -303, 6, -320);
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
  
  
  
  //draw some trees
  
  
   //if(count<100)
   //{
   //    count++;
   //  circle(count);
  // }
  // beginShape();
  // for(int i=0; i<20; i++)
    
  // endShape();
}

void mousePressed()
{
  if((pow(.8*width+6-mouseX,2)+pow(.9*height+20-mouseY,2)) <= 15*15)
    right = true;
  if((pow(.2*width+6-mouseX,2)+pow(.9*height+20-mouseY,2)) <= 15*15)
    left = true;
  if((pow(.5*width+6-mouseX,2)+pow(.9*height+20-mouseY,2)) <= 15*15)
    mid = true;
}