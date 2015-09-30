color c1, c2, c3;

void setup()
{
    size(400,400);
    c1 = color(random(255), random(255), random(255));  //get random color 1 and 2
    c2 = color(random(255), random(255), random(255));
    c3 = color(random(255), random(255), random(255));
}

void draw()
{
  fill(c1);
  rect(0,0,150,400);
  fill(c2);
  rect(150,0,100,400);
  fill(c3);
  rect(250,0,150,400);
}

void mousePressed()
{
  //if(mouseX <= 150)
  //    c1 = color(random(255), random(255), random(255));
  //else if (mouseX > 250)
  //    c3 = color(random(255), random(255), random(255));
    if(mouseX > 150 && mouseX < 250)  //only change the middle rect
        c2 = color(random(255), random(255), random(255));
}

/*
Comparison operator: < , > , <= , >= , == , !=
Logic operator: && means and, || means or, ! means not
    ex: if(!(x < 10 || y > 100))
*/