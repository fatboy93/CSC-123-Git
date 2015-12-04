import ddf.minim.*;
AudioPlayer gunshot;
AudioPlayer themesong;
AudioPlayer starTheme;
AudioPlayer wasted_sound;
AudioPlayer damage;
AudioPlayer damage2;
AudioPlayer clown_dead;
Minim minim;

PImage wasted;

int lives = 3;
int points = 0;
PVector Blaster;
PImage gun;

PImage img1, img2, morph;
int loc;
color pix1, pix2;
float diff[], diffR[], diffG[], diffB[];
boolean start;
int count;
float difT;
boolean writeOut;

kid thekids[];
int numC;



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
void setup(){
  
  //text
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
    
    wasted = loadImage("wasted1.png");
    
    cloud_x = new float[cloud_size];
    cloud_y = new float[cloud_size];
    cloud_s = new float[cloud_size];
    cloud_dir = new PVector[cloud_size];

count= 0;
 start = true;
  difT = 40;
  writeOut = false;

  img1 = loadImage("wasted1.png");
  img2 = loadImage("wasted2.png");
   size(1000, 500);
  morph = createImage(img1.width, img1.height, RGB);

  //load up the pixels of each image
  img1.loadPixels(); 
  img2.loadPixels(); 
  morph.loadPixels();

  //make an array to store the differences
  diff = new float[img1.width*img1.height];
  diffR =new float[img1.width*img1.height];
  diffG = new float[img1.width*img1.height];
  diffB = new float[img1.width*img1.height];

  //compute the difference of each pixels in the images  
  for (int y = 0; y < img1.height; y++) {
    for (int x = 0; x < img1.width; x++) {
      loc = x + y*img1.width;
      //pull out the color from image 1
      pix1 = img1.pixels[loc];
      //pull out the color from image 2
      pix2 = img2.pixels[loc];
      diff[loc] = brightness(pix2) - brightness(pix1);
      diffR[loc] = red(pix2) - red(pix1);
      diffG[loc] = green(pix2) - green(pix1);
      diffB[loc] = blue(pix2) - blue(pix1);
      morph.pixels[loc] = img1.pixels[loc];
    }
  }
  
    size(1000, 500);
    
     smooth();
  numC = 1;
  thekids = new kid[numC];
  
  for (int i=0; i < numC; i++) {
    //thekids[i] = new kid(new PVector(-20, height+20), new PVector(width*.8, height/2), i*40+ (int)random(5, 20));
    thekids[i] = new kid(new PVector(-20, height+20), new PVector(width/2 + 60, height/2), i*40+ (int)random(5, 20));
  }
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

    speed = 0.5;
    gun_heading = new PVector(0,0);
    //sound
    minim = new Minim(this);
    gunshot = minim.loadFile("shot.mp3",2048);
    themesong = minim.loadFile("boy_theme.mp3",2048);
    starTheme = minim.loadFile("star_theme.mp3",2048);
    wasted_sound = minim.loadFile("wasted_sound.mp3",2048);
    damage = minim.loadFile("damage.mp3",2048);
    damage2 = minim.loadFile("damage2.mp3",2048);
    clown_dead = minim.loadFile("data/clown_death.mp3",2048);
    //themesong.play();
    //text
    // create the font
  font = createFont("bit.ttf", 30, true);
  
 
  // start the text off screen halfway down the canvas
  x = width/2;
  y = 1100;
 
  // set the font  
  textFont(font);
  
  //firework
   // start a new particle system
   fireW2 = new PSys[15];
}
void draw(){
 
  if(frameCount <= 2000)
  {
    background(0);
            //text
       
      // set the fill for the text
      fill(241, 255, 54);
     starTheme.play();
       /*
      // If the head of the text has started to go off screen,
      // draw a second copy behind it by 50 pixels
      if (x < 0) {
     
        text(str, x + textWidth(str) + 50, y);
      }
     
      // if the first copy of the text is completely offscreen, set x to be
      // at the current location of the second copy
      if (x <= -textWidth(str)) {
        x = x + (int)textWidth(str) + 50;
      }*/
     
      // Draw the text
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
 
  else if(frameCount>2000 && frameCount <=2700)
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
    starTheme.close();
    themesong.play();

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
        for(int i=0; i<num_clowns && !restart; i++)
        {
             Clown[i].drawC();
             Clown[i].AIfollow(Kloc.x, Kloc.y);
           
             //shoot the clowns
             if(impl_eli(x_b, y_b, Clown[i].clownX, Clown[i].clownY,40,30) <= 0)
              {
                 Clown[i] = new AI(width + random(0,1000), random(50, height-100));
                 points++;
                 if(points % 5 ==0)
                 {
                     clown_dead.play();
                     clown_dead.rewind();
                 }
                 shoot = false;
                 x_b = 0;
              }
              //check if clown eat the boy
              if(impl_circle(Clown[i].clownX, Clown[i].clownY, Kloc.x, Kloc.y, 40)<=0)
              {
                 lives--;
                 restart = true; 
                 if(restart){
                   damage.play();
                 }
                 if(lives ==1){
                 damage2.play();
                 }  
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
    
  
    float lx = 50, ly = height -30;
    fill(255);
    textSize(25);
    text("Points: " + points,  width-200, ly);
    
    text("Lives: ",lx+40, ly);
    for(int i=0;  i<lives; i++)
    {  
        lx+= 30;
        draw_heart(lx + 90,ly-12);
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
  else if(frameCount>2700)
  {
    sky(0, 0, width, 350, c1, c2, Y_AXIS);
    //fill(0,100,70);
    //rect(0,350,width,50);
    imageMode(CORNER);
    noTint();
    image(moon,50,0);
    generator();
    if(click)
    {
     countF++;
     for(int i=0; i<14; i++)
         fireW2[i].run();  
    
     if(countF > 80)
     {
       //after all the letters show up - change choice to 6
         for(int i=0; i<14; i++)
           fireW2[i].choice = 6;
     }
     //the last letter is dead - set click to false and go back to orignal firework
     if(fireW2[13].dead())
          click = false;
    }
     
     restart = true;
     stroke(255);
     //fill(143, 211, 134, 128);
    // ellipse(width*.8, height/2, 40, 20);
 
     //draw forground
     noStroke();
     fill(#325023);
     rect(0, height/2,  width, height/2);
    
     //draw road
     stroke(100);
     fill(200);
     //triangle(width*.8, height/2, width*.2, height+20, -.2*width, height+20);
     triangle(width/2 + 60, height/2, width*.2, height+20, -.2*width, height+20);
     house();

     for (int i=0; i < numC; i++) 
     {
       thekids[i].drawKid();
       thekids[i].run();
     } 
      //draw happy new year
   
   }
  if(lives<1)
  {
    themesong.close();
    image(wasted,width/2,height/2);
    wasted_sound.play();
    frameRate(10);
    
    background(128);
    if (start== true && count <= difT) 
    {
      for (int y = 0; y < img1.height; y++) 
      {
        for (int x = 0; x < img1.width; x++) 
        {
          loc = x + y*img1.width;
          //morph.pixels[loc] = color(x/5, 0, x/5);
          morph.pixels[loc] = color(red(img1.pixels[loc]) + (int)diffR[loc]*count/difT, green(img1.pixels[loc]) + (int)diffG[loc]*count/difT, blue(img1.pixels[loc]) + (int)diffB[loc]*count/difT);
        }
      }
      morph.updatePixels(); 
      count++;
    }

  image(morph, width/2, height/2);
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
   if(frameCount > 2000 && frameCount <=2700)
   {
       gun_heading = new PVector(mouseX-Kloc.x, mouseY-Kloc.y); 
       gun_heading.normalize();
       shoot = true;
       x_b = Kloc.x + 70*gun_heading.x;
       y_b = Kloc.y -30 + 70*gun_heading.y;
       gunshot.play();
       gunshot.rewind();
   }
   
   //firework
   click = true;
   if(frameCount >2400)
   {
      countF=0;
      
      float life = 80;
      //Create each letter separately
      fireW2[0] = new PSys(25, new PVector(40,100), life, //C
                        0, 9);
      fireW2[1] = new PSys(45, new PVector(100,90), life, //O
                        20, 10); 
      fireW2[2] = new PSys(25, new PVector(190,100), life, //N
                        20, 5); 
      fireW2[3] = new PSys(25, new PVector(240,100), life, //G
                        20, 11);
      fireW2[4] = new PSys(30, new PVector(330,100), life, //R
                        20, 8);
      fireW2[5] = new PSys(45, new PVector(400,90), life, //A
                        20, 2);
      fireW2[6] = new PSys(25, new PVector(470,100), life, //T
                        20, 12);
      fireW2[7] = new PSys(25, new PVector(540,100), life, //U
                        20, 14);
      fireW2[8] = new PSys(25, new PVector(580,100), life, //L
                        20, 13);
      fireW2[9] = new PSys(45, new PVector(660,100), life, //A
                        20, 2);
      fireW2[10] = new PSys(25, new PVector(720,100), life, //T
                        20, 12);
      fireW2[11] = new PSys(25, new PVector(800,100), life, //I
                        20, 15);
      fireW2[12] = new PSys(45, new PVector(850,100), life, //O
                        20, 10);
      fireW2[13] = new PSys(25, new PVector(940,100), life, //N
                        20, 5);                  
           
       //reset fireW1
       //change the num of firework to 15 - more firework after happy new year
       num_fire_work = 10;
       fireW1 = new PSys[num_fire_work];
       for(int i=0; i<num_fire_work; i++)
            fireW1[i] = new PSys(100, new PVector(random(20,width-20), random(40,height/2)), 
                                  random(60,120), random(30,60),random(0,4));
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

//THIS IS THE RIGHT CODEEEEEE


class kid {
  PVector loc, stop, begin; //stop point is far end of road triangle, begin is point of bottom of road triangle, loc is the current location of the kid
  PVector dir; //direction of kid vector
  float speed; //so kids can be different speeds
  float dist; //need to know how far (long) the road triangle is to know how far kids will need to travel
  color c;
  boolean alive;
  int go, time; //time-how long the kid has been going, go-when kid should start driving because kids start at different times
  
  kid(PVector start, PVector end, int order) {
    begin = start.get(); //doing this to copy a vector
    loc = start.get();
    stop = end.get();
    end.sub(start); //subtracting two points, results in a vector 
    dir = end.get();
    dist = dir.mag();
    dir.normalize();

    //speed = random(1.5, 1.7);
    speed = 5;
    //c = color(random(20, 240), random(10, 240), random(10, 240));
    alive = true;
    time = 0;
    go = order;
  }
  
  void drawKid() {
    float more;
    PVector temp;
    
    temp = new PVector(stop.x, stop.y);
    temp.sub(loc);
    more = temp.mag();

    if (alive && time >= go) {
      pushMatrix();
      translate(loc.x, loc.y);
      scale( (more/dist)*1.6 );
      fill(255, 222, 170); //flesh color
      noStroke();
      //ARMS
      // right arm
          pushMatrix(); 
          //fill(0);
          translate(20, -10);
          //rotate(rS);
          //rotate(-.5);
          rotate(10.3);
          translate(-5,0);
          stroke(128, 21, 21);
              pushMatrix();  //RIGHT forearm
              //fill(255,0,0);
              translate(0,35);
              //rotate(rW);
              rotate(-.2);
              fill(255, 222, 170);
              rect(0,0,15,20);
              popMatrix();
          fill(212, 106, 106);
          stroke(128, 21, 21);
          rect(0,0,15,40); //RIGHT upper arm
          popMatrix();
        
        //TRYING TO GET ARM TO BE FLAILING
        //left  arm
        pushMatrix();  
        //fill(255);
        translate(-20,-10);
        //rotate(lS);
        rotate(21);
        translate(-10,0);
            pushMatrix();  //LEFT forearm
            translate(0,35);
            //rotate(lW);
            rotate(-.2);
            fill(255, 222, 170);
            rect(0,0,15,20);
            popMatrix(); 
        fill(212, 106, 106);
        stroke(128, 21, 21);
        rect(0,0,15,40);  //LEFT upper arm
        popMatrix();
        
        
        
        
    
        
        //LEGS
        //right leg
        pushMatrix();
        translate(5,20);
        //rotate(rL);
        fill(22, 41, 85);
        stroke(6, 21, 57);
        rect(0,0,20,40); //leg
            pushMatrix();  //foot
            translate(15,40);
            fill(255, 222, 170);
            stroke(128, 21, 21);
            ellipse(0,0,30,20);
            popMatrix();
        popMatrix();
      
      
       //left leg
       pushMatrix();
       translate(-20,20);
       //rotate(lL);
       fill(22, 41, 85);
       stroke(6, 21, 57);
       rect(0,0,20,40); //leg
            pushMatrix();  //foot
            translate(5,40);
            fill(255, 222, 170);
            stroke(128, 21, 21);
            ellipse(0,0,30,20);
            popMatrix();
       popMatrix();
        
       //body
       fill(212, 106, 106); //sweater
       stroke(128, 21, 21);
       ellipse(0,0, 70, 70); 
       fill(22, 41, 85);   //pants
       arc(0,10,70,60,0,PI,CHORD);
  
       //face 
       fill(255, 222, 170);   
           pushMatrix(); //face
           translate(0,-50);
           stroke(0);
           ellipse(0,0,65,65); 
           //fill(255); //eyes
           //arc(-15,5,15,15,-10,PI,CHORD); //left
           //arc(15,5,15,15,-10,PI,CHORD); //right
           //fill(0); //pupils
           //ellipse(-15,5,3,3);  //left
           //ellipse(15,5,3,3);   //right
           fill(97, 81, 146); //beanie
           stroke(255,0,0);
           arc(0,0,65,65,-PI,0, CHORD); 
           ellipse(0,-40,15,15);
           popMatrix();
       
        //fill(random(0, 255), random(0, 255), random(0, 255));
        //rect(0, 0, 40, 20);
      popMatrix();
    }
    time++;
  }
  
  
  void run() {
    float traveled;
    PVector temp;
    
    if (time >= go) {
      temp = new PVector(begin.x, begin.y);
      temp.sub(loc);
      traveled = temp.mag();
      if (traveled < dist) {
        loc.x += dir.x*speed;
        loc.y += dir.y*speed;
      } else {
        alive = false;
      }
    }  
  }
    
}


void house(){
  noStroke();
rect(width/2+40,height/2-40,40,40);
  triangle(width/2+40,height/2-40,width/2+60,height/2-60,width/2+80,height/2-40);
  fill(255,255,0);
  rect(width/2+45,height/2-30,10,10);
  rect(width/2+65,height/2-30,10,10);
  fill(139,69,30);
  rect(width/2+55,height/2-15,10,15);
 stroke(255,50,0);
 strokeWeight(4);
 line(width/2+35,height/2-35,width/2+60,height/2-60);
 line(width/2+60,height/2-60,width/2+85,height/2-35);



}