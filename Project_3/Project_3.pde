PImage me, liquid, turkey, smoke, hat, mustache, puff, brow_eye, nose, splash;
boolean saliva, spindle_f, spindle_b, left_eye, right_eye, puff_out, original;
boolean original_2, fill_but, running_nose;
PVector[] liquid_dir;
float[] liquid_x;
float[] liquid_y;
PVector[] puff_dir;
float[] puff_x;
float[] puff_y;
int liquid_size, countFrame, originFrame, passing_size, turkey_x, turkey_y, end;
int count_left, puff_size,but_size;
float mouth_x, mouth_y;
float e = 2.7182818284590452353602874713527;
float[] but_x;
float[] but_y;
color[] but_c;
PVector[] but_dir;
float ang_but, nose_size, splash_x, splash_y;
void setup()
{
    size(600,600);
    me = loadImage("data/me.JPG");
    liquid = loadImage("data/liquid.png");
    turkey = loadImage("data/turkey.PNG");
    smoke = loadImage("data/smoke.png");
    hat = loadImage("data/hat.png");
    mustache = loadImage("data/mustache.png");
    puff = loadImage("data/puff.png");
    brow_eye = loadImage("data/brow_eye.png");
    nose = loadImage("data/nose.png");
    splash = loadImage("data/running_nose.png");
    saliva = false;
    liquid_size = 20;
    puff_size = 100;
    but_size = 20;
    liquid_x = new float[liquid_size];
    liquid_y = new float[liquid_size];
    liquid_dir = new PVector[liquid_size];
    puff_dir = new PVector[puff_size];
    puff_x = new float[puff_size];
    puff_y = new float[puff_size];
    but_x = new float[but_size];
    but_y = new float[but_size];
    but_dir = new PVector[but_size];
    but_c = new color[but_size];
    countFrame = 0;
    passing_size = 0;
    mouth_x = 50;
    mouth_y = 5;
    turkey_x = 200;
    turkey_y = 450;
    end = 0;
    spindle_f = true;
    spindle_b = false;
    left_eye = false;
    right_eye = false;
    puff_out = true;
    original = true;
    original_2 = true;
    fill_but = false;
    ang_but = 1;
    running_nose = false;
    nose_size = 0.2;
    splash_x = width/2;
    splash_y = height/2;
}

void draw()
{
     countFrame++;
     //background me
     draw_me();
     //brow_eye
     if(!running_nose)
      draw_brow_eye(300,150,.5);
     //dimples
     draw_dimples();
     //nose
     if(!running_nose)
          draw_nose(295,310,.2);
      else
      {
        if(countFrame %10 == 0 && nose_size < .34)
             nose_size += .02;
        draw_nose(295,310, nose_size);
        draw_brow_eye(300,180,.25);
        if(nose_size >.34)
        {
          if(splash_y<600)
            image(splash,width/2, splash_y+=2);
        }
        if(splash_y >=600)
        {
           if(nose_size > .2)
                  draw_nose(295,310,nose_size-=.02);
           else 
           {
               splash_y = height/2;
               running_nose = false;            
           }
        }
        
      }
      //mustache
      if(splash_y>=470 || splash_y <= height/2)
       draw_mustache();
     //hat
    // draw_hat();
     //mouth
     saliva_turkey();
     if(left_eye || right_eye)
     {
          fill_but = false;
          crazy_eye();
          flying_but();
     }
     
      //smoke
      if(!running_nose && !saliva)
      {
        draw_smoke();
        //flying puff
       if(puff_out)
         flying_puff();
      }
    
}

