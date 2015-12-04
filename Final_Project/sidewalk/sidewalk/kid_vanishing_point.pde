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
    speed = 3;
    //c = color(random(20, 240), random(10, 240), random(10, 240));
    alive = true;
    time = 0;
    go = order;
  }
  
  void draw() {
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



/*
void setup() {
  
  size(1000, 500);
  smooth();
  numC = 1;
  thekids = new kid[numC];
  
  for (int i=0; i < numC; i++) {
    //thekids[i] = new kid(new PVector(-20, height+20), new PVector(width*.8, height/2), i*40+ (int)random(5, 20));
    thekids[i] = new kid(new PVector(-20, height+20), new PVector(width/2 + 60, height/2), i*40+ (int)random(5, 20));
  }
}
*/
void draw_vanishing_kid() {
 background(0);
 //will be gradient background of game
 //draw the city dome
 
 //where the house code will go
 
 
 stroke(255);
 fill(143, 211, 134, 128);
 ellipse(width*.8, height/2, 40, 20);
 
 //draw forground
 noStroke();
 fill(#325023);
 rect(0, height/2,  width, height/2);

 //draw road
 stroke(100);
 fill(200);
 //triangle(width*.8, height/2, width*.2, height+20, -.2*width, height+20);
 triangle(width/2 + 60, height/2, width*.2, height+20, -.2*width, height+20);
 

 
 for (int i=0; i < numC; i++) {
   thekids[i].draw();
   thekids[i].run();
 } 
}
/*
void mousePressed() {
  PVector end;
  
  end = new PVector(width/2 + 60, height/2);
  //end = new PVector(.8*width, height/2);
  //reset all the kids
   for (int i=0; i < numC; i++) {
     thekids[i].loc.x = -20;
     thekids[i].loc.y = height+20;
     thekids[i].alive = true;
     thekids[i].time = 0;
   }   
}*/