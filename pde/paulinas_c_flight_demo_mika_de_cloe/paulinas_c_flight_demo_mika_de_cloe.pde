// Mika de Cloe, PHO1B


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
  int widthkwart = width/4;
  if (channel1instr != 0 )
  { 
    fill(0, 0, 220);
    rect(0, 0,  random(720), random(480));  
        stroke(0,0,0);
    strokeWeight (random(100));
  }
  if (channel2instr != 0 )
  { 
    fill(0, 0, 220);
    rect(width - widthkwart*3, 0,  random(720), random(480));    
        stroke(0,0,0);
    strokeWeight (random(100));
  }
  if (channel3instr != 0 )
  { 
    fill(255, 255, 255);
     
    triangle (random(700),random(700),random(700),random(700),
    random(700),random(700));
    
    
    stroke(0,0,0);
    strokeWeight (random(400)); 
}
  if (channel4instr != 0 )
  { 
    fill(0, 0, 220);
    rect(width - widthkwart, 0, random(720), random(480));   
   
    stroke(255,255,255);
    strokeWeight (random (10));
 fill(0, 0, 220); 
 ellipse(467,233,random(50),random(50));
 ellipse(275,222,random(50),random(50));
 ellipse(439,254,random(50),random(50));
 ellipse(409,270,random(50),random(50));
 ellipse(378,284,random(50),random(50));
 ellipse(253,233,random(50),random(50));
 ellipse(441,207,random(50),random(50));
 ellipse(408,199,random(50),random(50));
 ellipse(378,188,random(50),random(50));
 ellipse(310,270,random(50),random(50));
 ellipse(340,284,random(50),random(50));
 ellipse(296,202,random(50),random(50));
 
 ellipse(322,195,random(50),random(50));
 ellipse(279,254,random(50),random(50));
 ellipse(354,182,random(50),random(50));
 
 fill(255, 255, 255);
 stroke (0,0,0);
 strokeWeight (random (50));
 ellipse(360,238,random(30,93),random(20,73));
 
 fill(0, 0, 220);
   stroke(0,0,0);
    strokeWeight (random(100));
 ellipse(random(700),random(100),random(200),random(100));
 ellipse(random(700),random(100),random(200),random(100));
 ellipse(random(700),random(100),random(100),random(200));
 ellipse(random(700),random(100),random(100),random(200));

 ellipse(random(100),random(500),random(200),random(100));
 ellipse(random(100),random(500),random(200),random(100));
 ellipse(random(100),random(500),random(100),random(200));
 ellipse(random(100),random(500),random(100),random(200));
 
 ellipse(random(700),random(380, 500),random(200),random(100));
 ellipse(random(700),random(380, 500),random(200),random(100));
 ellipse(random(700),random(380, 500),random(100),random(200));
 ellipse(random(700),random(380, 500),random(100),random(200));
 
 ellipse(random(600, 700),random(500),random(200),random(100));
 ellipse(random(600, 700),random(500),random(200),random(100));
 ellipse(random(600, 700),random(500),random(100),random(200));
 ellipse(random(600, 700),random(500),random(100),random(200));
  }
  
  textAlign(CENTER);
  text("PAT:" + patternnr, width/2, height/2);
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
