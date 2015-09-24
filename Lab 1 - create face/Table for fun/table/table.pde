size(450,450);
background(100,100,100);
fill(0,255,0);
rect(100,130,18,220,7);
fill(0,255,0);
rect(280,130,18,220,7);
fill(0,255,0);
rect(310,130,18,160,7);
fill(0,255,0);
rect(130,130,18,160,7);
fill(255,0,0);
ellipse(200,120,300,150);
fill(0,255,255);
triangle(110,85,135,120,160,85);
fill(255,0,255);
triangle(225,85,250,120,275,85);
//fill(255,255,0);
//arc(200,150,50,150,0,PI);
float a = 0.0;
float inc = TWO_PI/25.0;

for (int i = 170; i < 222; i=i+4) {
  stroke(0,250,0);
  line(i, 150, i, 150+sin(a)*120.0);
  a = a + inc;
}
noStroke();
//fill(120,250,180);
arc(200,320,80,80,0,PI+QUARTER_PI, PIE);