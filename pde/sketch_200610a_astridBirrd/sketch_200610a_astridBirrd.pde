 // sample 0 bijdrage van de eindopdracht
// van Astrid

import procmod.*;

//  define a new instance of the ModPlayer
ModPlayer mplayer;


int sample1_played = 0;
int go_played = 0;

// sample1_draw_frame_count houdt bij hoe vaak we al getekend hebben
int sample1_draw_frame_count = 0;

PImage img1;
PImage img2;

void setup() {
  size(640,360);
  //frameRate (20);
  img1 = loadImage("yeet_bird01.png");
  img2 = loadImage("yeet_bird04.png");
  
  //  Load the supplied go.mod file 
  mplayer = new ModPlayer(this, dataPath("Go.mod"));
  //  play it rightaway
  mplayer.play();
}

// Deze functie gaat tekenen zodra sample1 afgespeeld wordt
// Je kunt opgeven hoelang (aantal frames) hij moet tekenen.

void sample1_draw_for(int frames)
{
  fill(random(255),random(255),random(255));
  textSize (random(100));
  text("Birrrrd", random(width), random(height));
  
  if ( sample1_played == 1)
  {
    sample1_draw_frame_count = frames;
    sample1_played = 0;
  }
  if (sample1_draw_frame_count >= 10)
  {
    //background(255);
    imageMode(CENTER);
    int alpha = int((float(sample1_draw_frame_count) / frames) * 255);
    tint(alpha, alpha); 
    image(img2, width/2, (height-100)-sample1_draw_frame_count, 60+random(10)+sample1_draw_frame_count, 60+random(10)+sample1_draw_frame_count);
    sample1_draw_frame_count = sample1_draw_frame_count - 2;
  }
  
   if (sample1_draw_frame_count <= 10)
  {
    background(0);
    imageMode(CENTER);
    int alpha = int((float(sample1_draw_frame_count) / frames) * 255);
    tint (255,255);
    image(img1, width/2, (height/2-50), 150, 150);
    sample1_draw_frame_count = sample1_draw_frame_count + 1;
  }
  
  if (go_played == 1)
  {
  background (0);
  }
}




void draw() {
  background(0);
  sample1_draw_for(140);
  println (frameCount);
  
  
}

//  This method is called every time an instrument is being played. 
//  Note: It is also called when no instrument is being called on a channel
//  the instrument number will be 0 then.

void modRowEvent( int channel, int instrument, int note )
{
  if (instrument == 1)
  {
    println(channel +":"+ instrument +":"+ note);
    sample1_played = 1;
  }
if (instrument == 2)
  {
    println(channel +":"+ instrument +":"+ note);
    //  Whatever instrument is being played just set a background color from the note played.
    //go_played = 1;
  }
}
