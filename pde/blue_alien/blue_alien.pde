//animation on music seduction by zarina
//patroon_17-20
//paars,zwart,wit
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

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

color green = #340744;
color yellow = #0F0F0F;
color dgreen = #741AAC;
color blue = #0E050F;
color white = #FFFFFF;
color purple =#FFFFFF;
color purple1 = #9388A2;

//big buildings
int x1 = 20;
int x2 =200;
int x3 = 600;

//cloud(stars)
int x4 = 400;

int x5 = 12;
int x6 = 0;
int x7 = 200;
int x8 = 400;
int x9 = 600;
int x10 =800;
//int streepjeX = 20;
int alienx = 0;
int alieny = 0;
float rotAlien= 0;

void setup (){
 // zarina_imt jaar 1
  size(720,480);
   oscP5 = new OscP5(this,6200);
   myRemoteLocation = new NetAddress("127.0.0.1",12000);
   noStroke();
}

void draw()
{
  //sky
  background(blue);
  {
   // stars tekenen
   float speed = 0.23;
  // use this to determine speed
  //speed = 100./(mouseX+1);
  //println(speed);
  float delta = sin(frameCount*speed)*4;
  translate(720/-555, 399/493);
 
 
  int stars = 5;
 while(stars < width){
   fill(white);
  circle(x4,stars,1+delta);
  circle(x4+100,stars-34,1+delta);
  circle(x4+200,stars,1+delta);
 circle(x4+300,stars-34,1+delta);
 circle(x4-200,stars,1+delta);
 circle(x4-100,stars-34,1+delta);
 circle(x4-400,stars,1+delta);
 circle(x4-300,stars-34,1+delta);
 circle(x4-500,stars-34,1+delta);
 circle(x4+500,stars-34,1+delta);
 circle(x4+600,stars,1+delta);
 circle(x4+700,stars-34,1+delta);
  circle(x4-600,stars,1+delta);
  circle(x4-700,stars-34,1+delta);
 circle(x4-800,stars,1+delta);
 circle(x4-900,stars-34,1+delta);
  circle(x4+900,stars-34,1+delta);
  circle(x4+1000,stars,1+delta);
  circle(x4-1000,stars,1+delta);
 
  stars =stars + 75;
  println("stars:",stars);
  }
  }
  //buildings
  fill(green);
  rect(x1,160,150,400);
  rect(x2,120,202,400);
  rect(x3,125,200,400);
   
   // windowx1 tekenen

  int windowX1 = 181;
 while(windowX1 < width){
   
   fill(0);
 rect(x1+10,windowX1,26,21);
  rect(x1+60,windowX1,26,21);
  rect(x1+110,windowX1,26,21);
   
   if (channel1instr != 0 )
  { 
  fill(purple);
   rect(x1+10,windowX1,26,21);
  rect(x1+60,windowX1,26,21);
  rect(x1+110,windowX1,26,21);
  }
  
  windowX1 = windowX1 + 55;
  println("windowX1:",windowX1);
  }
  
    // windowx2 tekenen
  int windowX2 = 134;
 while(windowX2 < width){
   fill(0);
    rect(x2+10,windowX2,26,21);
  rect(x2+60,windowX2,26,21);
  rect(x2+110,windowX2,26,21);
  rect(x2+160,windowX2,26,21);
  
  if(channel2instr != 0){
  fill(purple);
  rect(x2+10,windowX2,26,21);
  rect(x2+60,windowX2,26,21);
  rect(x2+110,windowX2,26,21);
  rect(x2+160,windowX2,26,21);
  }
  windowX2 = windowX2 + 56;
  println("windowX2:",windowX2);
  }
  // windowx3 tekenen
  int windowX3 = 142;
 while(windowX3 < width){
    fill(0);
  rect(x3+10,windowX3,26,21);
  rect(x3+60,windowX3,26,21);
  rect(x3+110,windowX3,26,21);
  rect(x3+160,windowX3,26,21);
    if (channel3instr != 0 )
  { 
  fill(purple);
  rect(x3+10,windowX3,26,21);
  rect(x3+60,windowX3,26,21);
  rect(x3+110,windowX3,26,21);
  rect(x3+160,windowX3,26,21);
  }
  windowX3 = windowX3 + 56;
  println("windowX3:",windowX3);
  }
  //fore building
   fill(dgreen);
  rect(x5,255,-179,400);
  rect(x6,185,152,400);
  rect(x7,142,154,400);
  rect(x8,256,155,400);
  rect(x9,184,156,400);
  rect(x10,183,158,400);
 
   // windowx5 tekenen
  int windowX5 = 269;
 while(windowX5 < width){
  
  fill(purple);
  rect(x5-160,windowX5,24,23);
  rect(x5-110,windowX5,24,23);
  rect(x5-60,windowX5,24,23);
 
  windowX5 = windowX5 + 53;
  println("windowX5:",windowX5);
  }
   // windowx6 tekenen
  int windowX6 = 205;
 while(windowX6 < width){
  fill(purple);
  rect(x6+10,windowX6,26,21);
  rect(x6+60,windowX6,26,21);
  rect(x6+110,windowX6,26,21);
  windowX6 = windowX6 + 56;
  println("windowX6:",windowX6);
  }
  
   // windowx7 tekenen
  int windowX7 = 165;
 while(windowX7 < width){
  fill(purple);
  rect(x7+10,windowX7,26,21);
  rect(x7+60,windowX7,26,21);
  rect(x7+110,windowX7,26,21);
  windowX7 = windowX7 + 66;
  println("windowX7:",windowX7);
  }
  
   // windowx8 tekenen
  int windowX8 = 271;
 while(windowX8 < width){
   fill(0);
  rect(x8+10,windowX8,26,21);
  rect(x8+60,windowX8,26,21);
  rect(x8+110,windowX8,26,21);
  if(channel1instr != 0){
  fill(purple);
  rect(x8+10,windowX8,26,21);
  rect(x8+60,windowX8,26,21);
  rect(x8+110,windowX8,26,21);
  }
  windowX8= windowX8 + 46;
  println("windowX8:",windowX8);
  } 
  
  // windowx9 tekenen
  int windowX9 = 200;
 while(windowX9 < width){
  fill(purple);
  rect(x9+10,windowX9,26,21);
  rect(x9+60,windowX9,26,21);
  rect(x9+110,windowX9,26,21);
  windowX9= windowX9 + 56;
  println("windowX9:",windowX9);
  } 
  
  // windowx10 tekenen
  int windowX10 = 193;
 while(windowX10 < width){
  fill(purple);
  rect(x10+10,windowX10,26,21);
  rect(x10+60,windowX10,26,21);
  rect(x10+110,windowX10,26,21);
  windowX10 = windowX10 + 56;
  println("windowX10:",windowX10);
  }
  
   //ground
   fill(yellow);
   rect(-100,407,910,268);
   
     // streepjes tekenen
  int streepjeX = 10;
 while(streepjeX < width){
  fill(255);
 rect(streepjeX,434,30,10);
 streepjeX = streepjeX + 73;
 println("streepjeX:",streepjeX);
 if(streepjeX>=1000)
   {
     streepjeX = -200;
   }
  }
//===================================================================
  pushMatrix();
 translate(alienx,alieny);
 rotate(cos(rotAlien));
  alien();
  popMatrix();
  
   alienx = alienx +1;
   alieny = alieny -5;
   alienx += random(-5, 5);
  alieny += random(5, -5);
  rotAlien= rotAlien+0.01;
   if(alienx==1000)
   {
    alienx = -200;
   }

   //========================================================================
   //move stars/cloud
   x4 = x4 +1;
   if(x4==1000)
   {
     x4 = -200;
   }
   
   //move back buildings
   x1=x1 + 2;
   x2=x2 + 2;
   x3=x3 + 2;
   
   //teleport stuff!
    if(x1>=1000)
   {
     x1 = -200;
   }
    if(x2>=1000)
   {
     x2 = -200;
   }
    if(x3 >=1000)
   {
     x3 = -200;
   }
   //move foreground hills
   x5= x5+ 4;
   x6= x6+ 4;
   x7= x7+ 4;
   x8= x8+ 4;
   x9= x9+ 4;
   x10= x10+ 4;
    if(x5>=1000)
   {
     x5 = -200;
   }
    if(x6>=1000)
   {
     x6 = -200;
   }
    if(x7 >=1000)
   {
     x7 = -200;
   }
    if(x8>=1000)
   {
     x8 = -200;
   }
    if(x9>=1000)
   {
     x9 = -200;
   }
    if(x10 >=1000)
   {
     x10 = -200;
   }
   //===========================================================================
   
   int widthkwart = width/4;
  if (channel1instr != 0 )
  { 
    fill(white,18);
    rect(0, 0,  widthkwart, height);  
     
  }
  if (channel2instr != 0 )
  { 
    fill(blue,129);
    rect(width - widthkwart*3, 0,  widthkwart, height); 
 
 
  }
  if (channel3instr != 0 )
  { 
    fill(green,96);
    rect(width - widthkwart*2, 0,  widthkwart, height);  
    
  }
  if (channel4instr != 0 )
  { 
    fill(dgreen,95);
    rect(width - widthkwart, 0, widthkwart, height);   
     
  }
  
}
//=====================================================================================
void alien(){
  noStroke();
 //legs
fill(0);
triangle(66,218,126,164,75,218);
triangle(217,218,158,164,207,218);
 float speed = 0.23;
  // use this to determine speed
  //speed = 100./(mouseX+1);
  //println(speed);
  float delta = sin(frameCount*speed)*4;
  translate(720/-555, 399/493);
{
  fill(white);
triangle(204+delta,242,83-delta,242,142,153);
}
//shipglass
fill(216);
ellipse (141,169,96,63);
fill(dgreen);
ellipse (142,160,33,35);
//eyes
fill(1);
ellipse (149,159,11,6);
fill(1);
ellipse (134,159,11,6);
//shipbody
fill (98);
ellipse (141,192,138,29);
fill (dgreen);
ellipse (103,192,13,13);
fill (green);
ellipse (179,192,13,13);
fill (white);
ellipse (141,192,13,13);

}

void oscEvent(OscMessage message) 
{
  if (message.checkAddrPattern("/patternevent" ) )

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
