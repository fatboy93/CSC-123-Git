float e = 2.7182818284590452353602874713527;
float[] but_x;
float[] but_y;
color[] but_c;
PVector[] but_dir;
int but_size;
boolean moving = true, original = true;

void setup()
{
    frameRate(60);
    size(500,500);
    background(0);
    but_size = 3;

    but_x = new float[but_size];
    but_y = new float[but_size];
    but_dir = new PVector[but_size];
    but_c = new color[but_size];
}

void butterfly(float cx, float cy, color c, float rad)
{
  float x, y, t=0;
    pushMatrix();
      fill(c);
      translate(cx,cy);
      if(cx < width/2)
         rotate(-PI/6);
      else
         rotate(PI/6);
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
void draw()
{ 
    background(0);
    for(int i=0; i<but_size; i++)
    {  
        if(original)
        {
          but_x[i] = random(50,width-50);
          but_y[i] = random(20,.4*height);
          but_dir[i] = new PVector(random(-1,1), random(-1,1));
          but_c[i] = color(random(255), random(255), random(255));
        }
          but_dir[i].normalize();
          but_dir[i].mult(random(1.5,2));
          but_x[i] += but_dir[i].x;
          but_y[i] += but_dir[i].y;
          
          
          if(but_x[i] < 20 || but_x[i]>width-20)
              but_dir[i].x = - but_dir[i].x;
          if(but_y[i] < 20 || but_y[i] > .4*height)
              but_dir[i].y = - but_dir[i].y;
         
         
        butterfly(but_x[i], but_y[i], but_c[i], random(6,7));
    }
    original = false;
}

void mousePressed()
{
    moving = true;
  
}