/*
  Nghia Nguyen
  CPE 123 - Lab 3
*/
//Secret with the two faces - click
//Secret at top right - click
//play music bottom right - click

import ddf.minim.*;

AudioPlayer player;
Minim minim;//audio context

float x,y;
float center_x,center_y;
float x1,x2,x3,y1,y2,y3;
float diam, rad;
boolean Star_on, back_on, boom_top, play_music, pause_music, playing;
int count_stars;
color c1,c2, temp;
void setup()
{
    minim = new Minim(this);
    player = minim.loadFile("DayForNight.mp3", 2048);
    size(700,500);
    diam = 5;
    rad = diam/2;
    //noLoop();
    Star_on = false;
    back_on = true;
    count_stars = 0;
    c1 = color(0);    //black
    c2 = color(210);  //grey
    boom_top = false;
    play_music = false;
    pause_music = false;
    playing = false;
}

void draw()
{
     //draw
     change_background();
    
     //play music
     musicPlayer();
     
     //draw Stars
     drawStar();
     
}

void change_background()
{
  //interchange the color - switch
  if(boom_top)
    {
        temp = c1;
        c1 = c2;
        c2 = temp;
        boom_top = false;
        back_on = true;
        count_stars = 0;
    }
    if(back_on)
    {
      fill(c1);
      rect(0,0,350,500);
      fill(c2);
      rect(350,0,350,500);
      //left person
      LeftPerson();
      //right person
      RightPerson();
    }
}
void LeftPerson()
{
    //head
    noStroke();
    ellipse(175,150,110,110);
   
    //body
    fill(c2);
    rect(138,195,75,210);
   
    //eyes
    fill(c1);
    ellipse(150,150,25,7);
    ellipse(200,150,25,7);
    //between legs
    ellipse(175,420,35,210);
    //feet
    fill(c2);
    ellipse(132,399.2,40,12);
    ellipse(220,399.2,40,12);
    //arms
    arc(210,315,106,240,-PI/2, 0);
    arc(141,315,105,240,PI, 3*PI/2);
    fill(c1);
    arc(213,318,54,200,-PI/2,0);
    arc(138,315,52,200,PI, 3*PI/2);
    
    //left fingers
    ellipse(108,312,1.5,28);
    ellipse(103,312,1.5,28);
    ellipse(98,312,1.5,26);
    ellipse(93,312,1.5,24);
    rect(108,308,4,8);
    
    fill(c2);
    
    for(int i=0; i<20; i+=5)
        arc(90.5+i,315,2.7,3,0,PI);
    //thumb
    arc(110.5,308,2.7,3,0,PI);
    
    //right fngers
    fill(c1);
    ellipse(244,312,1.5,28);
    ellipse(249,312,1.5,28);
    ellipse(254,312,1.5,26);
    ellipse(259,312,1.5,24);
    rect(240,308,4,8);
    fill(c2);
    for(int j=0; j<20; j+=5)
        arc(246.5+j,315,2.7,3,0,PI);
    //thumb
    arc(241.5,308,2.7,3,0,PI);
}

void RightPerson()
{
 pushMatrix();
    translate(350,0);
     //head
     fill(c1);
      noStroke();
      ellipse(175,150,110,110);
     
      //body
      rect(138,195,75,210);
     
      //eyes
      fill(c2);
      ellipse(150,150,25,7);
      ellipse(200,150,25,7);
      //between legs
      ellipse(175,420,35,210);
      //feet
      fill(c1);
      ellipse(132,399.2,40,12);
      ellipse(220,399.2,40,12);
      //arms
      arc(210,315,106,240,-PI/2, 0);
      arc(141,315,105,240,PI, 3*PI/2);
      fill(c2);
      arc(213,318,54,200,-PI/2,0);
      arc(138,315,52,200,PI, 3*PI/2);
      //left
      ellipse(108,312,1.5,28);
      ellipse(103,312,1.5,28);
      ellipse(98,312,1.5,26);
      ellipse(93,312,1.5,24);
      rect(108,308,4,8);
      
      fill(c1);
      for(int i=0; i<20; i+=5)
        arc(90.5+i,315,2.7,3,0,PI);
      //thumb
      arc(110.5,308,2.7,3,0,PI);
      
      //right
      fill(c2);
      ellipse(244,312,1.5,28);
      ellipse(249,312,1.5,28);
      ellipse(254,312,1.5,26);
      ellipse(259,312,1.5,24);
      rect(240,308,4,8);
      fill(c1);
      arc(241.5,308,2.7,3,0,PI);
      for(int j=0; j<20; j+=5)
        arc(246.5+j,315,2.7,3,0,PI);
      //thumb
      arc(241.5,308,2.7,3,0,PI);
   popMatrix();
}

void drawStar()
{
    //draw star until reach 1500 times
    if(Star_on)
    {
        back_on = false;
        {
          if(count_stars > 1500)
              Star_on = false;
          pushMatrix();
            scale(random(.1,2));
            center_x = random(width);
            center_y = random(height);
            subStar();
          popMatrix();
          count_stars++;
        }
    }
}

void subStar()
{
  noStroke();
  fill(210);
  ellipse(center_x,center_y,diam,diam);
  float t=0;

  for(int i=0; i<5;i++)
  {
      x1=center_x + rad * cos(t*PI);
      y1=center_y + rad * sin(t*PI);
      x2=center_x + diam * cos(t*PI+PI/5);
      y2=center_y + diam * sin(t*PI+PI/5);
      x3=center_x + rad * cos(t*PI+2*PI/5);
      y3=center_y + rad * sin(t*PI+2*PI/5);
      triangle(x1,y1,x2,y2,x3,y3);
      t=t+PI/8;
  }
}

void musicPlayer()
{
     //controller
     fill(#935555);
     rect(650,0,50,30);
     rect(650,470,50,30);
     fill(#8DE3ED);
     triangle(655,475, 675,485, 655, 495);
     rect(682,475,4,20);
     rect(690,475,4,20);
     
    //music on
    if(play_music)
    {
        player.play();
        playing = true;
        play_music = false;
    }
    if(pause_music)
    {
        player.pause();
        pause_music = false;
    }
    if(player.position() == player.length())
        player.rewind();
}

void mousePressed()
{  
    float mouse1 = pow((mouseX - 175),2) + pow((mouseY - 150),2) - pow(55,2);
    float mouse2 = pow((mouseX - 350 - 175),2) + pow((mouseY - 150),2) 
                   - pow(55,2);
    //if user click inside the 2 faces -> stars will appear
    if(mouse1 <= 0 || mouse2 <= 0)
        Star_on = true;

    if(mouseX >= 650 && mouseY <= 30)
       boom_top = true;
       
    if(mouseX >= 650 && mouseX < 675 && mouseY >= 470)
       play_music = true;
    if(playing)
    {
       if(mouseX >= 675 && mouseY >= 470)
           pause_music = true;
    }
}