/*
Nghia Nguyen
CPE 123 - Lab 9: Firework
*/
// Base particle code for CSC 123 Lab 9

// TODO_1: add a new particle constructor that will take in a starting color for a particle
// TODO_2: add code to the Particle System to call the new Particle constructor
// TODO_3: add code so that the fire work explodes where the mouse clicks (use the existing firework, just restart a new system where the moust clicks)
// TODO_4: add code to start another firework when the old one dies
// TODO_5: add code in order to have the shading/transparency and or shape of the particle change over time
//         or depending on velocity
// TODO_6: add more then one firework

// define a particle
boolean click;
float e = 2.7182818284590452353602874713527;
class Particle 
{
   PVector loc;
   PVector vel;
   PVector accel;
   float r;
   float life;
   float origin_life;
   color pcolor;
  
   // constructor
   Particle(PVector start) 
   {
      accel = new PVector(0, 0.05); //gravity
      vel = new PVector(random(-1, 1), random(-2, 0), 0);
      pcolor = color(random(255), random(255), random(255));
      loc = start.get();  // make a COPY of the start location vector
      r = 8.0;
      life = 100;
      origin_life = life;
   }
    
   // TODO_1 define another constructor that allows a particle to start with a given color
    Particle(PVector start, color c) 
   {
      accel = new PVector(0, 0.05); //gravity
      vel = new PVector(random(-1, 1), random(-2, 0), 0);
      pcolor = c;
      loc = start.get();  // make a COPY of the start location vector
      r = 8.0;
      life = 100;
       origin_life = life;
   }
   
   //constructor with life_span
     Particle(PVector start, color c, float l) 
   {
      accel = new PVector(0, 0.05); //gravity
      vel = new PVector(random(-1, 1), random(-2, 0), 0);
      pcolor = c;
      loc = start.get();  // make a COPY of the start location vector
      r = 7.0;
      life = l;
      origin_life = life;
   }
   // what to do each frame
   void run(float choice) 
   {
    
      updateP(choice);
      renderP(choice); // render is a fancy word for draw.  :)
   }
    
   // a function to update the particle each frame
   void updateP(float choice) 
   {
     //parametric firework
      if(choice > 1 && choice <= 4 && (life %2 == 0 || life <= .85*origin_life))
      { 
        vel.add(accel);     
        loc.add(vel);
      }
      //normal firework
      if(choice <= 1)
      {
          vel.add(accel);     
          loc.add(vel);
      }
      //happy new year firework
      if(choice == 6 && life <=.8*origin_life)
      {
          vel.add(accel);     
          loc.add(vel);
      }
      // do not thing - wating for all the letters to comes up
      //change choice to 6 later on
      if(choice != 5)
          life -= 1.0;
   }
    
   // how to draw a particle
   void renderP(float choice) 
   {
      pushMatrix();
       stroke(pcolor);
       fill(pcolor, life);
       translate(loc.x, loc.y);
       //make the ellispe rotate with gravity
       rotate(vel.heading2D());
       if(life < 25.0 || (life <.9*origin_life && choice == 6))
           pcolor = color(random(255), random(255), random(255));
       if(life > 25 || choice == 6)
           ellipse(0, 0, r*vel.mag(),r*sin(life/100));
       else
           ellipse(0, 0, r*cos(life),r*sin(life/100)+PI/6);
      popMatrix();
   }
    
    // a function to test if a particle is alive
   boolean alive() 
   {
      if (life <= 0.0) 
         return false;
      return true;
   }
} //end of particle object definition

// now define a group of particles as a particleSys
class PSys
{
  
