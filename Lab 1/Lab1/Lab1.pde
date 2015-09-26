size(400,400);
background(#9AFA1E);
fill(#2EA736);
stroke(#28522B);
quad(80,0,100,0,140,400,120,400); // tree
//head
//fill(120);
fill(#30312C);
noStroke();
arc(148,70,80,120,PI/15, PI+PI/15);
//fill(120);
fill(#30312C);
arc(148,70,82,80,PI+PI/15,2*PI+PI/3);//head
//face
//pushMatrix();  //save the origin  
               //rotate the eyes.

//fill(#BCB52F);
fill(150);
ellipse(160,75,20,10);//right eye
ellipse(135,75,20,10);//left eye
//popMatrix();
fill(180);
ellipse(150,103,20,35);//nose mouth area
//translate(147,102);
rotate(PI/5);
fill(0);
ellipse(180,-14,5,10);//right eye
rotate(-2*PI/5);
ellipse(62,162,5,10);//left eye
rotate(PI/5);//get back to original
arc(150,110,20,10,0,PI);//mouth
fill(#30312C);

quad(110,120, 220,120 ,230,300 ,130,270);//body
rotate(-PI/2);
arc(-100,182,120,80,-PI/6,PI+PI/3);//back of the neck
rotate(PI/2);
ellipse(175,45,20,20);//make it round at the top of the head
stroke(150);
quad(90,60 ,60,80 ,70,120 ,95,120);//top arm
quad(110,15 ,50,45, 60,80, 115,45);//top hand
stroke(255);
line(110,20,90,30);//fingers
line(112,28,90,38);
line(114,34,90,46);//fingers
stroke(100);
ellipse(80,23,10,20);//top thumb
stroke(255);
quad(200,150,120,170,125,195,200,180);//arm below
quad(120,170,85,125,80,160,125,195);//hand below
stroke(100);
ellipse(90,130,10,20); //thumb below
stroke(255);
quad(225,250,140,230,140,270,232,300);//bottom leg
quad(140,230,115,270,120,310,140,270);//bottom leg
ellipse(115,290,20,40);//bottom feet
ellipse(100,220,20,40);//stand alone feet
fill(#F7F007);
arc(145,110,60,25,0,PI);
fill(#F7F007);
noStroke();
ellipse(138,75,5,10);
ellipse(160,75,5,10);
save("Lab1.jpg");