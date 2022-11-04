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

float a = 0;

void setup()
{
  size(720, 480);
  frameRate(60);
  oscP5 = new OscP5(this,6200);
    background(0);
  noStroke();
}

void draw() {
      filter(POSTERIZE, 255);
  ellipse(random(width), random(height), 0.1, 1000);
  
    if (channel4instr !=10 )
  filter(BLUR, 2);

  
//////////////////////////////////////////////////////////////////////////////////////////////////////
    if (channel1instr != 10 )
    {
              stroke(100, 100, 100); // R, G, B
        line(360, 240, random(1000), random(1000) );
    }
        if (channel1instr != 1 )
        {
                      stroke(255, random(255), 255); // R, G, 
        line(360, 240, random(1000), random(1000) );
        
    }
    
    if (channel2instr != 1000 )
    {
                stroke(255, 255, 255); // R, G, B
          line(360, 240, random(1000), random(1000) );
    }
    if (channel3instr != 0 )
    {
                stroke(165, 165, 165); // R, G, B
          line(360, 240, random(1000), random(10) );
    }
        if (channel3instr != 0 )
        {
            loadPixels();
  float n = (channel3instr * 10.0) / width;
  float w = 16.0;         // 2D space width
  float h = 16.0;         // 2D space height
  float dx = w / width;    // Increment x this amount per pixel
  float dy = h / height;   // Increment y this amount per pixel
  float x = -w/2;          // Start x at -1 * width / 2
  for (int i = 0; i < width; i++) {
    float y = -h/2;        // Start y at -1 * height / 2
    for (int j = 0; j < height; j++) {
      float r = sqrt((x*x) + (y*y));    // Convert cartesian to polar
      float theta = atan2(y,x);         // Convert cartesian to polar
      // Compute 2D polar coordinate function
      float val = sin(n*cos(r) + 5 * theta);           // Results in a value between -1 and 1
      //float val = cos(r);                            // Another simple function
      //float val = sin(theta);                        // Another simple function
      // Map resulting vale to grayscale value
      pixels[i+j*width] = color((val + 1.0) * 255.0/2.0);     // Scale to between 0 and 255
      y += dy;                // Increment y
    }
    x += dx;                  // Increment x
  }
  updatePixels();

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
