float x,y;
boolean press, click, back, forw, down, up;
void setup()
{
    size(600,600);
    x=50;y=50;
    press = false;
    click = false;
    back  = false;
    down = false;
    up  = false;
    forw = false;
}

void draw()
{
    background(200);
    //translate(x,y);
    fill(255,0,0);
    ellipse(x,y,100,100);
    if(press)
    {
        if(up)
            y+=random(0,30);
        if(down)
            y-=random(0,30);
        if(forw)
            x+=random(0,30);
        if(back)
            x-=random(0,30);
    }
        
    if(click)
    {
      press = false;
      click = false;
    }
    if(x >= 550)  
    {    
        back = true;
        forw = false;
    }
    if(x <= 50)
    {
        back = false;
        forw = true;
    }
    if(y >= 550)
    {
        down = true;
        up = false;
    }
    if(y <= 50)
    {
        up = true;
        down = false;
    }
}

void mousePressed()
{
    press = true;
}

void mouseClicked()
{
    click = true;
}