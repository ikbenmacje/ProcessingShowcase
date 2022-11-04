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

void setup()
{
  size(720, 480);
  frameRate(60);
  oscP5 = new OscP5(this,6200);
}

void draw() 
{
  background(0);
  noStroke();
  
  translate (width/2,height/2);
  
  int widthkwart = width/4;
  
     float mag = 100;
  float s = 4;
  
   noStroke();
   for (int i=0; i < 400; i++){
  
  float w = map(sin(radians(frameCount)), -1,1, -100,100);
  float wave1 = map(cos(radians(frameCount*2 + i + w)),-1,1,-mag,mag);
  float wave2 = map(tan(radians(frameCount + i)),-1,1,-mag,mag);
  float wave3 = map(sin(radians(frameCount*1 + i + w)),-2,2,-mag,mag);
  float wave4 = map(cos(radians(frameCount + i)),-2,2,-mag,mag);
  float c = map(tan(radians(frameCount * 5 + i)),-1,1,0,255);
  
    if (channel1instr != 0 )
  { 
    // rood 1
    fill(250,0,0);
    rect(wave2,wave3,s,s);
  }
  if (channel2instr != 0 )
  { 
    // rood 2
    fill(250,0,0);
    rect(wave3,wave2,s,s);
  }
  if (channel3instr != 0 )
  { 
    // wit 1
    fill(255);
    rect(wave2,wave3,s,s);
  }
  if (channel4instr != 0 )
  {   
    // wit 2
    fill(255);
    rect(wave3,wave2,s,s);
  }
  
   
 
 
 
 
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
    channel4note = message.get(15).intValue();;
    channel4instr = message.get(16).intValue();
    channel4effect = message.get(17).charValue();
    channel4effect_param = message.get(18).stringValue();


    feedback_formatted = String.format("%02d:%02d | %03d:%02d:%c%s | %03d:%02d:%c%s | %03d:%02d:%c%s | %03d:%02d:%c%s |" , 
                                      patternnr, patternrow, 
                                      channel1note, channel1instr, channel1effect, channel1effect_param, 
                                      channel2note, channel2instr, channel2effect, channel2effect_param, 
                                      channel3note, channel3instr, channel3effect, channel3effect_param,
                                      channel4note, channel4instr, channel4effect, channel4effect_param
                                      );
    println( feedback_formatted );
  }
}
