//AI cl1  = new AI(500,500);
//AI cl2  = new AI(200,200);
PImage clown_1, clown_2;
/*
void setup(){
size(1000,800);
background(0);
clown_1 = loadImage("clown_face2.png");
clown_2 = loadImage("clown_face22.png");
}
*/
  


/*
void draw(){
  background(0);
  
  character();
  moving();
  cl1.drawC();
  cl2.drawC();

}*/
/*
void character(){
  
  fill(0,200,200);
  ellipse(circleX, circleY,10,10);
}*/

void moving(){
  /*
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
     
  }*/
}




class AI {
  
  float clownX;
  float clownY;
  boolean following=true;
  boolean forward= true;
  boolean dead = false;
  float transperency=255;

  AI(float c2X, float c2Y){    
  clownX = c2X;
  clownY = c2Y;
  }
  void drawC()
  {
  tint(255,255);
  fill(255,0,200);
  //ellipse(clownX, clownY,10,10);
  fill(255,0,200,50);
  //rect(clownX-100, clownY-100,200,200);
  image(clown_1,clownX-57,clownY-40);
 // AIfollow();
  c_anim();
 


  }
  // functions go here
void c_anim(){
  //float animator;
 // animator = 255;
    pushMatrix();
  tint(255,transperency);
  image(clown_2,clownX-57,clownY-40);
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
  
void AIfollow(float kid_x, float kid_y){
  
  if(clownY <= height)
  {
      PVector dir_follow = new PVector(kid_x - clownX, kid_y - clownY);
      dir_follow.normalize();
      clownX += dir_follow.x *5;
      clownY += dir_follow.y *5;
      if(pow(kid_x - clownX,2) + pow(kid_y - clownY,2) - 30 <= 0)
          boy_is_dead = true;
  }
/* if(following){
  
  if(kid_x<clownX){
    clownX = clownX - 1;
  }
  else if(kid_x>clownX){
    clownX = clownX + 1;
  }
  if(kid_x>clownY ){
    clownY = clownY + 1;
  }
  else if (kid_y<clownY ){
    clownY = clownY - 1;
  }
 }*/
 
   /*if(differenceY<-100 || differenceY>100  ){
     following=false;
 
   }
    else if(differenceX<-100 || differenceX>100  ){
    following=false;
     
   }
  else{*/
    //following = true;
  //}
}

}