   ArrayList particles; // all the particles
   PVector source; // where all the particles emit from
   color shade; // their main color
   float explode; //store the y-location of the bullet
   float choice;
   float delay;
   // constructor
   PSys(int num, PVector init_loc) 
   {
      particles = new ArrayList();
      source = init_loc.get();  // you have to do this to set a vector equal to another vector
      shade = color(random(255), random(255), random(255));  // TODO_2 use this!
      for (int i=0; i < num; i++) 
      {
         particles.add(new Particle(source, shade));
      }
      explode = height;
   }
   //different life span
   PSys(int num, PVector init_loc, float l_span, float rad, float choice) 
   {
      this.choice = choice;
      particles = new ArrayList();
      source = init_loc.get();  // you have to do this to set a vector equal to another vector
      shade = color(random(255), random(255), random(255));  // TODO_2 use this!
      float t = PI/20;
      PVector cir = source.get();
      //use for letter
      int h=0;
      if(choice >= 2)
          rad = random(2,3);
      for (int i=0; i < num; i++) 
      {
        //normal firework
         if(choice <= 1)
             particles.add(new Particle(source, shade, l_span));
         //smiley face firework
         else if(choice <= 2)
         {
             if(i<num/2)
             {
                 cir.x = source.x + rad*cos(t);
                 cir.y = source.y + rad*sin(t);
                 t += PI/20;
             }   
             else if(i<num*.75)
             {
                 cir.x = source.x+rad/2;
                 cir.y = source.y;
             }
             else
             {
                 cir.x = source.x-rad/2;
                 cir.y = source.y;
             }
             particles.add(new Particle(cir, shade, l_span));
         }
         //heart firework
         else if(choice <=3)
         {
             cir.x = source.x + rad*(16*pow(sin(t),3));
             cir.y = source.y - rad*(13*cos(t) - 5*cos(2*t) - 2*cos(3*t) - cos(4*t));
             t += PI/20;
             rad -= .01;
             particles.add(new Particle(cir, shade, l_span));
         }
         //butterfly
         else if(choice <= 4)
         {
             cir.x = source.x + 20*(sin(t))*(pow(e,cos(t)) - 2*cos(4*t) - pow(sin(t/12),5));
             cir.y = source.y - 20*(cos(t))*(pow(e,cos(t)) - 2*cos(4*t) - pow(sin(t/12),5));
             t += PI/30;
             particles.add(new Particle(cir, shade, l_span));
         }   
      }
      explode = height;
   }
   
