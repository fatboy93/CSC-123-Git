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
boolean Star_on, back_on, boom_top, play_music, pause_music, playing, text_on;
boolean draw_right;
int count_stars;
color c1,c2, temp;

void setup()
{
    minim = new Minim(this);
    player = minim.loadFile("DayForNight.mp3", 2048);
    size(700,500);
    diam = 4;
    rad = diam/2;
    frameRate(200);
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
    text_on = false;
    draw_right = true;
    center_x = 0;
    center_y = 0;
}

void draw()
{
     //draw
     change_background();
    
     //play music
     musicPlayer();
     
     //draw Stars
     drawStar();
    
    //write text
    if(count_stars > 500)
         write_text();
    
     save("lab5_output.jpg");
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
    if(back_on)    //redraw the whole background
    {
      fill(c1);
      rect(0,0,350,500);
      fill(c2);
      rect(350,0,350,500);
      //left person
      LeftPerson(c1,c2);
      //right person
      RightPerson();
    }
}
void LeftPerson(color c1, color c2)  //passing the color you want to fill
{
    //head
    fill(c2);
    noStroke();
    ellipse(175,150,110,110);
   
    //body
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
    //reuse the code from the left person.
    pushMatrix();
      translate(350,0);
      LeftPerson(c2,c1);  //fill the opposite color of the left person
    popMatrix();
}

void drawStar()
{
    //draw star until reach 1000 times
    if(Star_on)
    {
        back_on = false;  //avoid the screen to draw the two rect and 2 people again
        {
          if(count_stars > 1000)
              Star_on = false;  //if 1000 stars - stop drawing
          pushMatrix();  //save the origin
            translate(random(width), random(height));  //put the star anywhere
            scale(random(.1,2));  //control the size of star
            subStar();  //calling the substar function to draw
          popMatrix();  //restore the origin
          count_stars++;     //increase the count after drawing a star
        }
    }
}

void subStar()
{
  //draw a cirlce
  noStroke();
  fill(210);
  ellipse(center_x,center_y,diam,diam);
  float t=0;
  //Draw 5 triangles to make a star
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
     //controller bottom left
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
        play_music = false; //avoid it to play again and agian - 1 time only
    }
    //if pause_music is true - pause the muisc and set it to false
    if(pause_music)
    {
        player.pause();
        pause_music = false;
    }
    //if the muisc is finished - rewind to the beginning
    if(player.position() == player.length())
        player.rewind();
}

void write_text()
{  
    //write some text
    fill(210);
    textSize(15);
    text("Somewhere in this vast universe,", 25, 30); 
    text("there grows a boy.", 180,55);
    fill(0);
    text("And somewhere in this boy,", 385,30);
    text("there grows a vast universe.", 450, 55);
}
void mousePressed()
{  
    //click in side the two faces
    float mouse1 = pow((mouseX - 175),2) + pow((mouseY - 150),2) - pow(55,2);
    float mouse2 = pow((mouseX - 350 - 175),2) + pow((mouseY - 150),2) 
                   - pow(55,2);
                   
    //if user click inside the 2 faces -> stars will appear
    if(mouse1 <= 0 || mouse2 <= 0)
        Star_on = true;

    if(mouseX >= 650 && mouseY <= 30)
       boom_top = true;
       
    //click the trangle to play music
    if(mouseX >= 650 && mouseX < 675 && mouseY >= 470)
       play_music = true;
       
    //if music is playing - click the symbol to pause
    if(playing)
    {  //have to click inside the box
       if(mouseX >= 675 && mouseY >= 470)
           pause_music = true;
    }
}