
//Setup the Window
int width = 640,height=320;
size(640,320);
background(0);
noFill();

//Put a white point in the centre
stroke(255);
point(0.5*width,0.5*height);

//To draw a blue line at one thrid of the window height
stroke(0,0,255);
line(0,0.33*height,width,0.33*height);

//to draw a rectangle
stroke(255,153,0);
rect(0.33*width,0.33*height,0.33*width,0.33*height);
