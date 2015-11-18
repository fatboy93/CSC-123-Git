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
   
     Particle(PVector start, color c, float l) 
   {
      accel = new PVector(0, 0.05); //gravity
      vel = new PVector(random(-1, 1), random(-2, 0), 0);
      pcolor = c;
      loc = start.get();  // make a COPY of the start location vector
      r = 8.0;
      life = l;
      origin_life = life;
   }
   // what to do each frame
   void run(boolean shape) 
   {
    
      updateP(shape);
      renderP(); // render is a fancy word for draw.  :)
   }
    
   // a function to update the particle each frame
   void updateP(boolean shape) 
   {
      if(shape && (life %2 == 0 || life <= .85*origin_life))
      { 
        vel.add(accel);     
        loc.add(vel);
      }
      if(!shape)
      {
          vel.add(accel);     
          loc.add(vel);
      }
      life -= 1.0;
   }
    
   // how to draw a particle
   void renderP() 
   {
      pushMatrix();
       stroke(pcolor);
       fill(pcolor, 70);
       translate(loc.x, loc.y);
       //make the ellispe rotate with gravity
       rotate(vel.heading2D());
       if(life < 25.0)
           pcolor = color(random(255), random(255), random(255));
       if(life > 25)
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
      PVector cir = new PVector();
      if(choice >= 2)
          rad = random(2,3);
      //else if(choice > 2)
      //    rad = 15;
      for (int i=0; i < num; i++) 
      {
        
         if(choice <= 1)
             particles.add(new Particle(source, shade, l_span));
         //smiley face firework
         else if(choice <= 2)
         {
             if(i<num/2)
             {
                 cir.x = source.x + rad*cos(t);
                 cir.y = source.y + rad*sin(t);
                // particles.add(new Particle(cir, shade, l_span));
                 t += PI/20;
             }   
             else if(i<num*.75)
             {
                 cir.x = source.x+rad/2;
                 cir.y = source.y;
                // particles.add(new Particle(cir, shade, l_span));
             }
             else
             {
                 cir.x = source.x-rad/2;
                 cir.y = source.y;
                 //particles.add(new Particle(cir, shade, l_span));
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
         else
         {
             cir.x = source.x + 20*(sin(t))*(pow(e,cos(t)) - 2*cos(4*t) - pow(sin(t/12),5));
             cir.y = source.y - 20*(cos(t))*(pow(e,cos(t)) - 2*cos(4*t) - pow(sin(t/12),5));
             t += PI/30;
             particles.add(new Particle(cir, shade, l_span));
         }
         
         
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
         
        
         // update each particle per frame
         if(explode > source.y)
         {
             bullet();
             explode-=.2;
         }
         else
             p.run(choice>1.0);
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
PSys fireW2;
void setup() 
{
   size(500, 500);
   
   // range for the alpha is 0-100
   colorMode(RGB, 255, 255, 255, 100);
   
   num_fire_work = 5;
   // start a new particle system
   fireW1 = new PSys[num_fire_work];
   for(int i=0; i<num_fire_work; i++)
      fireW1[i] = new PSys(100, new PVector(random(20,width-20), random(height/2)),
                            random(60,120), random(30,50),random(0,4));
  
   
   frameRate(40);
   click = false;
}

void draw() 
{
   background(0);

   // run the particle system
    // TODO_4 add code to start a new particle system once the old one dies
   for(int i=0; i<num_fire_work; i++)
   {
     if(fireW1[i].dead())
       fireW1[i] = new PSys(100, new PVector(random(20,width-20), random(height/2)), 
                            random(60,120), random(30,60),random(0,4));
     fireW1[i].run(); 
   }
   
   if(click)
      fireW2.run();
}

// TODO_3 add a mouse click function
void mousePressed()
{
    click = true;
    fireW2 = new PSys(100, new PVector(mouseX, mouseY), random(60,120),
                      random(30,60),random(0,4));
    
}

float impl_cir(float cx, float cy, float x, float y, float rad)
{
    return (pow(x-cx,2) + pow(y-cy,2) - rad*rad);
}