void draw_nose(float cx, float cy, float size)
{
    pushMatrix();
        translate(cx, cy);
        scale(size);
        imageMode(CENTER);
        image(nose,0,0);
    popMatrix();
}
void draw_brow_eye(float cx, float cy, float size)
{
    pushMatrix();
        translate(cx, cy);
        scale(size);
        imageMode(CENTER);
        image(brow_eye,0,0);
    popMatrix();
}
void crazy_eye()
{
    butterfly(220,255, color(#2D5DDE),2, ang_but+=.2);
    butterfly(220,255, color(#2D5DDE),2, -ang_but);
    butterfly(360,255, color(#2D5DDE),2, ang_but);
    butterfly(360,255, color(#2D5DDE),2, -ang_but);
    fill_but = true;
}
void flying_but()
{
     for(int i=0; i<but_size; i++)
    {  
          but_dir[i].normalize();
          but_dir[i].mult(random(.4,.7));
          but_x[i] += but_dir[i].x;
          but_y[i] += but_dir[i].y;
          
          
        /*  if(but_x[i] <= 20 || but_x[i]>=width-20)
              but_dir[i].x = - but_dir[i].x;
          if(but_y[i] <= .4*height || but_y[i] >= .6*height)
              but_dir[i].y = - but_dir[i].y;
          */    
        float ang = atan2(but_dir[i].y, but_dir[i].x);          
        butterfly(but_x[i], but_y[i], but_c[i], random(3,4), ang);
    }
}
void butterfly(float cx, float cy, color c, float rad, float rot)
{
  float x, y, t=0;
    pushMatrix();
    if(fill_but)
    {
      fill(c);
      noStroke();
    }
    else
    {
      stroke(c);
      noFill();
    }
      translate(cx,cy);
      rotate(rot+PI/2);
     // noStroke();
    // stroke(c);
      beginShape();
      for(int i=0; i<50; i++)
      {
          x = rad*(sin(t))*(pow(e,cos(t)) - 2*cos(4*t) - pow(sin(t/12),5));
          y = -rad*(cos(t))*(pow(e,cos(t)) - 2*cos(4*t) - pow(sin(t/12),5));
          curveVertex(x,y);
          t+=PI/20;
      }
      endShape();
    popMatrix();
}
void draw_mustache()
{
    mustache.loadPixels();
    loadPixels();
    int loc_screen;
    for(int x=0; x<mustache.width; x++)
    {
        for(int y=0; y<mustache.height; y++)
        {
            loc_screen = x +220 + (y+320)*width;
            if(mustache.pixels[x+y*mustache.width] != color(255))
                pixels[loc_screen] = mustache.pixels[x + y*mustache.width];
        }
    }
    updatePixels();
}

void draw_hat()
{
    hat.loadPixels();
    loadPixels();
    int loc_screen;
    for(int x=0; x<hat.width; x++)
    {
        for(int y=0; y<hat.height; y++)
        {
            loc_screen = x +120 + (y+20)*width;
            if(hat.pixels[x+y*hat.width] != color(255))
                pixels[loc_screen] = hat.pixels[x + y*hat.width];
        }
    }
    updatePixels();
}
void draw_smoke()
{
    smoke.loadPixels();
    loadPixels();
    int loc_screen;
    for(int x=0; x<smoke.width; x++)
    {
        for(int y=0; y<smoke.height; y++)
        {
            loc_screen = x +130 + (y+360)*width;
            if(smoke.pixels[x+y*smoke.width] != color(255))
                pixels[loc_screen] = smoke.pixels[x + y*smoke.width];
        }
    }
    updatePixels();
}
void draw_dimples()
{
    
     if(spindle_f && countFrame %5 == 0 )
        { 
          end++;
          if(end > 50)
          {
            spindle_f =false;
            spindle_b = true;
          }
        }
     else if(spindle_b && countFrame % 5 ==0)
     {
         end --;
         if( end < 2)
         {
            spindle_f = true;
            spindle_b = false;
         }
     }
     draw_spindle(150, 350,-1,1, end);
     draw_spindle(430, 350,1,1, end);
    
}
void draw_me()
{
     me.loadPixels();
     loadPixels();
     int loc;
     for(int x=0; x<width; x++)
     {
         for(int y=0; y<height; y++)
         {
             loc = x + y*width;
             if(impl_eli(290,400,x,y,mouth_x, mouth_y) < 0 && x%2==0)
                 pixels[loc] = color(brightness(me.pixels[loc]) + random(-20,0));     
           /* else if(x>0 && x<150 && y>50 && y<120 && y%2==0)
                 pixels[loc] = color(brightness(me.pixels[loc]) + random(-20,0));
            else if(x>0 && x<150 && y>50 && y<120)
                 pixels[loc] = color(#A2E576, 128);
            else if(x>150 &&x < 250 && y<50 && x%2 == 0)
                 pixels[loc] = color(brightness(me.pixels[loc]) + random(-20,0));
            else if(impl_eli(300,50,x,y, 200,50) < 0 && x%2==0)
                  pixels[loc] = color(brightness(me.pixels[loc]) + random(-20,0));*/
            else if((impl_cir(220, 250,x,y,50) < 0 || impl_cir(370,250,x,y,50) < 0)
                 && x%2 ==0)
                   pixels[loc] = color(brightness(me.pixels[loc]) + random(-20,0));
            else if(impl_cir(220, 250,x,y,50) < 0 || impl_cir(370,250,x,y,50) < 0)
                   pixels[loc] = color(#EAEA2F,128);  
            else if((impl_line(0,100,100,0,x,y) > 0 ||
                     impl_line(500,0,600,100,x,y) > 0 ||
                     impl_line(0,500,100,600,x,y) < 0 ||
                     impl_line(500,600,600,500,x,y) < 0 )
                    && y%2==0)
                  pixels[loc] = color(brightness(me.pixels[loc]) + random(-20,0));
             else if(impl_line(0,100,100,0,x,y) > 0 ||
                     impl_line(500,0,600,100,x,y) > 0 ||
                     impl_line(0,500,100,600,x,y) < 0 ||
                     impl_line(500,600,600,500,x,y) < 0 )
                 pixels[loc] = color(#96C9C5,128);
            else
                 pixels[loc] = color(#5FDB9A, 128);    
         }
     }
     updatePixels();
}

void saliva_turkey()
{
     if(saliva && (countFrame - originFrame) < 600)
     {
       //make the mouth bigger
       if(mouth_x <100)
           mouth_x+=.5;
       if(mouth_y<80)
           mouth_y+=.3;
       if(turkey_y > 350 && countFrame - originFrame > 400)
           turkey_y -= .00003;
        //draw turkey
            turkey.loadPixels();
            loadPixels();
            int loc_t;
            for(int t_x=0; t_x < turkey.width; t_x++)
            {
                for(int t_y=0; t_y < turkey.height; t_y++)
                {
                    loc_t = t_x +turkey_x + (t_y+ turkey_y)*width;
                    
                    if(turkey.pixels[t_x + t_y*turkey.width] != color(255))
                        pixels[loc_t] = turkey.pixels[t_x + t_y*turkey.width];
                }
               
            }
            updatePixels();
        
         if(passing_size < liquid_size && countFrame % 25 == 0)
              passing_size++;
          
          draw_saliva(passing_size); 
          turkey_text(countFrame - originFrame);
     }
     else
     {
       saliva = false;
        if(mouth_x>50)
            mouth_x--;
        if(mouth_y>5)
            mouth_y --;
        else if(passing_size >= liquid_size)
            passing_size = 1;
     }
}

void draw_saliva(int size)
{
  for(int i=0; i<size; i++)
  {
    liquid_y[i] += liquid_dir[i].y;
    liquid_x[i] += liquid_dir[i].x;
    pushMatrix();
      if(i % 2 == 0 )
          translate(250,400);
      else 
          translate(350,400);
      scale(.02);
      rotate(PI);
      image(liquid, liquid_x[i],liquid_y[i]);
    popMatrix();
  }
}

void flying_puff()
{
     if(passing_size < puff_size && countFrame % 80 == 0)
              passing_size++;
          
     draw_puff(passing_size); 
}
void draw_puff(int size)
{
  if(original)
  {
      for(int i=0; i<puff_size;i++)
      {
         puff_dir[i] = new PVector(random(-.5,.5), random(-1,0));
         puff_dir[i].normalize();
         puff_dir[i].mult(random(1,2));
         puff_x[i] = 0;
         puff_y[i] = 0;        
      }
      original  = false;
  }
  for(int i=0; i<size; i++)
  {
    puff_y[i] += puff_dir[i].y;
    puff_x[i] += puff_dir[i].x;
    pushMatrix();
      translate(140,395);
      scale(.2);
      image(puff, puff_x[i],puff_y[i]);
    popMatrix();
  }
}
void turkey_text(int size)
{
    fill(255, 200);
    ellipse(turkey_x, turkey_y+50, 100,60);
    fill(0);
    textAlign(CENTER);
    textSize(14);
    if(size < 200)
        text("Eat Ham!!!", turkey_x, turkey_y+50);
    else if(size < 400)
    {
        text("Stay away", turkey_x, turkey_y+40);
        text("from Me!!!", turkey_x, turkey_y+60);
    }
    else
        text("NOOOO!!!", turkey_x, turkey_y+50);
        
}

void draw_spindle(float cx, float cy, float rad1, float rad2, float count)
{
    float x,y,t=0;
    fill(#E84475);
    noStroke();
    pushMatrix();
    translate(cx,cy);
    for(int i=0; i<count; i++)
    {
        x = rad1*cos(t);
        y = rad2*sin(t);
        t+=PI/10;
        if(rad1 > 0)
            rad1 += .5;
        else
            rad1 -= .5;
        if(rad2 < 0)
            rad2 -= .5;
        else
            rad2 += .5;
        ellipse(x,y,3,3);
    }
    popMatrix();
}
void mousePressed()
{
    if(impl_eli(290,400,mouseX,mouseY,50,5) < 0)
    {
        if(!saliva)
        {
        saliva = true;
        mouth_x = 50;
        mouth_y = 5;
        turkey_y = 450;
        originFrame = countFrame;
        passing_size = 0;
        for(int i=0; i<liquid_size;i++)
         {
             liquid_dir[i] = new PVector(random(-.5,.5), random(0,1));
             liquid_dir[i].normalize();
             liquid_dir[i].mult(random(20,30));
             liquid_x[i] = 0;
             liquid_y[i] = 0;        
         }
        }
        else saliva = false;
         
    }
   /* if(impl_cir(220,250,mouseX,mouseY, 50) < 0)
    {
      for(int i=0; i<but_size; i++)
       {    
           if(i<but_size/2)
           {
              but_x[i] = 220;
              but_y[i] = 250;
           }
           else
           {
               but_x[i] = 370;
               but_y[i] = 250;
           }
            but_dir[i] = new PVector(random(-1,1), random(-1,1));
            but_c[i] = color(random(255), random(255), random(255));
       }
        if(!left_eye)
            left_eye = true;
        else
          left_eye = false;
    }*/
    
    if(impl_cir(370,250, mouseX, mouseY, 50) < 0 
        || impl_cir(220,250,mouseX,mouseY, 50) < 0)
    {
       for(int i=0; i<but_size; i++)
       {    
           if(i<but_size/2)
           {
              but_x[i] = 220;
              but_y[i] = 250;
           }
           else
           {
               but_x[i] = 370;
               but_y[i] = 250;
           }
            but_dir[i] = new PVector(random(-1,1), random(-1,1));
            but_c[i] = color(random(255), random(255), random(255));
       }
        if(!right_eye)
            right_eye = true;
        else
          right_eye = false;
    }
    if(impl_cir(170,430,mouseX, mouseY,65) < 0)
    {
        if(!puff_out)
        {
            puff_out = true;
            passing_size = 0;
            for(int i=0; i<puff_size;i++)
            {
               puff_dir[i] = new PVector(random(-.5,.5), random(-1,0));
               puff_dir[i].normalize();
               puff_dir[i].mult(random(1,2));
               puff_x[i] = 0;
               puff_y[i] = 0;        
            }
        }
        else
            puff_out = false;
    }
    if(impl_cir(295, 310, mouseX, mouseY, 40) < 0)
    {
        running_nose = true;
    }
}


float impl_cir(float cx, float cy, float x, float y, float rad)
{
    return (pow(x-cx,2) + pow(y-cy,2) - rad*rad);
}

float impl_eli(float cx, float cy, float x, float y, float w, float h)
{
    return (pow(x-cx,2)/pow(w,2) + pow(y-cy,2)/pow(h,2) - 1);
}

float impl_line(float start_x, float start_y, float end_x, float end_y, float x,
                float y)
{
    return ((end_y - start_y)*x - (end_x - start_x)*y - start_x*end_y + start_y*end_x);
}