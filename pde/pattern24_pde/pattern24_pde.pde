void setup()
{
  size(720,480);
}

void draw()
{
  background(0);
  fill(255);
  float speed = 0.23;
  // use this to determine speed
  //speed = 100./(mouseX+1);
  //println(speed);
  float delta = sin(frameCount*speed)*100;
  translate(width/2, height/2);

   fill(33,54,22);
   

//background(#F068B1);
    noStroke();
  
fill(255);
  rect(10,10,80,80,10);
 
  noStroke();
  fill(0);
  rect(20,20,60,60,10);
  
  noStroke();
  fill(255);
  rect(30,30,40,40,10);
  
  noStroke();
  fill(0);
  rect(40,40,20,20,10);
  
  noStroke();
  fill(0);
  triangle(100,0,50,50,0,0);
  
  triangle(50,50,100,100,0,100);
  

  
  fill(#F068B1);
   circle(50,20,50+delta);
  fill(255);
  circle(50,20,10+delta);
  
  fill(#F068B1);
 circle(50,80, 100+delta);
  fill(0);
  circle(50,80,10+delta);
  
  
  fill(#F068B1);
 circle(50,50, 50+delta);
  
  fill(255);
  circle(50,50,10+delta);
  
 
}
