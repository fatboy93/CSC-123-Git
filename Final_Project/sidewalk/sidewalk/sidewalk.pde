
import ddf.minim.*;
AudioPlayer gunshot;
AudioPlayer themesong;
Minim minim;
int lives = 3;
int points = 0;
PVector Blaster;
PImage gun;
PFont font; // our font variable
int x, y; // current position of the text
float x0, y0, x1, y1;
float curX, curY, diam;
PImage cloud,moon;
PVector gun_heading;
float startP=1;
int num_clowns;
int Y_AXIS = 1;
int X_AXIS = 2;
color  c1, c2;
boolean restart = false;
int cloud_size;
boolean  original = true;
boolean won = false;
AI [] Clown;

float[] cloud_x;
float[] cloud_y;
float[] cloud_s;
PVector[] cloud_dir;
int flicker;
boolean boy_is_dead = false;
PImage  gun_pointer;
boolean hit_clown = false;
String [] str;
float [] text_loc;
int text_line;
int winning_point;
kid thekids[];
int numC;
void setup(){
  
  //text
  text_line = 12;
   text_loc = new float[ text_line];
    for(int i=0; i< text_line; i++)
    {
        text_loc[i] = height + (i+1)*70;
        //text_size[i] = 32;
    }
    str = new String[text_line];
    str[0] = "The carnival just came into town.";
    str[1] = "You attended expecting the time of your life.";
    str[2] = "The clowns, however, held a different meaning for the word “fun”";
    str[3] = "As it turns out, these clowns weren’t just clowns…";
    str[4] = "they were flesh-eating cannibalistic psycho ghost demon clowns.";
    str[5] = "You being the stone-cold badass that you are,";
    str[6] = "decide you don’t have time for this";
    str[7] = "and intend to make it home before dinner.";
    str[8] = "What’s for dinner?";
    str[9] = "";
    str[10] = "";
    str[11] = "Justice.";
    textSize(30);
    textAlign(CENTER);
    
  Blaster = new PVector(0,0);
  gun_pointer = loadImage("gun_pointer.png");
cloud_size = 50;
  gun = loadImage("han_solo.png");
   moving = false;
    cloud = loadImage("game_cloud.png");
    moon = loadImage("game_moon.png");
    cloud_x = new float[cloud_size];
    cloud_y = new float[cloud_size];
    cloud_s = new float[cloud_size];
    cloud_dir = new PVector[cloud_size];

  
    size(1000, 500);

    cloud = loadImage("game_cloud.png");


    x0 = 0;
    y0 = 400;
    x1 = 1000;
    y1 = 400;
    diam = 10;
    c1 = color(0, 0, 0);
    c2 = color(0, 102, 153);
  
  //clown
 // size(1000,800);
  //background(0);
    num_clowns = 10;
    
    clown_1 = loadImage("clown_face2.png");
    clown_2 = loadImage("clown_face22.png");
    Clown = new AI[num_clowns];
    for(int i=0; i<num_clowns; i++)
    {
        Clown[i] = new AI(width + i*200, random(50, height-100));
    }
    //kid
    rS = -.5; //right Shoulder  //I didn't use these yet- maybe use them to make arms move when walking
    rW = -.2;  //right Wrist 
    lS = .5;
    lW = -.2;
    rL = 0;  //right leg
    lL = 0;
    
    Kloc = new PVector(50, .67*height);
    mR = new PVector(1,0);
    Jump = new PVector(0, -8);
    Gravity = new PVector(0, .2);
    winning_point = 10;
    speed = 0.5;
    gun_heading = new PVector(0,0);
    //sound
    minim = new Minim(this);
    gunshot = minim.loadFile("shot.mp3",2048);
    themesong = minim.loadFile("theme.mp3",2048);
    themesong.play();
    //text
    // create the font
  font = createFont("bit.ttf", 30, true);
  
 
  // start the text off screen halfway down the canvas
  x = width/2;
  y = 1100;
 
  // set the font 
  textFont(font);
  
  //vanishing kid
  smooth();
  numC = 1;
  thekids = new kid[numC];
  
  for (int i=0; i < numC; i++) {
    //thekids[i] = new kid(new PVector(-20, height+20), new PVector(width*.8, height/2), i*40+ (int)random(5, 20));
    thekids[i] = new kid(new PVector(-20, height+20), new PVector(width/2 + 60, height/2), i*40+ (int)random(5, 20));
  }
}
void draw(){
 
  if(frameCount <= 2000)
  {
    background(0);
    //text
    for(int i=0; i<text_line; i++)
    {
      if(text_loc[i] > -10)
      {
         if(i < 11)
            textSize(32 * (text_loc[i]+20)/ height);
         else
            textSize(100 * (text_loc[i]+20)/height);
         text(str[i], width/2, text_loc[i]);
      }
      text_loc[i]-=.65;
    }
  }
  else if(!won)
  {
    background(50);
    fill(100);
    sky(0, 0, width, 350, c1, c2, Y_AXIS);
    fill(0,100,70);
    rect(0,350,width,50);
    imageMode(CORNER);
    noTint();
    image(moon,50,0);
    generator();
    
    startP=startP-.5;
    for (float t=startP; t< 1; t=t+.094) 
    {
        fill(200);
        stroke(0);
        curX = x0 + t*(x1-x0);
        curY = y0 + t*(y1-y0);
        SWK(curX, curY);
    }
    /*
    flickerer();
    pushMatrix();
    for (float t=-4; t< 1; t=t+.017) {
      fill(200,200,200,flicker);
      stroke(0);
      curX = x0 + t*(x1-x0);
      curY = y0 + t*(y1-y0);
      SWK(curX, curY);
    }
    popMatrix();
    */

    //kid
    drawKid();
    moveR();
    pushMatrix();
    //clown
    if(restart)
    {
      for(int i=0; i<num_clowns; i++)
         Clown[i] = new AI(width + i*200, random(50, height-100));   
      restart = false;
    }
    else
    {
        for(int i=0; i<num_clowns && !restart && !won; i++)
        {
             Clown[i].drawC();
             Clown[i].AIfollow(Kloc.x, Kloc.y);
           
             //shoot the clowns
             if(impl_eli(x_b, y_b, Clown[i].clownX, Clown[i].clownY,40,50) <= 0)
              {
                 Clown[i] = new AI(width + random(0,1000), random(50, height-100));
                 points++;
                 shoot = false;
                 x_b = 0;
                 if(points >= winning_point)
                     won = true;
              }
              //check if clown eat the boy
              if(impl_circle(Clown[i].clownX, Clown[i].clownY, Kloc.x, Kloc.y, 40)<=0)
              {
                 lives--;
                 restart = true; 
              }
        }
    }
    popMatrix();
    //lives ann points
    if(hit_clown)
    {
        points++;
        hit_clown = false;
    }
    
  
    float lx = 120, ly = height -30;
    fill(255);
    textSize(25);
    text("Points:  " + points,  width-200, ly);
    
    text("Lives: ",lx, ly);
    for(int i=0; i<lives; i++)
    {  
        lx+= 30;
        draw_heart(lx + 20,ly-12);
    }
    
    //gun_pointer
    pushMatrix();
      imageMode(CENTER);
      noTint();
      image(gun_pointer,mouseX, mouseY);
      
   popMatrix();
    //blaster
    if(shoot)
    {
       if(x_b <= 950)
       {
          x_b = x_b + speed_b*3*gun_heading.x;
          y_b = y_b + speed_b*3*gun_heading.y;
       }
       else
          shoot = false;
       visualBlast();
    }
  }
  else
  {
      draw_vanishing_kid();
  }
}

