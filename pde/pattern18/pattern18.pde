import netP5.*;
import oscP5.*;

OscP5 oscP5;
int trianglex = 0;
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
int xstarting=height/2;
int ystarting=width/2;
int ewidth=100;
int eheight=100;
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
  if(patternnr==18){
      for(int i=0; i<36; i++){
        int x =3 + (i*20);
        for(int r=0; r<24; r++){
          int y =3 + (r*20);
          gridElement(x, y);
        }
      }
      if(channel3instr!=0){
       ewidth=400;
     }
     else if (channel3instr==0){
       ewidth=200;
     }
     fill(131, 88, 191);
     circle(width/2,height/2,ewidth);
     if(channel1instr!=0){
       tandenrijboven(0,0);
       tandenrijonder(0,0);
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
void gridElement(int x, int y){
  pushMatrix();
  translate(x,y);
  fill(100);
  rect(0,0,12,12);
  fill(0,0,0);
  popMatrix();
}

void tandenrijonder(int x, int y){
  pushMatrix();
  translate(x,y);
  fill(255);
   triangle(0,height, 40,height-200, 80,height);
   triangle(80,height, 120,height-200, 160,height);
   triangle(160,height, 200,height-200, 240,height);
   triangle(240,height, 280,height-200, 320,height);
   triangle(320,height, 360,height-200, 400,height);
   triangle(400,height, 440,height-200, 480,height);
   triangle(480,height, 520,height-200, 560,height);
   triangle(560,height, 600,height-200, 640,height);
   triangle(640,height, 680,height-200, 720,height);
   popMatrix();
}
void tandenrijboven(int x, int y){
  pushMatrix();
  translate(x,y);
  fill(255);
   triangle(0,0, 40, 200, 80,0);
   triangle(80,0, 120,200, 160,0);
   triangle(160,0, 200,200, 240,0);
   triangle(240,0, 280,200, 320,0);
   triangle(320,0, 360,200, 400,0);
   triangle(400,0, 440,200, 480,0);
   triangle(480,0, 520,200, 560,0);
   triangle(560,0, 600,200, 640,0);
   triangle(640,0, 680,200, 720,0);
   popMatrix();
}
