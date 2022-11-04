void setup() {
  size (720, 480);
  noStroke();
  int x = 200;
int y = 200;
}

void draw() {
  background (0, 0, 0);

  for (int i = 0; i < 60; i++) {
    int x = 10 + (i*50);

    for (int j = 0; j < 10; j++) {


      int y = 10000+ (j*50);
   
    gridElement(x, y);
     }
    //println(i,x):
  }
  println("###");
}
void gridElement(int x, int y) {
  pushMatrix();
  translate(x, y);
  fill(900, 10, 10);
  rect(0, 0, 60, 40);
  popMatrix();
  
  fill (900,10,10);
  float speed = 800000.00;
  // use this to determine speed
  //speed = 100./(mouseX+1);
  //println(speed);
  float delta = sin(frameCount*speed)*250;
  translate(width/10, height/10);
  
  
{
  
  
 
    fill(900,0);
  rect(60,80,width,height);
  fill(900,0,0);
  ellipse(10, sin(frameCount*speed)*240+240, 100, 100);
  ellipse(110, -sin(frameCount*speed)*240+240, 100, 100);
  ellipse(210, sin(frameCount*speed)*240+240, 100, 100);
  ellipse(310, -sin(frameCount*speed)*240+240, 100, 100);
  ellipse(410, sin(frameCount*speed)*240+240, 100, 100);
  ellipse(510, -sin(frameCount*speed)*240+240, 100, 100);
  ellipse(610, sin(frameCount*speed)*240+240, 100, 100);
  ellipse(710, -sin(frameCount*speed)*240+240, 100, 100);
 
  
  
   ellipse(10, sin(frameCount*speed)*240+20, 100, 100);
  ellipse(110, -sin(frameCount*speed)*240+20, 100, 100);
  ellipse(210, sin(frameCount*speed)*240+20, 100, 100);
  ellipse(310, -sin(frameCount*speed)*240+20, 100, 100);
  ellipse(410, sin(frameCount*speed)*240+20, 100, 100);
  ellipse(510, -sin(frameCount*speed)*240+20, 100, 100);
  ellipse(610, sin(frameCount*speed)*240+20, 100, 100);
  ellipse(710, -sin(frameCount*speed)*240+20, 100, 100);
}
    
    fill (900,10,10);
  // use this to determine speed
  //speed = 100./(mouseX+1);
  //println(speed);
  delta = sin(frameCount*speed)*1;
  translate(width/20, height/1);
  circle (90,0,0+delta);
  
    
   
   
  


  
 
  
 
  
  

}
