size(400,400);
background(#9AFA1E);
fill(#2EA736);
stroke(#28522B);
quad(80,0,100,0,140,400,120,400); // tree
//head
fill(120);
noStroke();
arc(148,70,80,120,PI/15, PI+PI/15);
fill(120);
arc(148,70,82,80,PI+PI/15,2*PI+PI/3);//head
//face
pushMatrix();  //save the origin  
               //rotate the eyes.

fill(#BCB52F);
ellipse(160,75,20,10);
ellipse(135,75,20,10);
