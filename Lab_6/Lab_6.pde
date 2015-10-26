/*
  Nghia Nguyen
  CPE 123 - Lab 6
*/
boolean  star;
float end;
PFont font;
void setup()
{
    size(800,500);
    star = false;
    end = 0;
    font = loadFont("KunstlerScript-48.vlw");
   // noLoop();
}

void draw()
{
  end++;
    if(end > 4)
        noLoop();
    //background(0);
    for(int x=-10; x<=width; x+=2)
    {
        for(int y=0; y<=height; y+=2)
        {
            if(impl_circ(100,75, x,y, 45) < 0)
                stroke(255,200);

        
          // else if(impl_eli(300, 500, 100,150, x,y) < 0)
             // stroke(#76384C,180);
           //people
           else if(impl_eli(301,344,5,10,x,y)<0)
               stroke(#414314,200);
           else if(impl_eli(301,330,6,6,x,y)<0)
               stroke(#414314,200);
               
           else if(impl_eli(315,344,5,10,x,y)<0)
               stroke(#414314,200);
           else if(impl_eli(315,330,6,6,x,y)<0)
               stroke(#414314,200);
           //camp
           
           //kite
           else if(impl_line(338,233, 360,222, x,y)>0 
                   && impl_line(354,207, 360,222,x,y)<0 
                   && impl_line(354,207, 343,210,x,y)>0
                   && impl_line(343,210, 338,233,x,y)>0)
               stroke(#FCF112, 180);
            else if(impl_line(273,185,261,156,x,y)>0 
                   && impl_line(261,156, 245,152,x,y)>0
                   && impl_line(245,152, 245,173,x,y)>0
                   && impl_line(245, 173,273,185,x,y)>0)
               stroke(#FC443D, 180);
            else if(impl_line(177,240,192,214, x,y)>0 
                   && impl_line(192,214, 185,200,x,y)>0 
                   && impl_line(185,200, 172,215,x,y)>0
                   && impl_line(172,215, 177,240,x,y)>0)
               stroke(#FF0000, 180);
           else if(impl_line(431,217,442,188, x,y)>0 
                   && impl_line(442,188, 431,175,x,y)>0 
                   && impl_line(431,175, 420,191,x,y)>0
                   && impl_line(420,191, 431,217,x,y)>0)
               stroke(#42EA15, 180);
               
         /* else if(impl_line(668,230,692,211, x,y)>0 
                   && impl_line(692,211, 689,197,x,y)>0 
                   && impl_line(689,197, 678,201,x,y)>0
                   && impl_line(678,201, 668,230,x,y)>0)
               stroke(#FF0808, 180);  
          */
           else if(impl_line(544,166,511,152, x,y)>0 
                   && impl_line(511,152,498,164,x,y)>0 
                   && impl_line(498,164,510,178,x,y)>0
                   && impl_line(510,178,544,166,x,y)>0)
               stroke(#DE4EBA, 180);  
               
             //tree
            else if(impl_eli(675,265, 25,70,x,y) < 0)
                stroke(#28711A,180);
            else if(impl_line(670,378, 680,380, x,y)>0 
                   && impl_line(680,380, 680,304,x,y)>0 
                   && impl_line(680,304, 669,302,x,y)>0
                   && impl_line(669,302, 670, 378,x,y)>0)
               stroke(#393613,180);
             
           else if(impl_eli(715,285, 20,60,x,y) < 0)
                stroke(#28711A,180);
            else if(impl_line(710,388, 720,390, x,y)>0 
                   && impl_line(720,380, 720,304,x,y)>0 
                   && impl_line(720,304, 710,302,x,y)>0
                   && impl_line(710,302, 710, 378,x,y)>0)
               stroke(#393613,180);  
               
            else if(impl_eli(630,265, 25,65,x,y) < 0)
                stroke(#28711A,180);
            else if(impl_line(625,372, 635,372, x,y)>0 
                   && impl_line(635,372, 635,304,x,y)>0 
                   && impl_line(635,304, 625,302,x,y)>0
                   && impl_line(625,302, 625, 375,x,y)>0)
               stroke(#393613,180);    
            
             else if(impl_eli(587,278, 20,45,x,y) < 0)
                stroke(#28711A,180);
            else if(impl_line(582,365, 592,365, x,y)>0 
                   && impl_line(592,365, 592,304,x,y)>0 
                   && impl_line(592,304, 582,302,x,y)>0
                   && impl_line(582,302, 582, 375,x,y)>0)
               stroke(#393613,180);       
            
              //stars
           
           else if(impl_circ(random(0,200), random(0,300),x,y,4) < 0)
           {    
               stroke(255,200);
               star = true;
           }
            else if(impl_circ(random(200,400), random(0,300),x,y,4) < 0)
           {    
               stroke(255,200);
               star = true;
           }
           else if(impl_circ(random(400,600), random(0,300),x,y,4) < 0)
           {    
               stroke(255,200);
               star = true;
           }
           else if(impl_circ(random(600,800), random(0,200),x,y,4) < 0)
           {    
               stroke(255,200);
               star = true;
           }
               
           else if(impl_line(338,233,282,315,x,y) == 0)
               stroke(#67582F);
           else if(impl_eli(400,600, 600,250,x,y) > 0)
                //fill(120,120,0, 128);
                stroke(#285283, 128);
            else
                //fill(0,120,120,128);
               stroke(0,120,120,128);
            if(star)
             {
               ellipse(x,y,1,1);
               star = false;
             }
            else
            line(x,y, x+random(2,5), y+random(2,5));
           // ellipse(x,y,5,5);
        }
    }
    if (end>4)
    {
        textFont(font, 25);
        text("Nghia Nguyen", width-120, height -10);
    }
    save("lab6.jpeg");
}

float impl_circ(float center_x, float center_y, float x, float y, float rad_cir)
{
    return ( pow(x-center_x,2) + pow(y-center_y,2) - pow(rad_cir,2));
}

float impl_line(float start_x, float start_y, float end_x, float end_y, float x,
                float y)
{
    return ((end_y - start_y)*x - (end_x - start_x)*y - start_x*end_y + start_y*end_x);
}

float impl_eli(float center_x, float center_y, float w, float h, float x, float  y)
{
    return (pow(x-center_x,2)/(w*w) + pow(y-center_y,2)/(h*h) - 1);
}