//fill(255,0,0);
//ellipse(20,50,10,10);
//start using function - organize your code
//declare variable
float r,g,b; //hold red, green and blue value  ; these are global variables
//float take less memory than double
//general don't use 1 letter for variables.
//rule about the name of variable: can inlcude character, numbers
//can't start with a number -> general start with a lowercase letter.
//example: ballX or ball_X, no use balllx -> hard to read.
float x,y;

void setup()  //will run first and run only 1 time.
{
  //int x;  //local variable -> only use inside in setup.
  size(400,400);
  background(30);
  //ellipse color
  r = random(255);  //give me a random number from 0 - 255
  g = random(255);
  b = random(255);
  
  x = random(25,width - 25);  //get random position of x and y
  y = random(25,height - 25); //so the ellipse can be inside the screen
                              // random(lower_bound, upper_bound);
}

void draw()  //call 60 times per second but we can't tell
{
  //background(30);  //this will clear the old pic when you use mousePressed()
                   //it will clear the background every single time it run
                   //because the function will run 60 times/second 
                   
  //r = random(255);  //give me a random number from 0 - 255
  //g = random(255);
  //b = random(255);
  // because this function run 60 times/second -> changing color oh yeah!!!
  fill(r,g,b);
  noStroke();
  //better to indend code inside push and pop matrix.
  pushMatrix();  //save the origin
      translate(x,y);  //origin at x,y
      //ellipse(x,y,50,50);
      ellipse(0,0,50,50);  //the center is at x,y
      fill(255);
      //ellipse(x-20, y-20, 20, 20);
      //ellipse(x+20, y-20, 20, 20);
      ellipse(-20, -20, 20, 20);
      ellipse(+20, -20, 20, 20);
  popMatrix();  //restore the origin
  
   //x = x-4; // create motion  // x -= 1 // x--
}

void mousePressed()  //click - multiply the pic or create a new one
                     //depend on you set the background(30) in draw()  
{
  r = random(255);  //give me a random number from 0 - 255
  g = random(255);
  b = random(255);
  
  //x = random(25,width - 25);  //get random position of x and y
  //y = random(25,height - 25); //so the ellipse can be inside the screen
                              // random(lower_bound, upper_bound);
  x = mouseX;  //we can draw the pic where we click the mouse
  y = mouseY;
 
  
  
}


// if we use the function we have to use all function - 
//all lines have to be in the function