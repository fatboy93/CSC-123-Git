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
}

void draw()  //call 60 times per second but we can't tell
{
  //r = random(255);  //give me a random number from 0 - 255
  //g = random(255);
  //b = random(255);
  // because this function run 60 times/second -> changing color oh yeah!!!
  fill(r,g,b);
  ellipse(200,200,50,50);
}
// if we use the function we have to use all function - 
//all lines have to be in the function