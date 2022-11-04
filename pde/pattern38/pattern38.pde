import netP5.*;
import oscP5.*;

OscP5 oscP5;

int songposition = 0;
int patternnr = 0;
int patternrow = 0;
int channel1instr = 0;
int channel2instr = 0;
int channel3instr = 0;
int channel4instr = 0;
int channel1note = 0;
int channel2note = 0;
int channel3note = 0;
int channel4note = 0;
char channel1effect;
char channel2effect;
char channel3effect;
char channel4effect;
String channel1effect_param = "00";
String channel2effect_param = "00";
String channel3effect_param = "00";
String channel4effect_param = "00";
String feedback_formatted = "";

color backGround = color(255);
color foreGround = color(0);

int numCirc = 50;
PVector[] pos = new PVector[numCirc];

void setup()
{
  size(720, 480);
  frameRate(60);
  oscP5 = new OscP5(this, 6200);

  // fill random array
  generate();
}

void draw() 
{
  background(backGround);
  noStroke();

  for (int i=0; i < numCirc; i++) {
    drawBall(pos[i].x, pos[i].y, pos[i].z);
  }

  if (channel3instr != 0 )
  { 
    generate();
  }

  if (channel3instr != 0 ) {
    color b =  backGround;
    backGround = foreGround;
    foreGround = b;
  }

  /*
  int widthkwart = width/4;
   if (channel1instr != 0 )
   { 
   fill(70, 35, 122);
   rect(0, 0,  widthkwart, height);    
   }
   if (channel2instr != 0 )
   { 
   fill(61, 220, 151);
   rect(width - widthkwart*3, 0,  widthkwart, height);    
   }
   if (channel3instr != 0 )
   { 
   fill(243, 167, 18);
   rect(width - widthkwart*2, 0,  widthkwart, height);    
   }
   if (channel4instr != 0 )
   { 
   fill(1, 186, 239);
   rect(width - widthkwart, 0, widthkwart, height);    
   }
   
   textAlign(CENTER);
   text("PAT:" + patternnr, width/2, height/2);
   */
}

void generate() {
  // fill random array
  for (int i=0; i < numCirc; i++) {
    int size = round(random(30, 80));
    int x = round(random(size, width-size));
    int y = round(random(size, height-size));
    pos[i] = new PVector(x, y, size);
  }
}

void drawBall(float x, float y, float s) {

  int numCirc = 45;
  float step = s / numCirc;
  float a = (255/step)-10;
  for (int i=0; i<numCirc; i++) {
    float size = s - (step*i);
    fill(foreGround, 30);
    noStroke();
    circle(x, y, size);
  }
}

void oscEvent(OscMessage message) 
{
  if (message.checkAddrPattern("/patternevent" ) )
  {
    /* print the address pattern and the typetag of the received OscMessage */
    //print("### received an osc message.");
    //print(" addrpattern: "+message.addrPattern());
    //println(" typetag: "+message.typetag());

    songposition = message.get(0).intValue();
    patternnr = message.get(1).intValue();
    patternrow = message.get(2).intValue();

    channel1note = message.get(3).intValue();
    channel1instr = message.get(4).intValue();
    channel1effect = message.get(5).charValue();
    channel1effect_param = message.get(6).stringValue();
    channel2note = message.get(7).intValue();
    channel2instr = message.get(8).intValue();
    channel2effect = message.get(9).charValue();
    channel2effect_param = message.get(10).stringValue();    
    channel3note = message.get(11).intValue();
    channel3instr = message.get(12).intValue();
    channel3effect = message.get(13).charValue();
    channel3effect_param = message.get(14).stringValue();
    channel4note = message.get(15).intValue();
    ;
    channel4instr = message.get(16).intValue();
    channel4effect = message.get(17).charValue();
    channel4effect_param = message.get(18).stringValue();


    feedback_formatted = String.format("%02d:%02d | %03d:%02d:%c%s | %03d:%02d:%c%s | %03d:%02d:%c%s | %03d:%02d:%c%s |", 
      patternnr, patternrow, 
      channel1note, channel1instr, channel1effect, channel1effect_param, 
      channel2note, channel2instr, channel2effect, channel2effect_param, 
      channel3note, channel3instr, channel3effect, channel3effect_param, 
      channel4note, channel4instr, channel4effect, channel4effect_param
      );
    println( feedback_formatted );
  }
}
