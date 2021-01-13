//Daan Vroom
//pat29

int dim;

void modPatternEvent(int pos, int pattern)
{
   println(pos, pattern); 
}

import procmod.*;

//  define a new instance of the ModPlayer
ModPlayer mplayer;
//  we'll use this to draw a background color
int bgcolor = 0;

void setup() {
  size(720,480);
  background(0);
  //  Load the supplied test.mod file
  mplayer = new ModPlayer(this, dataPath("pat29.mod"));
  //  play it rightaway
  mplayer.play();
  
  dim = width;
colorMode(RGB, 600, 360, 360);
noStroke();
ellipseMode(RADIUS);
frameRate(30);
background(0);
}

void draw() {

  for (int x = 0; x <= height; x+=dim) {
drawGradient(x, width/6);
}
}

void drawGradient(float x, float y) {
int radius = dim;
float h = random(0, 700);
for (int r = radius; r > 4; --r) {
fill(h, r-150, 20,20);
rect(x, r, 1000, r);
h = (h + 6) % 500;

}
}


//  This method is called every time an instrument is being played. 
//  Note: It is also called when no instrument is being called on a channel
//  the instrument number will be 0 then.
void modRowEvent( int channel, int instrument, int note )
{
  //  We will only respond to channel 0 (a MOD file usually only has 4 channels)
  if (channel == 0)
  {
    println(channel +":"+ instrument +":"+ note);
    //  Whatever instrument is being played just set a background color from the note played.
    bgcolor = note * 0;
  }
}