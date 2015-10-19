float radi = 35;
float startX = 200;

size(400,400);
strokeWeight(3);
noFill();
beginShape();
for(int i=0; i<400; i++)
{
    curveVertex(startX+radi*sin(radians(i*3)), i);
}
endShape();