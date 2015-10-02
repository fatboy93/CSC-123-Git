float r,g,b;
float x=0,y=0,cx,cy, scale_factor = 1;
color rain_c;
float bx,by, kx,ky;
boolean moving_man, moving_red, moving_blue;

void setup()
{
  size(900,600);
  background(#F5F4ED);
  frameRate(40);
  rain_c = color(random(255),random(255), random(225));
  
  moving_man = false;
  moving_red = false;
  moving_blue = false;
  bx = -210;
  by = 250;
  kx = 700;
  ky = 250;
  //noLoop();
  //x = random(30, width-30);  //set the value of x,y
 // y = random(height-60);
}



void draw()
{
  background(#F5F4ED);
  
  pushMatrix();
      translate(bx,by);
      fill(107,172,203); //text//
      textSize(27);
      text("UN",22,42);
      fill(107,172,203);
      textSize(37.9);
      text("BOXEUR",40,79);
     
    
      //two man boxing
      
      noStroke();
      
       fill(71,119,166); //blues//
      beginShape();
      curveVertex(189,184);
      curveVertex(189,184);
      curveVertex(192,179);
      curveVertex(196,175);
      curveVertex(201,169);
      curveVertex(204,163);
      curveVertex(205,154);
      curveVertex(202,149);
      curveVertex(194,144);
      curveVertex(188,144);
      curveVertex(185,147);
      curveVertex(184,150);
      curveVertex(185,153);
      curveVertex(183,154);
      curveVertex(182,157);
      curveVertex(178,167);
      curveVertex(179,172);
      curveVertex(179,177);
      curveVertex(179,177);
      endShape();
      beginShape();
      curveVertex(157,149);
      curveVertex(157,149);
      curveVertex(159,146);
      curveVertex(164,142);
      curveVertex(169,143);
      curveVertex(175,150);
      curveVertex(175,159);
      curveVertex(168,167);
      curveVertex(162,171);
      curveVertex(162,171);
      endShape();
      
      stroke(255,255,255);
      line(187,161,189,156);
      line(169,157,159,158);
      
      noStroke();
      
      fill(245,113,119);
      quad(69,283,72,303,99,285,103,275); //right leg//
      quad(82,272,69,283,99,285,103,275);
      quad(69,283,59,303,69,305,99,285);
      quad(129,260,143,271,162,261,149,245); //left leg//
      quad(162,266,151,299,139,297,143,263);
      quad(162,266,162,261,147,261,147,272);
      bezier(83,214,78,120,142,115,154,105);
      bezier(122,219,122,219,127,213,122,207);
      bezier(121,208,121,208,130,202,128,192);
      bezier(125,195,125,195,138,194,139,185);
      bezier(141,186,142,215,167,225,167,225);
      bezier(166,225,183,217,188,180,188,180);
      bezier(160,173,169,181,168,197,168,197);
      quad(167,225,164,197,179,176,188,180);
      quad(134,179,133,186,147,189,149,182);
      quad(123,213,122,207,122,219,82,211);
      quad(122,207,122,219,82,215,122,129);
      quad(125,201,128,192,119,197,121,208);
      quad(119,197,140,186,160,153,136,119);
      quad(108,177,120,133,146,130,139,181);
      quad(141,186,151,210,167,225,169,193);
      beginShape();
      vertex(149,139);
      bezierVertex(160,145,166,169,159,179);
      endShape();
      beginShape();
      vertex(129,172);
      vertex(151,197);
      vertex(171,199);
      vertex(163,177);
      vertex(162,166);
      vertex(158,150);
      vertex(142,144);
      endShape();
      beginShape();
      vertex(151,144);
      bezierVertex(136,125,139,120,154,136);
      endShape();
      beginShape();
      curveVertex(131,125);
      curveVertex(131,125);
      curveVertex(153,138);
      curveVertex(159,142);
      curveVertex(163,142);
      curveVertex(165,139);
      curveVertex(167,136);
      curveVertex(169,135);
      curveVertex(171,137);
      curveVertex(173,136);
      curveVertex(173,134);
      curveVertex(172,131);
      curveVertex(172,128);
      curveVertex(174,128);
      curveVertex(176,127);
      curveVertex(178,125);
      curveVertex(179,121);
      curveVertex(179,117);
      curveVertex(179,114);
      curveVertex(152,108);
      curveVertex(150,109);
      curveVertex(148,110);
      curveVertex(139,117);
      curveVertex(139,117);
      endShape();
      
      
      
      fill(59,32,4); //browns//
      rect(56,306,32,10,8);
      quad(56,307,71,311,71,304,59,301);
      quad(79,274,110,278,111,222,81,211);
      quad(81,211,122,218,124,268,99,247);
      quad(122,220,150,245,125,268,95,218);
      ellipse(82,254,8,8);
      quad(81,211,75,244,82,253,86,228);
      rect(139,295,13,5);
      rect(138,299,30,12,8);
      beginShape();
      curveVertex(149,109);
      curveVertex(149,109);
      curveVertex(152,118);
      curveVertex(155,118);
      curveVertex(159,116);
      curveVertex(161,116);
      curveVertex(162,117);
      curveVertex(164,117);
      curveVertex(164,114);
      curveVertex(167,113);
      curveVertex(171,113);
      curveVertex(176,117);
      curveVertex(178,118);
      curveVertex(179,117);
      curveVertex(179,115);
      curveVertex(179,111);
      curveVertex(178,108);
      curveVertex(170,101);
      curveVertex(164,100);
      curveVertex(158,100);
      curveVertex(153,104);
      curveVertex(153,104);
      endShape();
   popMatrix();
      
      
      //2nd boxer//
   pushMatrix();   
     translate(kx,ky);
     fill(107,172,203); //text//
     textSize(27);
     text("UN",273,42);
     textSize(37.9);
     text("CHAMPION",275,79);
     
     fill(59,32,4);
     beginShape(); //right leg//
     curveVertex(358,299);
     curveVertex(358,299);
     curveVertex(369,299);
     curveVertex(371,294);
     curveVertex(372,289);
     curveVertex(374,284);
     curveVertex(373,276);
     curveVertex(370,273);
     curveVertex(371,271);
     curveVertex(373,269);
     curveVertex(379,265);
     curveVertex(387,262);
     curveVertex(367,238);
     curveVertex(354,250);
     curveVertex(348,259);
     curveVertex(348,264);
     curveVertex(348,267);
     curveVertex(358,297);
     curveVertex(358,297);
     endShape();
     
     beginShape(); //left leg//
     curveVertex(413,273);
     curveVertex(413,273);
     curveVertex(414,282);
     curveVertex(419,288);
     curveVertex(428,292);
     curveVertex(454,294);
     curveVertex(460,286);
     curveVertex(455,283);
     curveVertex(450,279);
     curveVertex(446,275);
     curveVertex(440,274);
     curveVertex(437,272);
     curveVertex(437,272);
     endShape();
     
     beginShape();
     curveVertex(430,220);
     curveVertex(430,220);
     curveVertex(429,214);
     curveVertex(436,200);
     curveVertex(441,197);
     curveVertex(463,197);
     curveVertex(480,188);
     curveVertex(477,167);
     curveVertex(474,161);
     curveVertex(466,151);
     curveVertex(461,140);
     curveVertex(453,134);
     curveVertex(443,132);
     curveVertex(439,132);
     curveVertex(437,130);
     curveVertex(433,128);
     curveVertex(427,127);
     curveVertex(423,125);
     curveVertex(420,123);
     curveVertex(416,123);
     curveVertex(413,119);
     curveVertex(410,114);
     curveVertex(405,109);
     curveVertex(398,107);
     curveVertex(393,107);
     curveVertex(388,109);
     curveVertex(383,113);
     curveVertex(382,117);
     curveVertex(380,122);
     curveVertex(379,124);
     curveVertex(380,126);
     curveVertex(381,128);
     curveVertex(382,131);
     curveVertex(381,134);
     curveVertex(356,135);
     curveVertex(348,136);
     curveVertex(345,138);
     curveVertex(336,136);
     curveVertex(326,136);
     curveVertex(313,137);
     curveVertex(300,137);
     curveVertex(304,151);
     curveVertex(306,153);
     curveVertex(313,155);
     curveVertex(324,158);
     curveVertex(344,157);
     curveVertex(347,158);
     curveVertex(374,159);
     curveVertex(377,162);
     curveVertex(379,172);
     curveVertex(380,175);
     curveVertex(382,177);
     curveVertex(383,186);
     curveVertex(385,193);
     curveVertex(386,196);
     curveVertex(387,200);
     curveVertex(388,205);
     curveVertex(390,223);
     curveVertex(390,223);
     endShape();
     
     fill(209,64,2);
     beginShape();
     curveVertex(306,138);
     curveVertex(306,138);
     curveVertex(283,136);
     curveVertex(276,139);
     curveVertex(274,144);
     curveVertex(273,153);
     curveVertex(279,159);
     curveVertex(287,160);
     curveVertex(289,158);
     curveVertex(290,159);
     curveVertex(297,159);
     curveVertex(304,153);
     curveVertex(306,153);
     curveVertex(306,153);
     endShape();
     
     beginShape();
     curveVertex(439,181);
     curveVertex(434,181);
     curveVertex(426,176);
     curveVertex(416,176);
     curveVertex(414,178);
     curveVertex(415,180);
     curveVertex(418,181);
     curveVertex(422,181);
     curveVertex(423,183);
     curveVertex(419,184);
     curveVertex(416,183);
     curveVertex(411,179);
     curveVertex(407,179);
     curveVertex(403,183);
     curveVertex(404,193);
     curveVertex(411,200);
     curveVertex(427,201);
     curveVertex(440,197);
     curveVertex(440,197);
     endShape();
     
     beginShape();
     curveVertex(358,298);
     curveVertex(358,298);
     curveVertex(358,302);
     curveVertex(351,304);
     curveVertex(344,304);
     curveVertex(341,307);
     curveVertex(342,313);
     curveVertex(370,312);
     curveVertex(370,298);
     curveVertex(370,298);
     endShape();
     
     beginShape();
     curveVertex(453,294);
     curveVertex(453,294);
     curveVertex(453,302);
     curveVertex(447,302);
     curveVertex(445,304);
     curveVertex(446,309);
     curveVertex(451,310);
     curveVertex(463,309);
     curveVertex(463,300);
     curveVertex(465,293);
     curveVertex(466,289);
     curveVertex(465,287);
     curveVertex(461,286);
     curveVertex(458,284);
     curveVertex(458,284);
     endShape();
     
     fill(71,119,166);
     beginShape();
     curveVertex(389,218);
     curveVertex(393,220);
     curveVertex(419,221);
     curveVertex(430,217);
     curveVertex(438,234);
     curveVertex(441,246);
     curveVertex(438,259);
     curveVertex(438,265);
     curveVertex(439,267);
     curveVertex(439,273);
     curveVertex(409,275);
     curveVertex(405,260);
     curveVertex(404,258);
     curveVertex(385,267);
     curveVertex(364,241);
     curveVertex(375,231);
     curveVertex(388,223);
     curveVertex(388,223);
     endShape();
     
     fill(255,251,235);
     triangle(455,175,448,172,442,181);
     
  popMatrix();
  
  //
  
  //x=100;
 // y=100;
 //Draw the umbrella - rotated
 
  pushMatrix();
      translate(x,y);  //important to make body move forward
      translate(800,90);  //origin at 100,100
      scale(.5);
      rotate(-PI/9);    //rotate when done with verical
      //x=50; y=150;
      
      
      //translate(x,y);
      fill(#582501); //fill brown
      //arc(x,y,150,150,PI,2*PI);
      arc(0,0,150,150,PI,2*PI);  //big arc
      triangle(-15,-60, 0 , -85, +15, -60); //top of umbrella
      noStroke();
      
      fill(#F5F4ED);  //fill color backgound
      //noStroke();
      //arc(x-55,y, 39, 15, PI, 2*PI);
      //arc(x-20,y, 40, 15, PI, 2*PI);
      //arc(x+20,y, 40, 15, PI, 2*PI);
      //arc(x+55,y, 39, 15, PI, 2*PI);
      //small arc at background color for waving 
      arc(-55,0, 39, 15, PI, 2*PI);
      arc(-20,0, 40, 15, PI, 2*PI);
      arc(+20,0, 40, 15, PI, 2*PI);
      arc(+55,0, 39, 15, PI, 2*PI);
      
      //draw the handle of the umbrella
      stroke(#BCD329);
      strokeWeight(2);
      //line(x+5, y-5, x+5, y+60);
      line(+5, -5, +5, +75);
      line(+5, +75, -2, +80);
      line(-2, +80, -7, +75);
      noStroke();
      
      //draw the hand of the man
      fill(#ED6E6E);
      rect(0, +54,+10,+19);
      ellipse(+7,+54, 5, 5);
      ellipse(0,+56, 6, 4);
      ellipse(0,+61, 6, 4);
      ellipse(0,+66, 6, 4);
      ellipse(0,+71, 6, 4);
     
      rect(0,30,10,19);
      ellipse(0,+30,5,6);
      ellipse(0,+32,6,4);
      ellipse(0,+37,6,4);
      ellipse(0,+42,6,4);
      ellipse(0,+47,6,4);
      
      //draw hat
      fill(#5FA5A3);  //top 
      rect(+25,+6,35,15);
      fill(0);
      ellipse(+43,+22,35,2);  //the line
      fill(#5FA5A3);
      ellipse(+40,+25,60,4);  //bottom of hat
      
      //draw face
      fill(#ED6E6E);      //match with hand
      rect(+25,+27,35,32);  //face
      ellipse(+23,+44,14,5);//nose
      fill(#F5F4ED);      //fill background color
      ellipse(+23,+52,10,4);//mouth
      fill(#582501);  //hair
      rect(+40,+27,20,12);
      rect(+50,+37,10,10);
      fill(#ED6E6E);  //match with face
      ellipse(+48,+40,6,8);  //ear
      
      //scarf
      fill(#D6D851);
      rect(+68,+65,45,20);
      arc(+20,+63,15,15,PI/2,2*PI-PI/6); 
      fill(#F5F4ED);
      ellipse(+112,+71,3,10);
      ellipse(+100,+65,15,3);
      
      //draw body
      fill(#5FA5A3); //match with hat
      rect(+18,+58,50,130);
      rect(0,+80,20,50);
      strokeWeight(9);
      stroke(#5FA5A3);
      line(+17,+75,+4,+85);
      noStroke();
      
   popMatrix();
   
   pushMatrix();
      translate(x,y);
      translate(800,90);
      scale(.5);
      //lower body
      quad(+140, +140, +80,+140, +50, +205, +115,+205);  
      quad(+115,+205,+50,+205, +50, +220, +105,+220);
      //clear back
      fill(#F5F4ED);
      rect(+125,+140,15,40);
      
      strokeWeight(8);
      stroke(#5FA5A3);
      line(+120,+140,+160,+180);
      line(+160,+180,+145,+200);
      noStroke();
      
      //front leg
      fill(#551C00);
      rect(+52,+220,33,40);//leg
      arc(+68,+260,33,6,0,PI);//curve near leg
      rect(+36,+268, 44,15);//shoe
      ellipse(+34,+278,8,9);//curve in front
      fill(#F5F4ED);
      ellipse(+67,+268, 20,4);//curve for shoe
      strokeWeight(5);
      stroke(#F5F4ED);
      line(+50,+268,+35,+270);//front of shoe
      noStroke();
      fill(#F5F4ED);
      ellipse(+60,+283,26,6);
      
      //back leg
      fill(#551C00);
      quad(+125,+160, +116,+205, +140,+230,+150,+207); 
      quad(+149,+207,+139,+230, +170,+240,+180,+215);
      //shoe  ->reuse the shoe above
      pushMatrix();
          //translate(x,y);
          rotate(-PI/2.9);    //adjust rotation and translate to fit the back leg
          translate(-185,-4);
          rect(36,268, 44,15);//shoe
          ellipse(34,278,8,9);//curve in front
          fill(#F5F4ED);
          ellipse(67,268, 20,4);//curve for shoe
          strokeWeight(5);
          stroke(#F5F4ED);
          line(50,268,35,270);//front of shoe
          noStroke();
          fill(#F5F4ED);
          ellipse(60,283,26,6);
      popMatrix();
   popMatrix();
   
   //make it moving
   if(moving_man)
   {
        x-=random(-1,4);
        y += random(-1,1);
        if(x <= -280)
            {
              moving_red = true;
              moving_blue = true;
            }
        if(x<=-700)
            x=0;
   }
   //blue
   if(moving_blue)
   {
     if(bx < 200)
         bx += 5;  
      else if(kx >=200 && kx < 300)
          bx+= random(-10,10);
      else bx = 200;
     by += random(-1,1);
   }
   
   //red
   if(moving_red)
   {
       if(kx >= 200)
           kx-=5;
       else if(kx < 200 && kx > 100)
           kx += random(-10,10);
       else kx = 200;
       ky += random(-1,1);
   }
   //Raindrops
   
       //raindrops
        strokeWeight(2);  //create thickness for the raindrop
       // stroke(#3EBFAE);  //fill the color for the raindrop
       stroke(#2E7CE5);
       // fill(#3EBFAE);
       for(int i=0; i<120; i++)
       {
         //rain_c = color(random(255),random(255), random(225));
         cx = random(0, width-30);
         cy = random(height-60);
         line(cx, cy, cx+30, cy+60);  //draw the line - raindrop
       }
       
       //cx+=30;
       //cy+=30;
      // y = height;
       for(int i=0; i<15; i++)
       {
         cx = random(width);
         line(cx,height-20, cx+10, height-60);
         cx = random(width);
         line(cx,height, cx+20, height-40);
       }
       noStroke();
       
       //background(#F5F4ED);
save("Lab2_output.jpg");
}

void mousePressed()
{
     moving_man = true;
}