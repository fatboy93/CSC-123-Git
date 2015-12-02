AI c1  = new AI(500,500);
AI c2  = new AI(200,200);

float circleX = 100;
float circleY = 100;
PImage clown_1, clown_2;

void setup(){
size(1000,800);
background(0);
clown_1 = loadImage("clown_face2.png");
clown_2 = loadImage("clown_face22.png");
}
  



void draw(){
  background(0);
  
  character();
  moving();
  c1.drawC();
  c2.drawC();

}
void character(){
  
  fill(0,200,200);
  ellipse(circleX, circleY,10,10);
}

void moving(){
  if(keyPressed){
     if(key == 'w'){
     circleY = circleY -5;
     }
     else if(key == 'a'){
     circleX = circleX -5;
     }
      else if(key == 's'){
     circleY = circleY +5;
     }
     else if(key == 'd'){
     circleX = circleX +5;
     }
     
  }
}




class AI {
  
  float circle2X;
  float circle2Y;
  boolean following=true;
  boolean forward= true;
  float transperency=255;

  AI(float c2X, float c2Y){    
  circle2X = c2X;
  circle2Y = c2Y;
  }
  void drawC()
  {
  tint(255,255);
  fill(255,0,200);
  ellipse(circle2X, circle2Y,10,10);
  fill(255,0,200,50);
  //rect(circle2X-100, circle2Y-100,200,200);
  image(clown_1,circle2X-57,circle2Y-40);
  AIfollow();
  c_anim();
 


  }
  // functions go here
void c_anim(){
  //float animator;
 // animator = 255;
    pushMatrix();
  tint(255,transperency);
  image(clown_2,circle2X-57,circle2Y-40);
  popMatrix();
  
  if(following){
if(transperency<=255 && forward == true){
    transperency =transperency + 22;
    if(transperency>255){
    forward = false;
    }
}
if (forward == false){
  transperency = transperency-22;
}
if(transperency < -100){
  forward = true;
}
  }
  if(following ==false){
  transperency=255;
  }
}
  
void AIfollow(){
  float differenceY = circle2Y - circleY;
  float differenceX = circle2X - circleX;
 if(following){
  
  if(circleX<circle2X){
    circle2X = circle2X - 1;
  }
  else if(circleX>circle2X){
    circle2X = circle2X + 1;
  }
  if(circleY>circle2Y ){
    circle2Y = circle2Y + 1;
  }
  else if (circleY<circle2Y ){
    circle2Y = circle2Y - 1;
  }
 }
 
   /*if(differenceY<-100 || differenceY>100  ){
     following=false;
 
   }
    else if(differenceX<-100 || differenceX>100  ){
    following=false;
     
   }
  else{*/
    following = true;
  //}
}

}