/*
Nghia Nguyen
CPE 123
Lab 8 - image
*/
boolean upperleft, upperright, lowerleft, lowerright;
PImage me;
void setup()
{
  me = loadImage("data/me_3.jpg");
  size(596,524);
  noLoop();
  upperleft = false;
  upperright = false;
  lowerleft = false;
  lowerright = false;
}

void draw_pic(color lip, color hand, color back)
{
  int loc_me, loc_screen;
  for(int x=0; x<me.width; x++)
  {
      for(int y=0; y<me.height; y++)
      {
           loc_me = x + y*me.width;
           
           //draw the pic on 4 different corner
          if(upperleft)
              loc_screen = x + y*width;
          else if(upperright)
              loc_screen = x+width/2 + y*width;
          else if(lowerleft)
              loc_screen = x + (y+height/2)*width;
          else
              loc_screen = x + width/2 + (y+height/2)*width ;
          //do something fun
          //color the lips
          if(impl_eli(me.width*.58, me.height*.8,18, 4, x,y) < 0)
               pixels[loc_screen] = color(lip);
          //color the face
          else if(impl_eli(me.width*.56, me.height*.65, 50, 65, x,y) < 0)
          {
              if(brightness(me.pixels[loc_me]) < 150)
                  pixels[loc_screen] = color(brightness(me.pixels[loc_me]));   
          }
          //color the hands
          else if(brightness(me.pixels[loc_me])> 230)
              pixels[loc_screen] = color(back);
          //color the background
          else if(brightness(me.pixels[loc_me])> 180)
              pixels[loc_screen] = color(hand);
          else
          //color the rest of the body
              pixels[loc_screen] = color(brightness(me.pixels[loc_me]));
      }
  }
}
void draw()
{
  //load pixels of the pic and the screen
  me.loadPixels();
  loadPixels();
  
  //upper left
  upperleft = true;
  draw_pic(color(0,0,255), color(0,255,0), color(255,0,0)) ;
  upperleft = false;
  //upper right
  upperright = true;
  draw_pic(color(255,0,0), color(0,0,255), color(255,255,0));
  upperright = false;
  //lowerleft
  lowerleft = true;
  draw_pic(color(255,255,0), color(255,0,0), color(0,255,0));
  lowerleft = false;
  //lower right
  draw_pic(color(0,255,0), color(255,255,0), color(0,0,255));

  //update pixels of the screen
  updatePixels();
  
  //save the pic
  save("Lab8.jpeg");
}

float impl_eli(float center_x, float center_y, float w, float h, float x, float  y)
{
    return (pow(x-center_x,2)/(w*w) + pow(y-center_y,2)/(h*h) - 1);
}