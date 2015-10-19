float x,y;
void setup()
{
  size(650,650);
  background(#5CB78A);
  x=0; y=0;
  noLoop();
}

void draw_Shark(float Cx, float Cy, float ratio, float rot)
{
  pushMatrix();
    translate(Cx,Cy);
      scale(ratio);
      rotate(radians(rot));
      translate(-Cx, -Cy);
      noStroke();
      fill(#3287A0);
      quad(3,166,53,120,380,56,220,174);  //body
      triangle(219,174, 380,55, 366,207);
      triangle(213,91,247,16, 312,75);
      triangle(301,192, 256,315, 365,206);//front hand
      //head
      triangle(364,206, 380,56, 442,170);
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
  popMatrix();
   
}
void draw()
{
  //top left 
  for(int i=0; i<10; i++)
    draw_Shark(random(20,width/2-20), random(20, height/2-20), random(0.05, 0.2), random(-45,70));
 //top right
 for(int i=0; i<10; i++)
    draw_Shark(random(width/2 +20, width-20), random(20, height/2-20), random(0.05, 0.2), random(-45,70));
 //bottom left
 for(int i=0; i<10; i++)
    draw_Shark(random(20, width/2-20), random(height/2+20, height-20), random(0.05, 0.2), random(-45,70));
 //bottom right
 for(int i=0; i<10; i++)
    draw_Shark(random(width/2+20, width-20), random(height/2+20, height-20), random(0.05, 0.2), random(-45,70));
}