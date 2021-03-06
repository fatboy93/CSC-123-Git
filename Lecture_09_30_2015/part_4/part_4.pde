float cx, cy;  //center x and center y of sketch
boolean rising;

///functioc to set up the program
void setup()
{
    size(400,400);
    
    rising = false;
    cx = 200;
    cy = 200;
}

void mousePressed()
{
    cx = 200;
    cy = 200;
    rising = true;
}

void draw()
{
    background(255);    //clear the background
    
    //if(draw_on)
    {
        pushMatrix();
            translate(cx,cy);
            fill(255,255,0);    //yellow
            ellipse(0,0,40,40);  //face
            fill(0,150,0);    //green
            ellipse(-10,-5,10,10);    //eyes
            ellipse(10,-5,10,10);
            fill(255);
            ellipse(0,10,20,5);    //mouth
        popMatrix();
        
        if(rising)
       {
         cy += random(-10,10);  //make the face move up
         cx += random(-10,10);
       }
       
         
        
    
    }

}