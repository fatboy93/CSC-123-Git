PVector v1, v2;
float curX;
float curY;
color[] b_c;
float rot, speed;
float change_color = 0;
color c_b1 = color(random(255), random(255), random(255));
boolean eat_ball = false;
boolean collide = false;
boolean ball_on = false, stop_game = false;
float bx, by, heart_x, heart_y;
int points, lives;
int time = 0;
float [] box_x;
float [] box_y;
int size_box;
float start_box_x;
boolean box_y_on = true;
float real_time = 0;
boolean start_game = false;
boolean good_distance = false;
boolean restart = false;
boolean nogood = false;
void setup()
{
  background(0);
  size(500,500);
  speed = 2.5;
   curX = width/2;
   curY = height/2;
    rot = 0;
    bx = random(50,width-50);
    by = random(50,height-50);
    points = 0;
    lives = 3;
    heart_x = 75;
    heart_y = 12;
    size_box = 10;
    box_x = new float[size_box];
    box_y = new float[size_box];
    start_box_x = 25;
}

void draw_heart(float cx, float cy)
{
    float t=0;
    float x1, y1;
    noStroke();
    fill(255,0,0);
    pushMatrix();
      translate(cx, cy);
      scale(.5);
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
void ball(float cx, float cy, float rad, color c)
{
    fill(c);
    ellipse(cx,cy,rad*2, rad*2);
}
void batman(float start_x, float start_y, color c_b)
{
   
  color black = color(0);
    float t=0;
   // background(255);
    pushMatrix();
    //translate(300,300);
    noStroke();
       // translate(x1,y1);
       translate(start_x, start_y);
        //if(move)
         //{
           if(v1.x >0)
             rotate(rot+PI/2);
           else
             rotate(rot-PI/2);
       //  }
       
       // stroke(random(255), random(255), random(255));
       scale(.2);
       fill(c_b);
        ellipse(0,0,300,140);
       
        fill(black);
        arc(-44,-60,60,70, PI/2 - PI/8, PI+PI/3);
        arc(44,-60,60,70, -PI/3, PI/2+PI/8);
       // stroke(#61C96E);
        line(-30,-28, -25, -75);
        line(30,-28,25, -75);
       // stroke(#1F2ADE);
        line(-25,-75, -15, -55);
        line(25,-75, 15, -55);
        //stroke(#8F1BDE);
        line(-15,-55,15,-55);
        //stroke(#E85823);
        fill(black);
      
       noStroke();
        ellipse(-80,62,60,70);
         ellipse(-28,62,57,70);
         ellipse(28,62,57,70);
         ellipse(80,62,60,70);
       //top
       fill(black);
       triangle(-32,-25, -49,-70, -25,-70);
       triangle(32,-25,49,-70,25,-70);
       fill(c_b);
       triangle(-30,-28, -25, -80, -15,-55);
       triangle(30,-28,25,-80,15,-55);
       //head
       fill(black);
       quad(-15,-55,-25, -80, 25,-80, 15,-55);
       
    popMatrix();
}

void draw_box(float cx, float cy)
{
    fill(255,0,0);
    rectMode(CENTER);
    rect(cx, cy, 10, 10);
}

void ready(float ready_time)
{
    fill(255);
    textSize(20);
    textAlign(CENTER);
    text("Ready in " + int((200 - ready_time)/60), width/2, 20);
}
void draw()
{
  if(start_game)
  {
    if(lives > 0 )
    {
     background(0);
        
      //make the bat move after the mouse
      v1 = new PVector(mouseX - curX, mouseY-curY);
      v1.normalize();
      v1.mult(speed);
      rot = atan((mouseY-curY)/(mouseX-curX));
      curX += v1.x;
      curY += v1.y;
      //Batman
      batman(curX, curY, c_b1);
      
      
     //draw box
      fill(255,0,0);
      rectMode(CENTER);
      for(int i=0; i<size_box; i++)
      {
          box_x[i] = start_box_x;
          //only draw y one time
          if(box_y_on)
            box_y[i] = random(50,height-25);
          rect(box_x[i], box_y[i], 10,10);  
         // draw_box(box_x[i], box_y[i]);
          start_box_x += 45;
          //stop changing y after the 1st time
          if(i == size_box-1)
            box_y_on = false;
          if(time == 2100 || collide)
          {
              time = 0;
              box_y_on = true;
          }
          //check if the bat collide the box
          if(abs(curX - box_x[i]) < 20 && abs(curY-box_y[i]) < 20 && time > 200)
              collide = true;
       }
       start_box_x = 25;
      
      //draw balls
          ball(bx,by, 8, c_b1);
          
       //scores of bat meet the ball
      if(eat_ball)
      {
        while(!good_distance)
        {
           bx = random(50,width-50);
           by = random(50,height-50);
           for(int i=0; i<size_box; i++)
           {
               if(pow(bx-box_x[i],2) + pow(by-box_y[i],2) - 50*50 < 0) 
               {
                    nogood = true;
                    i = size_box;
               }
         }
           if(!nogood)
               good_distance = true;
           
        }
        good_distance = false;
         c_b1 = color(random(255), random(255), random(255), 120);
         eat_ball = false;
         points++;
      }
    
      
      if(pow(curX - bx,2) + pow(curY - by, 2) - 2*15*15 <= 0 && time > 200)
            eat_ball = true;
      //changing the color every second
      if(change_color++ % 60 == 0)
          c_b1 = color(random(255),random(255), random(255));
     
      //printing out points
       fill(255);    
       textSize(20);
       text("Points: " + points, 430,20 );
       text("Lives: ", 40, 20);
      
      //if the bat collide the boxes lose 1 life each time
      if(collide)
      {
          collide = false;
          lives--;
          time = 0;
      }
      
      //print ready time
      if(lives > 0 && time <= 200)
        ready(time);
      else if(time > 200 && time <260)
          text("GO!!!",width/2,20);
      else if (lives < 1)
          text("T-T", width/2, 20);
      else
            text("Change boxes in: " + int((2100 - time)/60), width/2, 20);
           
      
      //printing out lives
      for(int i=0; i < lives; i++)
      {
          draw_heart(heart_x, heart_y);
          heart_x += 20;
      }
      //set heart_x back to original
      heart_x = 75;
      time++;
      real_time++;
    }
     else
     {  
       background(0);
         pushMatrix();
           translate(width/2, height/2);
           textAlign(CENTER);
           fill(#2EE51E);
           textSize(50);
           text("Game Over!!!", 0, -100);
           textSize(40);
           fill(#F22544);
           text("Scores: " + points, -10, -20);
           textSize(30);
           fill(#DFE53A);
           text("Time playing: " + int(real_time/60), -20, 50);
           text("Click any where to", 0,90);
           textSize(50);
           fill(random(255), random(255), random(255));
           text("PLAY AGAIN!!!", 0, 150);
         popMatrix();
        restart = true;
     }
  }
  else  //print instruction and start game
  {
      pushMatrix();
        translate(width/2, height/2);
        fill(#2EE51E);
        textSize(40);
        textAlign(CENTER);
        text("Welcome to", 0,-200);
        text("*.* Bat Bangs Balls *.*", 0,-150);
        fill(#F22544);
        textSize(25);
        text("Instructions: ", 0, -110);
        textSize(15);
        text("1. Move the mouse - the bat will follow.", 0, -90);
        text("2. Bang the ball to get points." ,0, -70);
        text("3. You only have 3 lives in total.", 0, -50);
        text("4. If you hit the block you lose 1 life.", 0, -30);
        text("5. You will have 3 seconds to get ready. (Invincible)",0,-10);
        text("6. The block will change positon when you hit or after 30s.",0, 10);
        text("Tips: Apply break by stop moving the mouse.", 0, 30);
        text("Enjoy the game!!!", 0, 50);
        textSize(25);
        fill(#DFE53A);
        text("Press anywhere to", 0, 100);
        textSize(50);
        fill(random(255), random(255), random(255));
        text("START!!!", 0, 150);
      popMatrix();
  }
}

void mousePressed()
{
    if(restart == true)
       lives = 3;
    start_game = true;
}