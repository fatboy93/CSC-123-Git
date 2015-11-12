//import gifAnimation.*;
float e = 2.7182818284590452353602874713527;
float[] but_x;
float[] but_y;
color[] but_c;
PVector[] but_dir;
int but_size, bug_size, cloud_size, pedal_size, flower_size;
boolean moving = true, original = true;
PImage ladybug, grass, cloud, sun, tree, pedal, flower;
float[] bug_x;
float[] bug_y;
float[] bug_s;
float[] cloud_x;
float[] cloud_y;
float[] cloud_s;
PVector[] cloud_dir;
float ang, ang_sun;
PVector[] bug_dir;
float[] pedal_x;
float[] pedal_y;
float[] flower_x;
float[] flower_y;
float ang_flower=0;
//GifMaker gifExport;
void setup()
{
    frameRate(60);
    size(600,500);
    background(#4E80E3);
    but_size = 5;
    bug_size = 4;
    cloud_size = 10;
    flower_size = 10;
    pedal_size = 30;
    but_x = new float[but_size];
    but_y = new float[but_size];
    but_dir = new PVector[but_size];
    but_c = new color[but_size];
    ladybug = loadImage("data/ladybug.png");
    grass = loadImage("data/Grass.png");
    cloud = loadImage("data/cloud.png");
    sun = loadImage("data/sun3.png");
    tree = loadImage("data/tree.png");
    flower = loadImage("data/flower.png");
    pedal = loadImage("data/pedal.png");
    bug_x = new float[bug_size];
    bug_y = new float[bug_size];
    bug_dir = new PVector[bug_size];
    bug_s = new float[bug_size];
    cloud_x = new float[cloud_size];
    cloud_y = new float[cloud_size];
    cloud_s = new float[cloud_size];
    cloud_dir = new PVector[cloud_size];
    pedal_x = new float[pedal_size];
    pedal_y = new float[pedal_size];
    flower_x = new float[flower_size];
    flower_y = new float[flower_size];
    ang_sun = 1;
   // gifExport = new GifMaker(this, "export.gif");
   // gifExport.setRepeat(0);
}
void butterfly(float cx, float cy, color c, float rad, float rot)
{
  float x, y, t=0;
    pushMatrix();
      fill(c);
      translate(cx,cy);
      rotate(rot+PI/2);
      noStroke();
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

void draw_bug(float cx, float cy, float size, float rot)
{
    pushMatrix();
      translate(cx,cy);
      scale(size);
      rotate(rot);
      image(ladybug, 0,0);
    popMatrix();
}

void draw_cloud(float cx, float cy, float size, float rot)
{
    pushMatrix();
        translate(cx,cy);
        scale(size);
        rotate(rot);
        image(cloud,0,0);
    popMatrix();
}

void draw_sun(float cx, float cy)
{
  pushMatrix();
     translate(cx,cy);
     imageMode(CENTER);
     rotate(radians(ang_sun));
     scale(.4);
     
     image(sun,0,0);
  popMatrix();
}

void draw_tree(float cx, float cy, float size )
{
    pushMatrix();
        translate(cx,cy);
        imageMode(CENTER);
        scale(size);
        image(tree,0,0);
    popMatrix();
}

void draw_flower(float cx, float cy)
{
    pushMatrix();
        translate(cx,cy);
        imageMode(CENTER);
        rotate(ang_flower);
        scale(.3);
        image(flower,0,0);
    popMatrix();
    
}

void draw_pedal(float cx, float cy)
{
    pushMatrix();
        translate(cx,cy);
        imageMode(CENTER);
        rotate(ang_flower);
        scale(.5);
        image(pedal,0,0);
        
    popMatrix();
}
void draw()
{ 
    background(#0C8EF5);
    
    //draw grass
    pushMatrix();
        imageMode(CORNER);
        image(grass,0,250);
    popMatrix();
    //draw sun
    draw_sun(60,60);
    ang_sun+=.2;
    ang_flower += .01;
   
    //draw tree
    
    draw_tree(.6*width, .6*height, .3);
    draw_tree(.85*width, .6*height, .4);
    draw_tree(.75*width, .7*height, .5);
    
    //butterflies
    for(int i=0; i<but_size; i++)
    {  
        if(original)
        {
          but_x[i] = random(50,width-50);
          but_y[i] = random(.4*height,.6*height);
          but_dir[i] = new PVector(random(-1,1), random(-.2,.2));
          but_c[i] = color(random(255), random(255), random(255));
        }
          but_dir[i].normalize();
          but_dir[i].mult(random(.5,1));
          but_x[i] += but_dir[i].x;
          but_y[i] += but_dir[i].y;
          
          
          if(but_x[i] <= 20 || but_x[i]>=width-20)
              but_dir[i].x = - but_dir[i].x;
          if(but_y[i] <= .4*height || but_y[i] >= .6*height)
              but_dir[i].y = - but_dir[i].y;
              
        ang = atan2(but_dir[i].y, but_dir[i].x);          
        butterfly(but_x[i], but_y[i], but_c[i], random(3,4), ang);
    }
    
    
    //ladybug
    for(int i=0; i<bug_size; i++)
    {
        if(original)
        {
          bug_x[i] = random(40,width-40);
          bug_y[i] = random(.7*height, height-40);
          bug_dir[i] = new PVector(random(-1,1), random(-.5,0));
          bug_s[i] = random(.4,.7);
        }
        bug_dir[i].normalize();
        bug_dir[i].mult(random(.1,.2));
        bug_x[i] += bug_dir[i].x;
        bug_y[i] += bug_dir[i].y;
        
         if(bug_x[i] <= 30 || bug_x[i]>=width-30)
              bug_dir[i].x = - bug_dir[i].x;
         if(bug_y[i] <= .7*height || bug_y[i] >= height-30)
              bug_dir[i].y = - bug_dir[i].y;
         ang = atan2(bug_dir[i].y, bug_dir[i].x);
         draw_bug(bug_x[i], bug_y[i], bug_s[i], ang+PI/2);
    }
    
    for(int i=0; i<cloud_size; i++)
    {
        if(original)
        {
            cloud_x[i] = random(50, width-50);
            cloud_y[i] = random(20,120);
            cloud_s[i] = random(.05,.3);
            cloud_dir[i] = new PVector(random(-1,1), 0);
        }
        
        cloud_dir[i].normalize();
        cloud_dir[i].mult(.1);
        cloud_x[i] += cloud_dir[i].x;
        cloud_y[i] += cloud_dir[i].y;
        
        if(cloud_x[i] <50 || cloud_x[i] > width-50)
            cloud_dir[i].x = - cloud_dir[i].x;
        if(cloud_y[i] < 20 || cloud_y[i] > 100)
            cloud_dir[i].y = - cloud_dir[i].y;
        draw_cloud(cloud_x[i], cloud_y[i], cloud_s[i], 0); 
    }
    
    for(int i=0; i<flower_size; i++)
    {
        if(original)
        {
            flower_x[i] = random(30, .7*width);
            flower_y[i] = random(.65*height, .95*height);
        }
        //if(flower_y[i] < .9*height)
          //  flower_y[i]+= .2;
            
        draw_flower(flower_x[i], flower_y[i]);
          
    }
    
    for(int i=0; i<pedal_size;i++)
    {
        if(original)
        {
            pedal_x[i] = random(.6*width, .98*width);
            pedal_y[i] = random(.5*height, .7*height);
        }
        
        if(pedal_y[i] < .9*height)
            pedal_y[i] += .1;
        draw_pedal(pedal_x[i], pedal_y[i]);
    }
    original = false;
   // gifExport.setDelay(1000/60);
   // gifExport.addFrame();
    
}

void mousePressed()
{
    moving = true;
  
}