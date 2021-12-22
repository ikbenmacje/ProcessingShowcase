PFont font;
int ts = 0;

void setup(){
  size(720,480);
  loadSounds(0,0);
  font = createFont("RetrovilleNC.ttf", 64);
}

void draw(){
  float frameC8b = cos(frameCount/100.) * 20 + 30;
  float frameC8g = cos(frameCount/230.) * 20 + 30;
  background(0,frameC8g,frameC8b);
  if (ts == 0) ts = millis(); //time start
  playSounds();
  
  int bars=0;
  while(bars<10)
  {
    drawBar(cos((bars/5.)+frameCount*0.04)*(height/2)+height/2, 20, new PVector(255,bars*25,0));
    bars++;
  }
  textFont(font);    
  textSize(84);
  textAlign(CENTER);
  fill(0);
  if ( millis()-ts > 3320) text("THIS", width/2, height/2-64); 
  if (millis()-ts > 4038 ) text("IS NOT", width/2, height/2); 
  textSize(128);
  if (millis()-ts > 6161 ) 
  {
    // random flicker
    int rndmod = int(random(1,40));
    if (frameCount % rndmod > (rndmod/10)) 
    {
      fill(255,0);
    }
  }
  if (millis()-ts > 4872 ) text("VIDEO", width/2, height/2+98);
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
