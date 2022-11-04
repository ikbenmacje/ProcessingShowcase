
void setup(){
  size (720,480);
  
}
int k = 0;
int n = 0;
int d =1;

void draw(){ 
k= k +1 ;

n=n+d;

if (k>10){k=0;d=0-d;}
 //{ for(int i=0; i<100; i++){
    
cat1(0,n,n);

//delay(1000);

//cat1(0,10);

//delay(1000);
}


  
void cat1(int x, int y, int z){ 
  background(162,255,148);
  
  noStroke();
  
  fill(0,0,0);
  rect(368-10-z,441-10,50,50);
  
  
  //oor links
  triangle(343+x,166+y,141+x,80+y,193+x,195+y);
  fill(100,100,100);
  
  
  //oor rechts
   triangle(380+x,236+y,307+x,140+y,458+x,105+y);
  
    //hoofd
   
   fill(251,251,251);
   circle (287+x,235+y,195);
   
   //ogen
   fill(0,0,0);
   circle(223+x,212+y,16);
   
   fill(0,0,0);
   circle(351+x,216+y,18);
   
   //mond
   fill(4,2,0);
   rect(251,230+y/2,53,5);
   // triangle(285,279,274,266,289,259);
   
 
   //poot links achter
  fill(100,100,100);
  ellipse(336,436,40,23);
  
  //pla teen
  
  //fill(0,0,0)
  ellipse(394-z,455,41,25);
  
  
  //poot links voor
  
  ellipse(405,401,30,42);
   ellipse(405-z,430,30,42);
  
  //plv teen
    //fill(0,0,0)
 
 ellipse(491,441,46,-21);



    //poot rechts achter
   fill(243,243,243);
  ellipse(547,446,39,18);
  
  //pra teen
 // fill(0,0,0)
 ellipse(497,385,39,129);
     
     
     
     
  //poot rechts voor
  fill(0,0,0);
  ellipse(554,382,33,129);
  
  //prv teen
  //fill(0,0,0)
 
  ellipse(344,382,33,129);
  
   //lichaam
   fill(251,249,249);
  ellipse(437+x,318+y,307+x,134+y);
  
  //staart
  fill(11,1,1);
  ellipse(563+x,171+y,39+x,245+y);
 
  
}
  