   PSys(int num, PVector init_loc, float l_span, float delay, int letter)
   {
      particles = new ArrayList();
      source = init_loc.get();  // you have to do this to set a vector equal to another vector
      shade = color(random(255), random(255), random(255));  // TODO_2 use this!
      PVector cir = source.get();
      this.delay = delay;
      int h=0;
      
      //set choice to 5 so life will not decrease until all the letters show up
      choice = 5;

      float t=0;
      for (int i=0; i < num; i++) 
      {
          //letter H = 1
          if(letter == 1)
          {
            //bar
            cir.x = source.x - 24 + h;
            cir.y = source.y;
            particles.add(new Particle(cir, shade, l_span));
           
            //left 
            cir.x = source.x-20;
            cir.y = source.y + h;
            particles.add(new Particle(cir, shade, l_span));
            cir.y = source.y - h;
            particles.add(new Particle(cir, shade, l_span));
            //right
            cir.x = source.x+20;
            cir.y = source.y + h;
            particles.add(new Particle(cir, shade, l_span));
            cir.y = source.y - h;
            particles.add(new Particle(cir, shade, l_span));
    
           // particles.add(new Particle(cir, shade, l_span));
          }
          //Letter A = 2
          if(letter == 2)
          {
            //bar
            if(i<.6*num)
            {  
                cir.x = source.x - 24 + h;
                cir.y = source.y+20;
                particles.add(new Particle(cir, shade, l_span));
            }  
            //left
            cir.y = source.y - 30 + h;
            cir.x = source.x + h/2.5;
            particles.add(new Particle(cir, shade, l_span));
            
            //right
            cir.y = source.y - 30 + h;
            cir.x = source.x - h/2.5;
            particles.add(new Particle(cir, shade, l_span));
            
          }
          //letter P == 3
          else if(letter == 3)
          {
              cir.x = source.x-20;
              cir.y = source.y + h;
              particles.add(new Particle(cir, shade, l_span));
              cir.y = source.y - h;
              particles.add(new Particle(cir, shade, l_span));
              cir.x = source.x + 20*cos(t);
              cir.y = source.y - 20 + 25*sin(t);
              particles.add(new Particle(cir, shade, l_span));
              t += PI/10;
              
          }
          //letter Y == 4
          else if(letter == 4)
          {
              cir.x = source.x;
              cir.y = source.y + h;
              particles.add(new Particle(cir, shade, l_span));
              cir.x = source.x-20+h/2.5;
              cir.y = source.y- 40 + h;
              particles.add(new Particle(cir, shade, l_span));
              cir.x = source.x+20-h/2.5;
              particles.add(new Particle(cir, shade, l_span));
             
          }
          //letter N == 5
          else if(letter == 5)
          {
              cir.x = source.x-25;
              cir.y = source.y + h;
              particles.add(new Particle(cir, shade, l_span));
              cir.y = source.y - h;
              particles.add(new Particle(cir, shade, l_span));
              cir.x = source.x+25;
              cir.y = source.y + h;
              particles.add(new Particle(cir, shade, l_span));
              cir.y = source.y - h;
              particles.add(new Particle(cir, shade, l_span));
              cir.x = source.x -25 + h;
              cir.y = source.y - 50 + 2*h;
              particles.add(new Particle(cir, shade, l_span));
              
          }
          //letter E == 6
          else if(letter == 6)
          {
              cir.x = source.x-25;
              cir.y = source.y + h;
              particles.add(new Particle(cir, shade, l_span));
              cir.y = source.y - h;
              particles.add(new Particle(cir, shade, l_span));
              cir.x = source.x - 25 + h;
              cir.y = source.y - 50;
              particles.add(new Particle(cir, shade, l_span));
              cir.x = source.x - 25 + h;
              cir.y = source.y;
              particles.add(new Particle(cir, shade, l_span));
              cir.x = source.x - 25 + h;
              cir.y = source.y + 50;
              particles.add(new Particle(cir, shade, l_span));
              
          }
          //letter W == 7
          else if(letter == 7)
          {
              cir.x = source.x - 25 + h/2;
              cir.y = source.y - 50 + 2*h;
              particles.add(new Particle(cir, shade, l_span));
              cir.x = source.x + 25 - h/2;
              cir.y = source.y - 50 + 2*h;
              particles.add(new Particle(cir, shade, l_span));
              cir.x = source.x + 25 + h/2;
              cir.y = source.y - 50 + 2*h;
              particles.add(new Particle(cir, shade, l_span));
              cir.x = source.x + 75 - h/2;
              cir.y = source.y - 50 + 2*h;
              particles.add(new Particle(cir, shade, l_span));
              
          }
          
          //letter R == 8
          else if(letter == 8)
          {
            //letter P
              cir.x = source.x-20;
              cir.y = source.y + h;
              particles.add(new Particle(cir, shade, l_span));
              cir.y = source.y - h;
              particles.add(new Particle(cir, shade, l_span));
              cir.x = source.x + 20*cos(t);
              cir.y = source.y - 20 + 25*sin(t);
              particles.add(new Particle(cir, shade, l_span));
              t += PI/10;
            //make  R from P
              cir.x = source.x-20 + h;
              cir.y = source.y + h;
              particles.add(new Particle(cir, shade, l_span));
              
          }
          h+=2;
      }
       explode = height;
   }
   //bullet was fired from below, and when it reachs a certain height
   //it will explode
   void bullet()
   {
       pushMatrix();
          translate(source.x, explode);
          fill(shade);
          ellipse(0,0,2,8);
       popMatrix();
   }
   // what to do each frame
   void run() 
   {
     
      // go through backwards for deletes
      for (int i=particles.size()-1; i >=0; i--) 
      {
         Particle p = (Particle)particles.get(i);
         
         //delay the time it shot up
         if(delay-- > 0)
             return;
         // update each particle per frame
         if(explode > source.y)
         {
             bullet();
             explode-=.2;
         }
         else
             p.run(choice);  //passing choice for each particles to run approtiately 
         if (!p.alive()) // what is that '!' thingy??
            particles.remove(i);
            
         //t += PI/20;
      }
   }
    
