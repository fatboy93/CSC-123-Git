float x,y,scale_f;
boolean moving;
void setup()
{
    size(400,400);
    background(50);
    x=200;
    y=200;
    scale_f = 4;
    moving = false;
}

void draw()
{
    background(50);
    fill(255,255,0);
    rect(250,50,80,40);
    rect(70,50,80,40);
    pushMatrix();
        translate(x,y);
        scale(scale_f);
        
        fill(255,0,0);
        ellipse(0,0,50,50);
        fill(255);
        ellipse(10,10,10,10);
    popMatrix();
    fill(0,0,255);
    ellipse(200,350,300,20);
    if(moving)
        x++;
    
}

void mousePressed()
{
  moving = true;
  
}