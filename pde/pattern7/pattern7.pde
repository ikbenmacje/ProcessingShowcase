//Iuliia. Demo. Paulinas C Flight group. Pattern7.

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

int x = 0;
int y = 0;
  int pos_x = 0;
  int pos_y = 0;
  
void setup()
{
  size(720, 480);
  frameRate(60);
    background(0);
  oscP5 = new OscP5(this,6200);
}

void draw() 
{
  //blue background
   noStroke();
  fill(0, 0, random(255), 90); 
  rect(x, y, 720, random(80, 500)); 

  fill(0, 5); 
  rect(0, 410, 720, random(410, 500));
  
  for (int a = 120; a < 720; a = a + 160) {
    for (int b = 100; b < 480; b = b + 140) {

      //big circles
      fill(0, 0, random(255), 40); 
      ellipse(a, b, 40, 40);

      //shadow on big circlies
      fill(255, 5);
      ellipse(a + 3, b + 3, 40, 40);

      //black moving circles
      fill(0, 80);
      ellipse(random(0, 720), b - 40, 15, 15);
    }
  }
  
   //if (channel3instr != 0 ){
   
   //black lines
  float distance = random(720);
  stroke(0);
  line(distance, 0, distance, 480); 
  
//if (channel4instr != 0 ){
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
