
PImage original;
original = loadImage("data/me.JPG");
size(600,600);
PImage after = createImage(original.width, original.height, RGB); 

original.loadPixels();
after.loadPixels();

for(int i=0; i<original.pixels.length; i++)
{
    
        after.pixels[i]  = color(brightness(original.pixels[i]) + random(-25,0));
}
updatePixels();

image(after,0,0);

save("funfun.png");