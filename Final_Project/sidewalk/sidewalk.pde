

float x0, y0, x1, y1;
float curX, curY, diam;
PImage cloud,moon;
PVector gun_heading;
float startP=1;
int num_clowns;
int Y_AXIS = 1;
int X_AXIS = 2;
color  c1, c2;

int cloud_size;
boolean  original = true;
AI [] Clown;

float[] cloud_x;
float[] cloud_y;
float[] cloud_s;
PVector[] cloud_dir;

int flicker;
boolean boy_is_dead = false;
void setup(){
cloud_size = 50;
  
   
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
    x1 = 5000;
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

    speed = 0.5;
    gun_heading = new PVector(0,0);
}
void draw(){
 
  
    background(50);
    fill(100);
    sky(0, 0, width, 350, c1, c2, Y_AXIS);
    fill(0,100,70);
    rect(0,350,width,50);
    image(moon,50,0);
    generator();
    
    startP=startP-.5;
    for (float t=startP; t< 1; t=t+.017) 
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
    //clown
    for(int i=0; i<num_clowns; i++)
    {
       Clown[i].drawC();
       Clown[i].AIfollow(Kloc.x, Kloc.y);
       if(Clown[i].dead)
           Clown[i] = new AI(width + 200, random(50, height-100));
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
        if(cloud_x[i] <= -300)
            cloud_x[i] = width + 300;
        
      
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
   gun_heading = new PVector(mouseX-Kloc.x, mouseY-Kloc.y);
     
}