   // Is particle system still populated?
   // Maybe use this method to determine when
   // a system is dead and then start a new one. HINT HINT
   boolean dead() 
   {
      return particles.isEmpty();
   }
}

// declare a particle system
PSys[] fireW1;
int num_fire_work;
PSys[] fireW2;
int countF=0, i=0;
void setup() 
{
   size(500, 500);
   
   // range for the alpha is 0-100
   colorMode(RGB, 255, 255, 255, 100);
   
   num_fire_work = 5;
   // start a new particle system
   fireW2 = new PSys[15];
   fireW1 = new PSys[num_fire_work];
   for(int i=0; i<num_fire_work; i++)
      fireW1[i] = new PSys(100, new PVector(random(20,width-20), random(40,height/2)),
                            random(60,120), random(30,50),random(0,4));
  
   
   frameRate(40);
   click = false;
}

void draw() 
{
   background(0);

   // run the particle system
    // TODO_4 add code to start a new particle system once the old one dies
   if(!click)
   {
       for(int i=0; i<num_fire_work; i++)
       {
         if(fireW1[i].dead())
           fireW1[i] = new PSys(100, new PVector(random(20,width-20), random(40,height/2)), 
                                random(60,120), random(30,60),random(0,4));
         fireW1[i].run(); 
       }
   } 
   
   //draw happy new year
   if(click)
   {
     countF++;
     for(i=0; i<12; i++)
         fireW2[i].run();  
    
     if(countF > 80)
     {
       //after all the letters show up - change choice to 6
         for(i=0; i<12; i++)
           fireW2[i].choice = 6;
     }
     //the last letter is dead - set click to false and go back to orignal firework
     if(fireW2[11].dead())
          click = false;
     
   }
   
}

// TODO_3 add a mouse click function
void mousePressed()
{
    countF = 0;
    click = true;
    float life = 80;
    //Create each letter separately
    fireW2[0] = new PSys(25, new PVector(80,100), life, //H
                      0, 1);
    fireW2[1] = new PSys(45, new PVector(150,90), life, //A
                      5, 2); 
    fireW2[2] = new PSys(25, new PVector(230,100), life, //P
                      10, 3); 
    fireW2[3] = new PSys(25, new PVector(300,100), life, //P
                      15, 3);
    fireW2[4] = new PSys(30, new PVector(370,100), life, //Y
                      20, 4);
    fireW2[5] = new PSys(25, new PVector(120,250), life, //N
                      25, 5);
    fireW2[6] = new PSys(25, new PVector(200,250), life, //E
                      30, 6);
    fireW2[7] = new PSys(25, new PVector(270,250), life, //W
                      35, 7);
    fireW2[8] = new PSys(30, new PVector(160,400), life, //Y
                      40, 4);
    fireW2[9] = new PSys(25, new PVector(240,400), life, //E
                      45, 6);
    fireW2[10] = new PSys(50, new PVector(320,390), life, //A
                      50, 2);
    fireW2[11] = new PSys(25, new PVector(400,400), life, //R
                      55, 8);
         
     //reset fireW1
     //change the num of firework to 15 - more firework after happy new year
     num_fire_work = 10;
     fireW1 = new PSys[num_fire_work];
     for(int i=0; i<num_fire_work; i++)
          fireW1[i] = new PSys(100, new PVector(random(20,width-20), random(40,height/2)), 
                                random(60,120), random(30,60),random(0,4));
         
       
}