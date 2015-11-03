
PImage original;
original = loadImage("data/fun.jpg");
size(600,600);
PImage after = createImage(original.width, original.height, RGB); 

original.loadPixels();
after.loadPixels();

for(int i=0; i<original.pixels.length; i++)
{
    if(brightness(original.pixels[i]) > 100  && brightness(original.pixels[i]) < 200)
        after.pixels[i] = original.pixels[i];
    else
        after.pixels[i] = color(255,0,0);
}
updatePixels();

image(after,0,0);