int rectSize=90;
int space=5;
int xPos=30, yPos=102;
int xPos1=30, yPos1=202;
int xPos2=30, yPos2=302;
int xPos3=30, yPos3=402;
int xPos4=30, yPos4=502;

void setup() {
  size(720, 480);
  background(255);
}

void draw() {
  background(0);
  fill(0,0,255);
  rect(yPos, 420- xPos, rectSize, rectSize);
  xPos=xPos+rectSize;
  xPos%=(width-rectSize);
  
  fill(0,0,255);
    rect(yPos1, 420- xPos1, rectSize, rectSize);
  xPos1=xPos1+rectSize;
  xPos1%=(width-rectSize);
  
    fill(0,0,255);
    rect(yPos2, 420- xPos2, rectSize, rectSize);
  xPos2=xPos2+rectSize;
  xPos2%=(width-rectSize);
  
      fill(0,0,255);
    rect(yPos3, 420- xPos3, rectSize, rectSize);
  xPos3=xPos3+rectSize;
  xPos3%=(width-rectSize);
  
        fill(0,0,255);
    rect(yPos4, 420- xPos4, rectSize, rectSize);
  xPos4=xPos4+rectSize;
  xPos4%=(width-rectSize);
}
