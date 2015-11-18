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
class Particle 
{
   PVector loc;
   PVector vel;
   PVector accel;
   float r;
   float life;
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
   }
   
     Particle(PVector start, color c, float l) 
   {
      accel = new PVector(0, 0.05); //gravity
      vel = new PVector(random(-2, 2), random(-4, 0), 0);
      pcolor = c;
      loc = start.get();  // make a COPY of the start location vector
      r = 8.0;
      life = l;
   }
   // what to do each frame
   void run(PVector ini) 
   {
      updateP(ini);
      renderP(); // render is a fancy word for draw.  :)
   }
    
   // a function to update the particle each frame
   void updateP(PVector ini) 
   {
      vel.add(accel);     
      loc.add(vel);
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
   PSys(int num, PVector init_loc, float l_span) 
   {
      particles = new ArrayList();
      source = init_loc.get();  // you have to do this to set a vector equal to another vector
      shade = color(random(255), random(255), random(255));  // TODO_2 use this!
      for (int i=0; i < num; i++) 
      {
         particles.add(new Particle(source, shade, l_span));
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
     //float t = PI/20;
    // float x,y;
      // go through backwards for deletes
      for (int i=particles.size()-1; i >=0; i--) 
      {
         Particle p = (Particle)particles.get(i);
         
        // x = source.x + 50*cos(t);
        // y = source.y + 50*sin(t);
         // update each particle per frame
         if(explode > source.y)
         {
             bullet();
             explode-=.2;
         }
         else
             p.run(source);
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
      fireW1[i] = new PSys(100, new PVector(random(20,width-20), random(height/2)), random(60,100));
  
   
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
                            random(80,120));
     fireW1[i].run(); 
   }
   
   if(click)
      fireW2.run();
}

// TODO_3 add a mouse click function
void mousePressed()
{
    click = true;
    fireW2 = new PSys(100, new PVector(mouseX, mouseY), random(80,120));
    
}

float impl_cir(float cx, float cy, float x, float y, float rad)
{
    return (pow(x-cx,2) + pow(y-cy,2) - rad*rad);
}