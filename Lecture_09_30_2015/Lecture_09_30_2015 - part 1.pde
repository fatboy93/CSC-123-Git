float scaleFactor = 2;
///
///
void setup()
{
  size(400,400);
}
void draw()
{
  fill(255,0,0);
  ellipse(200,100,50,20);
  pushMatrix();
      translate(10,10);    //remember to translate first before scale()
      scale(scaleFactor);  //make it smaller or bigger depend on scale
      fill(0,0,255);
      rect(10,10,10,10);
  popMatrix();
  

}