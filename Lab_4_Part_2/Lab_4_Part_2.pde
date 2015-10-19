void setup()
{
  size(650,650);
  background(#5CB78A);
  
}

void draw_Shark()
{
noStroke();
  fill(#3287A0);
  quad(3,166,52,120,379,56,220,174);  //body
  triangle(220,174, 379,56, 365,206);
  triangle(213,91,247,16, 312,75);
  triangle(301,192, 256,315, 365,206);//front hand
  //head
  triangle(365,206, 379,56, 441,170);
  quad(441,170,379,56,567,123,602,174);
  //lower body
  fill(180);  //grey
  quad(3,166, 220,174, 301,192, 284,233);  //back
  triangle(365,206, 334,241, 379,249);//front
  triangle(379,249, 365,206, 441,170);
  quad(379,249, 441,170, 602,174, 577,206);//mouth
  // back hand
  fill(#3287A0);
  triangle(379,249,384,321, 419,240);
  //tail
  quad(3,166, 73,184, 89,289, 76,294);
  beginShape();
  curveVertex(89,289);
  curveVertex(89,289);
  curveVertex(62,304);
  curveVertex(38,355);
  curveVertex(82,310);
  curveVertex(153,312);
  curveVertex(108,291);
  curveVertex(89,289);
  curveVertex(89,289);
  endShape();
  fill(#244048);
  beginShape();
  curveVertex(38,355);
  curveVertex(38,355);
  curveVertex(94,323);
  curveVertex(153,312);
  curveVertex(82,310);
  curveVertex(38,355);
  curveVertex(38,355);
  endShape();
  
  fill(180);
  triangle(10,166, 70,183, 71,257);//white part of tail
  
 // mouth
 strokeWeight(1);
 stroke(30);
 line(489,190, 503, 188);
 line(503,188, 583,197);
 //eye
 fill(0);
 ellipse(511, 144, 10,10);
 
 //tear
 noStroke();
 fill(#5CB78A);
 triangle(505,147, 489,163, 507,165);
 quad(489,163, 507,165, 502,174, 486,173);
 triangle(502,174, 486,173, 491,179);
   
}
void draw()
{
  draw_Shark();
  /*
  //scale(.5);
  noStroke();
  fill(#3287A0);
  quad(3,166,52,120,379,56,220,174);  //body
  triangle(220,174, 379,56, 365,206);
  triangle(213,91,247,16, 312,75);
  triangle(301,192, 256,315, 365,206);//front hand
  //head
  triangle(365,206, 379,56, 441,170);
  quad(441,170,379,56,567,123,602,174);
  //lower body
  fill(180);  //grey
  quad(3,166, 220,174, 301,192, 284,233);  //back
  triangle(365,206, 334,241, 379,249);//front
  triangle(379,249, 365,206, 441,170);
  quad(379,249, 441,170, 602,174, 577,206);//mouth
  // back hand
  fill(#3287A0);
  triangle(379,249,384,321, 419,240);
  //tail
  quad(3,166, 73,184, 89,289, 76,294);
  beginShape();
  curveVertex(89,289);
  curveVertex(89,289);
  curveVertex(62,304);
  curveVertex(38,355);
  curveVertex(82,310);
  curveVertex(153,312);
  curveVertex(108,291);
  curveVertex(89,289);
  curveVertex(89,289);
  endShape();
  fill(#244048);
  beginShape();
  curveVertex(38,355);
  curveVertex(38,355);
  curveVertex(94,323);
  curveVertex(153,312);
  curveVertex(82,310);
  curveVertex(38,355);
  curveVertex(38,355);
  endShape();
  
  fill(180);
  triangle(10,166, 70,183, 71,257);//white part of tail
  
 // mouth
 strokeWeight(1);
 stroke(30);
 line(489,190, 503, 188);
 line(503,188, 583,197);
 //eye
 fill(0);
 ellipse(511, 144, 10,10);
 
 //tear
 noStroke();
 fill(#5CB78A);
 triangle(505,147, 489,163, 507,165);
 quad(489,163, 507,165, 502,174, 486,173);
 triangle(502,174, 486,173, 491,179);
   */
    
  
}