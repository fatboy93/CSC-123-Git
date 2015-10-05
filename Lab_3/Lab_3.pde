float x,y;

void setup()
{
    size(700,500);
    
}

void draw()
{
    //2 rects
    fill(0);
    rect(0,0,350,500);
    fill(210);
    rect(350,0,350,500);
    
    //left
    //head
    noStroke();
    ellipse(175,150,110,110);
   
    //body
    fill(210);
    rect(138,195,75,210);
   
    //eyes
    fill(0);
    ellipse(150,150,25,7);
    ellipse(200,150,25,7);
    //between legs
    ellipse(175,420,35,210);
    //feet
    fill(210);
    ellipse(132,399.2,40,12);
    ellipse(220,399.2,40,12);
    //arms
    arc(210,315,106,240,-PI/2, 0);
    arc(141,315,105,240,PI, 3*PI/2);
    fill(0);
    arc(213,318,54,200,-PI/2,0);
    arc(138,315,52,200,PI, 3*PI/2);
    //left
    ellipse(108,312,1.5,28);
    ellipse(103,312,1.5,28);
    ellipse(98,312,1.5,26);
    ellipse(93,312,1.5,24);
    rect(108,308,4,8);
    
    fill(210);
    arc(90,315,2.7,3,0,PI);
    arc(95.5,315,2.7,3,0,PI);
    arc(100.5,315,2.7,3,0,PI);
    arc(105.5,315,2.7,3,0,PI);
    arc(110.5,308,2.7,3,0,PI);
    //right
   fill(0);
    ellipse(244,312,1.5,28);
    ellipse(249,312,1.5,28);
    ellipse(254,312,1.5,26);
    ellipse(259,312,1.5,24);
    rect(240,308,4,8);
    fill(210);
    arc(241.5,308,2.7,3,0,PI);
    arc(246.5,315,2.7,3,0,PI);
    arc(251.5,315,2.7,3,0,PI);
    arc(256.5,315,2.7,3,0,PI);
    arc(261.5,315,2.7,3,0,PI);
  
  
}