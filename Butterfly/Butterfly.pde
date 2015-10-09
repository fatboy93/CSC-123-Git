float x1,y1, x2,y2,t1,t2, rad;
float temp_t1, temp_t2;
float e = 2.7182818284590452353602874713527;
void setup()
{
    size(600,600);
    background(0);
    
    //noLoop();
    rad = 10;
    frameRate(10);
}

void draw()
{
    t1 = 0;
    pushMatrix();
        translate(random(rad,width-rad), random(rad, height-rad));
        //scale(1);
        stroke(random(255),random(255), random(255));
        //strokeWeight(1);
        for(int i=0; i<50; i++)
        {
            x1 = rad*(sin(t1))*(pow(e,cos(t1)) - 2*cos(4*t1) - pow(sin(t1/12),5));
            y1 = -rad*(cos(t1))*(pow(e,cos(t1)) - 2*cos(4*t1) - pow(sin(t1/12),5));
            t2 = t1 + PI/20;
            x2 = rad*(sin(t2))*(pow(e,cos(t2)) - 2*cos(4*t2) - pow(sin(t2/12),5));
            y2 = -rad*(cos(t2))*(pow(e,cos(t2)) - 2*cos(4*t2) - pow(sin(t2/12),5));
            line(x1,y1,x2,y2);
            temp_t1 = t1;
            while(t1 < t2)
            {
              x1 = rad*(sin(t1))*(pow(e,cos(t1)) - 2*cos(4*t1) - pow(sin(t1/12),5));
              y1 = -rad*(cos(t1))*(pow(e,cos(t1)) - 2*cos(4*t1) - pow(sin(t1/12),5));
              line(0,0, x1,y1);
              t1+=.2;
            }
            t1 = temp_t1;
            t1 += PI/20;
        }
    popMatrix();
}