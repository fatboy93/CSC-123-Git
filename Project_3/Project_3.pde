PImage me, liquid, turkey, smoke, hat, mustache, puff;
boolean saliva, spindle_f, spindle_b, left_eye, right_eye, puff_out;
PVector[] liquid_dir;
float[] liquid_x;
float[] liquid_y;
PVector[] puff_dir;
float[] puff_x;
float[] puff_y;
int liquid_size, countFrame, originFrame, passing_size, turkey_x, turkey_y, end;
int count_left, puff_size;
float mouth_x, mouth_y;
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
    saliva = false;
    liquid_size = 20;
    puff_size = 20;
    liquid_x = new float[liquid_size];
    liquid_y = new float[liquid_size];
    liquid_dir = new PVector[liquid_size];
    puff_dir = new PVector[puff_size];
    puff_x = new float[puff_size];
    puff_y = new float[puff_size];
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
    puff_out =false;
}

void draw()
{
     countFrame++;
     //background me
     draw_me();
     //dimples
     draw_dimples();
      //mustache
     draw_mustache();
     //hat
     draw_hat();
     //mouth
     saliva_turkey();
     

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
            loc_screen = x +220 + (y+310)*width;
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
     draw_spindle(150, 350,1, end);
     draw_spindle(430, 350,1, end);
    
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
             if(impl_cir(220,250,x,y, 50) < 0 || impl_cir(370,250,x,y,50) < 0
                 || impl_eli(290,400,x,y,mouth_x, mouth_y) < 0)
                 pixels[loc] = color(brightness(me.pixels[loc]) + random(-20,0));     
            else if(left_eye && (x>0 && x< 300 && y>0 && y<300 && x%5==0 ))
                 pixels[loc] = color(brightness(me.pixels[loc]) + random(-20,0));  
            else if(left_eye && (x>0 && x< 300 && y>300 && y<600 && y%5==0 ))
                 pixels[loc] = color(brightness(me.pixels[loc]) + random(-20,0)); 
            else if(left_eye && x < 300)
                 pixels[loc] = color(#EDDF41,128);
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
       //smoke
       draw_smoke();
        //flying puff
       if(puff_out)
         flying_puff();
       saliva = false;
        if(mouth_x>50)
            mouth_x--;
        if(mouth_y>5)
        {
            mouth_y --;
           
            
        }
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
     if(passing_size < puff_size && countFrame % 45 == 0)
              passing_size++;
          
     draw_puff(passing_size); 
}
void draw_puff(int size)
{
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

void draw_spindle(float cx, float cy, float rad, float count)
{
    float x,y,t=0;
    fill(#E84475);
    noStroke();
    pushMatrix();
    translate(cx,cy);
    for(int i=0; i<count; i++)
    {
        x = rad*cos(t);
        y = rad*sin(t);
        t+=PI/10;
        rad += .5;
        ellipse(x,y,3,3);
    }
    popMatrix();
}
void mousePressed()
{
    if(impl_eli(290,400,mouseX,mouseY,50,5) < 0)
    {
        puff_out = false;
        mouth_x = 50;
        mouth_y = 5;
        turkey_y = 450;
        originFrame = countFrame;
        saliva = true;
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
    if(impl_cir(220,250,mouseX,mouseY, 50) < 0)
    {
        if(!left_eye)
            left_eye = true;
        else
          left_eye = false;
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
}


float impl_cir(float cx, float cy, float x, float y, float rad)
{
    return (pow(x-cx,2) + pow(y-cy,2) - rad*rad);
}

float impl_eli(float cx, float cy, float x, float y, float w, float h)
{
    return (pow(x-cx,2)/pow(w,2) + pow(y-cy,2)/pow(h,2) - 1);
}