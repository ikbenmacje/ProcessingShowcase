// VARIABLES //
// Settings
int amount = 100; // Amount of balls in scene

// Colors
color darkblue = color(40,38,75);
color midblue = color(78,81,116);
color lightblue = color(149,158,201);
color white = color(232,234,231);
color red = color(164,0,51);
color[] colAll = { darkblue, midblue, lightblue, white, red};

// Other
Bounceball[] balls = new Bounceball[amount];
int fade = 10;



// SETUP //
void setup(){
  // Set up screen
  size(720,480);
  background(darkblue);
  noStroke();
  blendMode(NORMAL);
  
  // Initialize bouncing balls
  for(int i=0; i<balls.length; i++){
    balls[i] = new Bounceball();
  }  
}


// MAIN LOOP //
void draw(){
  //Clear image
  fill(darkblue,fade);
  rect(0,0,width,height);

  //Draw Objects
  for(int i=0; i<balls.length; i++){
    balls[i].show();
  }
}



// FUNCTIONS //

// Change Fade-Length on Mouse-Scroll
void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  fade += e*2;
  if (fade < 0){
    fade = 0;
  }
  if (fade > 50){
    fade = 50;
  }
  println(fade);
}

void mouseClicked(){
  for(int i=0; i<balls.length; i++){
    balls[i] = new Bounceball();
  } 
}
