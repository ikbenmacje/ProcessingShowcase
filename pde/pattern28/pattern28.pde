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

int strength = 220;
boolean reached28 = true;
boolean row60reached = false;

class Ball
{
  float x, y;
  float sx, sy;
  float r;
  int c;
  
  int pallette[] = { #bebebe, #565656, #ffffff, #838383, #3a3a3a };
  
  public Ball(float _x, float _y) {
    x = _x;
    y = _y;
    sx = random(-1,1);
    sy = random(-1,1);
    r = random(-0.1, 0.1);
    c = int(random(0,5));//color(random(0,255), random(0,255), random(0,255));
  }
  
  public float distanceTo( Ball other ) {
   float dx = abs(other.x - this.x);
   float dy = abs(other.y - this.y);
   return sqrt(dx * dx + dy * dy); 
  }
  
  public void move() {
   x += sx;
   y += sy;
   
   if ( x < 20 || x > width - 20 ) sx *= -1;
   if ( y < 20 || y > height - 20 ) sy *= -1;
  }
  
  public void slow(float factor) {
    sx *= factor;
    sy *= factor;
    r *= factor;
  }
  
  public void explode(int cx, int cy) {
    sx = ( x - cx ) * .1;
    sy = ( y - cy ) * .1;
  }
  
  public void render(PGraphics target) {
    if (patternnr == 26 && channel1instr != 0)
    {
      println(patternrow);
      c = int(random(0,5));
    }
    
   if ( reached28 ) {
     if ( !row60reached ) 
       target.noStroke();
     else
       target.stroke(0);
     target.fill(#80ff80);
   }
   else {
     target.stroke(0);
     target.fill(pallette[c]);
   }
   target.rectMode(CENTER);
   
   target.pushMatrix();
     target.translate(x,y);
     target.rotate(frameCount*r);
     target.rect(0,0,40,40); 
   target.popMatrix();
  }
}

Ball[] balls = new Ball[100];
PGraphics pg, pg2;
float G = -10;

void setup() {
  size(720, 480);
  oscP5 = new OscP5(this,6200);
  
  pg = createGraphics(720, 480);
  pg2 = createGraphics(720, 480);

  init();
}

void init() {
  pg2.beginDraw();
  pg2.background(0);
  pg2.endDraw();
  
  pg.beginDraw();
  pg.background(0);
  pg.endDraw();
  
  G = -10;
  reached28 = true;
  row60reached = false;
  
  for( int i = 0; i < balls.length; ++i ) {
   balls[i] = new Ball(random(50, width-50), random(50, height-50)); 
  }
  
  for( int i = 0; i < 120; ++i ) {
   simulate(false); 
  }
}

void draw() {
  
  if ( patternrow == 0 && row60reached ) {
    //reset
    init();
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
  */
  
  pg.beginDraw();
  pg.image(pg2,0,0);
  
  if ( ( patternnr == 26 && patternrow == 0 ) || patternnr == 28 && ( !reached28 || channel2instr != 0 ) )
  {
    pg.push();
      pg.fill(255, 255, 255, 150);
    pg.rect(0, 0, width*2, height*2);
    pg.pop();
  }
  if ( patternnr == 28 && !reached28 ) {
      for( int i = 0; i < balls.length; ++i ) {
         balls[i].slow(.2);
         G *= .1;
      }
      
      reached28 = true;
      strength = 255;
  }
  else if (patternnr == 28 && patternrow == 60 ) {
     for( int i = 0; i < balls.length; ++i ) {
         balls[i].explode(width/2, height/2);
      }
      row60reached = true;
      pg.background(255);
  }
  
  simulate(true);
  
  pg.fill(0,0,0,20);
  pg.textSize(48);
  float w = pg.textWidth("The Matrix has you");
  pg.text("The Matrix has you", width/2 + random(-3,3) - w/2, height/2 + random(-3,3));
  pg.endDraw();
  
  if ( frameCount % 2 == 0 ) {
    image(pg, 0, 0);
  }
  else {
    pg2.beginDraw();
    if ( reached28 ) {
      if ( row60reached ) {
        pg2.tint(220);
      }
      else { 
        pg2.tint(254);
      }
    }
    else {
      pg2.tint(strength,240,strength);
    }
    pg2.image(pg,0,0);
    pg2.endDraw();
  }
}

void simulate(boolean doRender) {
 for( int i = 0; i < balls.length; ++i ) {
   for ( int j = 0; j < balls.length; ++j ) {
     if ( i == j ) continue;
     //calc pull based on distance
     float d = balls[i].distanceTo(balls[j]);
     if ( d < 20 ) d = 20;
     float nx = ( balls[i].x - balls[j].x ) / d;
     float ny = ( balls[i].y - balls[j].y ) / d;
     float pull = G / ( d * d );
     balls[i].sx += nx * pull;
     balls[i].sy += ny * pull;
   }
   
   balls[i].move();
   if ( doRender ) balls[i].render(pg);
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
    //println( feedback_formatted );
  }
}