void SWK(float x, float y)
{
    beginShape();
    vertex(x,y);
    vertex(x+50,y-10);
    vertex(x+150,y-10);
    vertex(x+150,y+10);
    vertex(x,y+10);
    endShape(CLOSE);
    line(x,y,x+150,y);
}
void sky()
{
    int c = 100;
    fill(0,0,c);
    rect(0,0,800,350);
}
void sky(int x, int y, float w, float h, color c1, color c2, int axis ) 
{
  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
}

void draw_cloud(float cx, float cy, float size, float rot)
{
    pushMatrix();
        translate(cx,cy);
        rotate(rot);
        image(cloud,0,0);
    popMatrix();
}



void generator(){
  for(int i=0; i<cloud_size; i++)
    {
        if(original)
        {
            cloud_x[i] = random(-50, 2000);
            cloud_y[i] = random(20,120);
            cloud_s[i] = random(.05,.3);
            cloud_dir[i] = new PVector(-500, 0);
        }
        
        cloud_dir[i].normalize();
        cloud_x[i] += cloud_dir[i].x;
      //  cloud_y[i] += cloud_dir[i].y;
        if(cloud_x[i] <= -100)
            cloud_x[i] = width + 200;
        
      
           // cloud_dir[i].y = - cloud_dir[i].y;
       draw_cloud(cloud_x[i], cloud_y[i], cloud_s[i], 0); 
    }
  
    original = false;
    //loop();
}

void flickerer()
{
  int counter = 0;
  counter = counter +1;
  if(counter<2){
    flicker = 0;
  }
  else{
    flicker = 255;
  }
  
  if(counter>4)
  {
    counter=0;
  }
}
  

void mousePressed()
{
   if(!won && frameCount >2000)
   {
       gun_heading = new PVector(mouseX-Kloc.x, mouseY-Kloc.y); 
       gun_heading.normalize();
       shoot = true;
       x_b = Kloc.x + 70*gun_heading.x;
       y_b = Kloc.y -30 + 70*gun_heading.y;
       gunshot.play();
       gunshot.rewind();
   }
   //kid getting home
    PVector end;
  
    end = new PVector(width/2 + 60, height/2);
    //end = new PVector(.8*width, height/2);
    //reset all the kids
     for (int i=0; i < numC; i++) 
     {
         thekids[i].loc.x = -20;
         thekids[i].loc.y = height+20;
         thekids[i].alive = true;
         thekids[i].time = 0;
      }   
}
void mouseClicked()
{
  
}

float impl_circle(float cx, float cy, float x1, float y1, float rad)
{
    return pow(cx-x1,2) + pow(cy-y1,2) - pow(rad,2);
}

float impl_eli(float cx, float cy, float x1, float y1, float w, float h)
{
    return pow(cx-x1,2)/(w*w) + pow(cy-y1,2)/(h*h) - 1; 
}
void draw_heart(float cx, float cy)
{
    float t=0;
    float x1, y1;
    noStroke();
    fill(255,0,0);
    pushMatrix();
      translate(cx, cy);
      scale(.7);
      beginShape();
      for(int i=0; i<100; i++)
      {
        x1 = 16*pow(sin(t),3);
        y1 = -( 13*cos(t) - 5*cos(2*t) - 2*cos(3*t) - cos(4*t));
        t += PI/30;
        curveVertex(x1,y1);
      }
      endShape();
    popMatrix();
}