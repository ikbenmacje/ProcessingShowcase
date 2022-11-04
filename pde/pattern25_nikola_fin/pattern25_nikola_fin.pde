import netP5.*;
import oscP5.*;

boolean isLine = true;
int count = 15;
float time;
float amp;

// line param
float spacing = 20;

// circle param
float slice = radians(360/count);

//circle diameter
float diam = 200;

//random numbers
float a = 0;

//beats
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
  noFill();
  oscP5 = new OscP5(this,6200);
}

void draw() 
{
  background(0);
  
  
  //circles
  float size = noise(a, 10) * width;
  
  stroke(82,82,82);
  strokeWeight(2);
  ellipse(360, 240, size +70, size +70);
  
  stroke(82,82,82);
  strokeWeight(2);
  ellipse(360, 240, size +65, size +65);
  
  stroke(82,82,82);
  strokeWeight(4);
  ellipse(360, 240, size +60, size +60);
  
  stroke(82,82,82);
  strokeWeight(10);
  ellipse(360, 240, size +50, size +50);
  
  stroke(219,19,19);
  strokeWeight(3);
  ellipse(360, 240, size +40, size +40);
  
  stroke(82,82,82);
  strokeWeight(3);
  ellipse(360, 240, size +30, size +30);
  
  stroke(82,82,82);
  strokeWeight(3);
  ellipse(360, 240, size, size);
  
  stroke(82,82,82);
  strokeWeight(2);
  ellipse(360, 240, size -10, size -10);
  
  stroke(82,82,82);
  strokeWeight(1);
  ellipse(360, 240, size -10, size -20);
  
  stroke(82,82,82);
  strokeWeight(1);
  ellipse(360, 240, size -10, size -35);
  
  stroke(82,82,82);
  strokeWeight(1);
  ellipse(360, 240, size -10, size -50);
  
  stroke(82,82,82);
  strokeWeight(1);
  ellipse(360, 240, size -10, size -55);
  
 
  
 //beats and lines
  int widthkwart = width/4;
  if (channel1instr != 0 )
  { 
  strokeWeight(3);
  stroke(82,82,82);
  line(0,random(120,360), 719,random(120,360));   
  
  strokeWeight(3);
  stroke(82,82,82);
  line(0,random(120,360), 719,random(120,360));  
  }
  if (channel2instr != 0 )
  { 
  strokeWeight(4);
  stroke(219,19,19);
  line(0,random(120,360), 719,random(120,360));  
  
  
  strokeWeight(4);
  stroke(219,19,19);
  line(0,random(120,360), 719,random(120,360));
  }
  if (channel3instr != 0 )
  { 
  strokeWeight(5);
  stroke(139,89,89);
  line(0,random(120,360), 719,random(120,360)); 
  
  strokeWeight(5);
  stroke(139,89,89);
  line(0,random(120,360), 719,random(120,360));
  }
  if (channel4instr != 0 )
  { 
  strokeWeight(1);
  stroke(175,171,171);
  line(0,random(120,360), 719,random(120,360));    
  
  strokeWeight(1);
  stroke(175,171,171);
  line(0,random(120,360), 719,random(120,360));  
  }
  
  //random numbers
   a = a + 0.01;


  //wiggly lines
  time += .03;
  amp = map(mouseX, 0, width, 10, 40);

  if (isLine) {
    pushMatrix();
    translate(width/2 - count*spacing/-1, 0);

    beginShape();
    curveVertex(0, height/2);
    for (int i = -33; i < count; i++) {
      float x = i * spacing;
      

      float y = height/2 + random(-4, +4) * 50;
      
      curveVertex(x, y);

    }
    curveVertex(count*spacing, height/2);
    endShape();
    popMatrix();
  }

  if (!isLine) {
    pushMatrix();
    translate(width/2, height/2);

    beginShape();
    float r = random(30, 50);
    curveVertex(cos(slice*count) * r, sin(slice * count) * r);
    for (int i = 0; i < count; i++) {
      float angle = i * slice;
      float radius = random(30, 50);
      float x = cos(angle) * radius;
      float y = sin(angle) * radius;
      curveVertex(x, y);
      //ellipse(x, y, 10, 10);
    }
    curveVertex(cos(0) * r, sin(0) * r);
    curveVertex(cos(slice) * r, sin(slice) * r);
    endShape();

    popMatrix();
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
