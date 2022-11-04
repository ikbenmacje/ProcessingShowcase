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
int y = 200;

int speed = 5;



int a;
int b;
boolean direction;

float r= 0, s=0;


void setup()
{
  size(720, 480);
  frameRate(60);
  oscP5 = new OscP5(this,6200);
  
  colorMode(RGB, width);
  a = 0;
  b = width;
  direction = true;
  
  
  //blendMode(SCREEN);
  
  //rectMode(CENTER);
}


void draw() 
{
  background(0);
  noStroke();
  int widthkwart = width/4;
  
  
  if (s<1000) {
      translate(width/2, height/2);
      rotate(r);
      stroke(600);
      fill(6);
      rect(0,0,r,s);
      r+=1;
      s+=1;
    }
    
    
     
    
    
    
  if (channel1instr != 0 )
  { 
           
    if (s<1000) {
      translate(width/2, height/2);
      rotate(0);
      stroke(600);
      fill(78);
      rect(0,0,r,s);
      r+=1;
      s+=1;
    }
    
    if (s<800) {
      translate(width/2, height/2);
      rotate(r);
      stroke(600);
      fill(0);
      rect(0,0,r,s);
      r+=1;
      s+=1;
    }
    
    if (s<600) {
      translate(width/2, height/2);
      rotate(r);
      
      stroke(600);
      fill(0);
      rect(0,0,r,s);
      r+=1;
      s+=1;
    }
    
    if (s<10000) {
      translate(width/2, height/2);
      rotate(r);
      stroke(600);
      fill(0);
      rect(0,0,r,s);
      r+=1;
      s+=1;
    }
    
    for (int i = 0; i< 10; i++){
 int x = 20 + (i*100);
 
 for (int j = 0; j< 10; j++){
 int y = 20 + (j*1);
 
 

 }
 }
  for (int i = 0; i< 10; i++){
 int x = 20 + (i*100);
 
 for (int j = 0; j< 10; j++){
 int y = 20 + (j*100);
 
 
 

 }
  }
 
  x = x + speed;
  
  if(x > width){
    //x = 0;
    speed = -5;


    b = int(random(255));
}
if(x < 0){
   speed = 5; 
}
  }
  if (channel4instr != 0 )
  { 
    for (int i = 0; i< 10; i++){
 int x = 20 + (i*100);
 
 for (int j = 0; j< 10; j++){
 int y = 20 + (j*100);
 
 

 }
 }
  for (int i = 0; i< 10; i++){
 int x = 20 + (i*100);
 
 for (int j = 0; j< 10; j++){
 int y = 20 + (j*100);
 
 
 //gridElement(x+50,y+2);

 }
  }
 
  x = x + speed;
  
  if(x > width){
    //x = 0;
    speed = -5;


    b = int(random(255));
}
if(x < 0){
   speed = 5; 
}  
  }
  if (channel2instr != 0 )
  { 
    for (int i = 0; i< 10; i++){
 int x = 20 + (i*100);
 
 for (int j = 0; j< 10; j++){
 int y = 20 + (j*100);
 
 

 }
 }
  for (int i = 0; i< 10; i++){
 int x = 20 + (i*100);
 
 for (int j = 0; j< 10; j++){
 int y = 20 + (j*100);
 
 
 //gridElement2(x+30,y);

 
 

 }
  
 
  

}
    
    
    
    
  
 
    
  }
   if (channel3instr != 0 )
  { 
    
    rect(0,0,2000,2000);
    
          for (int i = 0; i< 10; i++){
 int x = 0 + (i*100);
 
 for (int j = 0; j< 10; j++){
 int y = 0 + (j*100);
 
 

 }
 }
  for (int i = 0; i< 7; i++){
 int x = 0 + (i*100);
 
 for (int j = 0; j< 1; j++){
 int y = 0 + (j*100);
 
 
 gridElement3(x,y);

 }
  }
 
  x = x + speed;
  
  if(x > width){
    //x = 0;
    speed = -5;


    b = int(random(255));
}
if(x < 0){
   speed = 5; 
}
  }
  if (channel4instr != 0 )
  { 
    for (int i = 0; i< 10; i++){
 int x = 20 + (i*100);
 
 for (int j = 0; j< 10; j++){
 int y = 20 + (j*100);
 
 

 }
 }
  for (int i = 0; i< 10; i++){
 int x = 20 + (i*100);
 
 for (int j = 0; j< 10; j++){
 int y = 20 + (j*100);
 
 
 //gridElement(x+50,y+2);

 }
  }
 
  x = x + speed;
  
  if(x > width){
    //x = 0;
    speed = -5;


    b = int(random(255));
}
if(x < 0){
   speed = 5; 
}
 
}



  
  //textAlign(CENTER);
  //text("PAT:" + patternnr, width/2, height/2);
}

void gridElement(int x, int y){
 pushMatrix();
 translate(x,y);
 fill(0,0,0);
 rect(0,0,0,0);
 popMatrix();   
  }
  
  void gridElement2(int x, int y){
 pushMatrix();
 translate(x+2,y+2);
 fill(0,0,0);
 rect(0,0,0,0);
 popMatrix();   
  }
  
  void gridElement3(int x, int y){
 pushMatrix();
 translate(x,y);
 fill(0,0,355);
 
 popMatrix();   
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
