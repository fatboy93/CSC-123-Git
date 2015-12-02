PVector Kloc;
PVector mR;
PVector Jump;
PVector Gravity;
float speed;
float rS, rW;  //right arm
float lS, lW;  //left arm
float rL;
float lL;
boolean kid_jump = false;
boolean Rleg = false;
boolean Lleg = false;
boolean moveright = false;
boolean moveleft = false;
/*
void setup()
{
  size(500,500);
  
  rS = -.5; //right Shoulder  //I didn't use these yet- maybe use them to make arms move when walking
  rW = -.2;  //right Wrist 
  lS = .5;
  lW = -.2;
  rL = 0;  //right leg
  lL = 0;
  
  Kloc = new PVector(50, height/2);
  mR = new PVector(1,0);
  Jump = new PVector(0, -3);
  Gravity = new PVector(0, .05);
  
  speed = 0.5;
}*/
 /* 
void draw()
{
  background(255);
  drawKid();
  
  if (moveright)
  {
    moveR();
  }
}*/

//void mousePressed()
//{
  //Kloc.x = width/2;
  //moveright = !moveright;
 // moveright = true;
 // kid_jump = true;
  //Jump = new PVector(0, -3);
 // Gravity = new PVector(0, .05);
//}
  
void keyPressed()
{
    if(key == ' ')
    {
        kid_jump = true;
        Jump = new PVector(0, -8);
        Gravity = new PVector(0, .2);
    }
}

void drawKid()
{
  //size(500,500);
  noStroke();
  fill(255, 222, 170);
   //kid
   pushMatrix();
   if(kid_jump)
   {
       Kloc.y += Jump.y;
       Jump.y += Gravity.y;
       if(Kloc.y > .67*height)
       {
           kid_jump = false;
           Kloc.y = .67*height;
       }
   }
   translate(Kloc.x, Kloc.y);
   
 
   
fill(255, 222, 170); //flesh color
noStroke();

    //ARMS
    // right arm
    pushMatrix(); 
    //fill(0);
      translate(20, -10);
      if(mousePressed)
          rotate(gun_heading.heading()-PI/2);
      else 
          rotate(rS);
      translate(-5,0);
      stroke(128, 21, 21);
      pushMatrix();  //RIGHT forearm
        //fill(255,0,0);
        translate(0,35);
        rotate(rW);
        fill(255, 222, 170);
        rect(0,0,15,20);
      popMatrix();
      fill(212, 106, 106);
      stroke(128, 21, 21);
      rect(0,0,15,40); //RIGHT upper arm
    popMatrix();
    
    //left  arm
    pushMatrix();  
    //fill(255);
    translate(-20,-10);
    rotate(lS);
    translate(-10,0);
   
    pushMatrix();  //LEFT forearm
    translate(0,35);
    rotate(lW);
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
    rotate(rL);
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
    rotate(lL);
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
    fill(255); //eyes
    arc(-15,5,15,15,-10,PI,CHORD); //left
    arc(15,5,15,15,-10,PI,CHORD); //right
    fill(0); //pupils
    ellipse(-15,5,3,3);  //left
    ellipse(15,5,3,3);   //right
    fill(97, 81, 146); //beanie
    stroke(255,0,0);
    arc(0,0,65,65,-PI,0, CHORD); 
    ellipse(0,-40,15,15);
    popMatrix();
     
    
    popMatrix();
   
}

void moveR()
{
 // Kloc.x = Kloc.x + mR.x*speed;
 // Kloc.y = Kloc.y + mR.y*speed;
  
  //Right leg
  if (rL < -.4) 
  {Rleg = true; } 
  else if (rL > .3) 
  {Rleg = false; }
 
  if (Rleg) 
  {rL += .02; } 
  else 
  {rL -= .02; }
  
  //Left leg
   if (lL < -.5) 
  {Lleg = true;} 
  else if (lL > .5) 
  {Lleg = false;}
 
  if (Lleg) 
  {lL += .02; } 
  else 
  {lL -= .02;}
  
}