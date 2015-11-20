/* CSC 123 base code for hierarchical duck lab
 * by ZJ Wood - Fall 2011
 * updates by J Workman - Fall 2013
 *
 * TODO: read through the code to make sure you understand what it is doing
 * TODO: add code in order to make the duck have feet that also walk as it animates
 */

PVector Dloc;
PVector dir;
float neckR, wingR, speed, feet;

boolean neckDown = true;
boolean wingDown = false;
boolean animateOn = false;
boolean frontfeetFoward = true;
boolean backfeetForward = false;
  
// normal set up
void setup() 
{
  size(400, 400);
  smooth();
  neckR = 0;
  wingR =-.2;
  feet = .2;
  Dloc = new PVector(width*.9, height/2);
  dir = new PVector(-1, 0);
  speed = 0.5;
}

// normal draw
void draw() 
{
  background(12, 245, 216);
  
  // foreground
  fill(78, 155, 16);
  rect(0, height/2, width, height/2);
  
  drawDuck();
  
  if (animateOn) 
  {
     animate();
  }
  
}

// method to control starting the duck over again and control animation on and off
void mousePressed() 
{
  Dloc.x = width*.9;
  animateOn = !animateOn;
}

// code to draw the duck with animation parameters neckR and wingR - other transforms align
// the peices to the correct pivot points
void drawDuck() 
{
    noStroke();
    
    pushMatrix();
      translate(Dloc.x, Dloc.y); // move the entire duck
      scale(2); // scale the entire duck
      fill(245, 226, 12);
      ellipse(0, 0, 40, 30); // body
      
      //draw neck and head with possible animation transforms
      pushMatrix();
        translate(-16, 0); // move back into draw position - structural constant
        rotate(neckR);  // rotate by neckR parameter - control knob
        translate(0, -10); // move neck and head to pivot point - structural constant
        ellipse(0, 0, 10, 18); // neck
        ellipse(0, -7, 14, 14); // head
        fill(0);
        ellipse(0, -9, 4, 4);  // eye
        fill(155, 111, 16);
        triangle(-10, -8, -4, -11, -4, -5); // beak
      popMatrix();
     
      // draw wing with possible animation transforms
      fill(227, 208, 66);
      pushMatrix();
         translate(-8, -5); // move into draw position - structural constant
         rotate(wingR); // animtion parameter to control wing flap - control knob
         translate(14, 0); // move to the pivot point - structural constant
         ellipse(0, 0, 34, 20); // wing
      popMatrix();
      //drawing the legs
      fill(#F58C23);
      pushMatrix();
         translate(0,12);  //move into the draw position
         rotate(feet);  //control the angle
         translate(0,5);  //move to the pivot point
         ellipse(0,0,4, 15); //leg
         fill(#9B5F22);
         triangle(2, 7.5, -4, 12, -6, 5 );
      popMatrix();
      
    popMatrix();          
}
 
//function to update all animation parameters 
void animate() 
{
  // update the duck's global location
  Dloc.x = Dloc.x + dir.x*speed;
  Dloc.y = Dloc.y + dir.y*speed;
  
  //feet
  if(feet < -.5)
      frontfeetFoward = true;
  else if(feet > .5)
      frontfeetFoward = false;
  
  if(frontfeetFoward)
      feet += .03;
  else
      feet -=.03;
  // find out how much the neck is rotated to decide which way to rotate
  // these constrain how much the neck moves up and down
  if (neckR < -1) 
  {
     neckDown = false;
  } 
  else if (neckR > 0.3) 
  {
     neckDown = true;
  }
 
  // depending on which way we need to rotate, do so
  if (neckDown) 
  {
     neckR -= .03; 
  } 
  else 
  {
    neckR += .03;
  }
  
  // find out how much the wing is rotated to decide which way to rotate
  // these constrain how much the wing moves up and down
  if (wingR < -1.1) 
  {
     wingDown = true;
  } 
  else if (wingR > 0.3) 
  {
     wingDown = false;
  }
 
  if (wingDown) 
  {
     wingR += .03; 
  } 
  else 
  {
     wingR -= .03;
  }
}