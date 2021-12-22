PFont font;
int ts = 0;

void setup(){
  size(720,480);
  loadSounds(0,0);
  font = createFont("RetrovilleNC.ttf", 64);
}

void draw(){
  float frameC8b = sin(frameCount/100.) * 20 + 90;
  float frameC8g = sin(frameCount/230.) * 20 + 90;
  background(0,frameC8g,frameC8b);
  if (ts == 0) ts = millis(); //time start
  playSounds();
  
  int bars=0;
  while(bars<10)
  {
    drawBar(cos((bars/5.)+frameCount*0.028)*(height/2)+height/2, 20, new PVector(bars*25,100,200));
    bars++;
  }
  textFont(font);    
  textSize(84);
  textAlign(CENTER);
  fill(255,255,0);
  if ( millis()-ts > 1666) text("LAME", width/2+4, height/2-64); 
  textSize(56);
  if (millis()-ts > 3333 ) text("PROGRAMMING", width/2+3, height/2); 
  textSize(152);
  if (millis()-ts > 5000 ) text("FTW", width/2+5, height/2+128);
  
  fill(0);
  textSize(84);
  if ( millis()-ts > 1666) text("LAME", width/2, height/2-64); 
  textSize(56);
  if (millis()-ts > 3333 ) text("PROGRAMMING", width/2, height/2); 
  textSize(152);
  if (millis()-ts > 5000 ) text("FTW", width/2, height/2+128);
  //if (millis()-ts > 10000 ) background(0);
}

void drawBar(float y, float barheight, PVector col)
{
  noStroke();
  y = y - barheight/2;
  PVector gradCol = new PVector(col.x, col.y, col.z);
  gradCol.mult(0.5);
  fill(gradCol.x, gradCol.y, gradCol.z);
  rect(0, y, width, 2);
  y+=2;
  gradCol.mult(1.5);
  fill(gradCol.x, gradCol.y, gradCol.z);
  rect(0, y, width, 2);
  y+=2;
  fill(col.x, col.y, col.z);
  rect(0, y, width, barheight);
  y+=barheight;
  fill(gradCol.x, gradCol.y, gradCol.z);
  rect(0, y, width, 2);
  y+=2;
  gradCol.mult(2/3.);
  fill(gradCol.x, gradCol.y, gradCol.z);
  rect(0, y, width, 2);
}

void keyReleased()
{
  println(millis()-ts);
}
