import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import netP5.*; 
import oscP5.*; 

import java.util.HashMap; 
import java.util.List; 
import java.util.ArrayList; 
import java.util.Arrays; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 
import java.lang.reflect.*;

public class WindowMergeApp extends PApplet {
	
	List<List<SketchShit>> sketches = new ArrayList<>();
    int currentIndex;
    int _runningIndex;
    int loopIndex[] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    int loopCount = 0;
    PApplet sketch;
    Boolean presentation = false;
    
    PFont mono = null;
    OscP5 oscP5 = null;
    int patternnr = 0;
    int patternrow = 0;
    int colors[] = { color(70, 35, 122), color(61, 220, 151), color(243, 167, 18), color(1, 186, 239), color(255, 0, 127) };
    int strobe = 0;
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
    
    NetAddress lichttafel = new NetAddress("10.2.4.29",7700);
    
    String[] lines = null;
    float totalLength = 0;
    int counter = 0;

    String cwd = "/Users/machiel/Work/Git/ProcessingShowcase/data";
    
	public void setup()
	{
		if (mono == null)  mono = createFont(cwd+"/"+"static/RobotoMono-SemiBold.ttf", 64);
		if (oscP5 == null) oscP5 = new OscP5(this,6200);
		/*
		if (lines == null) 
		{
			lines = loadStrings("txts");
		    textSize(64);
			for (int i = 0 ; i < lines.length; i++) 
			{
			    totalLength += textWidth(lines[i]);
            }
		}
		*/
		SketchShit sht = getShit();
		sketch = sht.sketch;
		_runningIndex = currentIndex;
		if (sketch.g== null )
		{
			sketch.g = this.g;
			sketch.setSize(this.width, this.height);
			
			println("--> WindowsMergeApp: "+this.sketchPath());
			sketch.calcSketchPath();
			//sketch.sketchPath(this.sketchPath());
			println("--> WindowsMergeApp:sketch "+sketch.sketchPath());

			// is protected unfortunately so we can't use
			// frameRate() methods
			//sketch.surface = this.getSurface;
		}
		if (sketch.width != this.width || sketch.height != this.height )
		{
			sketch.setSize(this.width, this.height);
		}
		sketch.resetMatrix();
		colorMode(RGB, 255, 255, 255);
		sketch.colorMode(RGB, 255, 255, 255);
		rectMode(CORNER);
		sketch.rectMode(CORNER);
		imageMode(CORNER);
		sketch.imageMode(CORNER);
		ellipseMode(CENTER);
		sketch.ellipseMode(CENTER);
		textAlign(LEFT);
		sketch.textAlign(LEFT);
		blendMode(BLEND);
		sketch.blendMode(BLEND);
		fill(255);
		sketch.fill(255);
		stroke(0);
		sketch.stroke(0);
		strokeWeight(1);
		sketch.strokeWeight(1);
		clear();
		sketch.clear();
        try 
        {
            sketch.setup();
        }
        catch (Exception e)
        {
            println(e);
            e.printStackTrace();
        }
	}

	public void postEvent(processing.event.Event pe) 
	{
		if (sketch != null) sketch.postEvent(pe);
	}
	
	public void draw_lines()
	{
	  stroke(0,0,0);
	  for (int i=0;i<72;i+=8)
	  {
	    line(0,height-i, width,height-i);
	  }
	  textSize(64);
	  textAlign(LEFT);
	  fill(224);
	  float spaceW = textWidth(" ");
	  float xpos = width-(counter*2%PApplet.parseInt(totalLength)); 
	  for (int i=0;i<lines.length;i++)
	  {
	    if (lines[i].length() == 0)
	    {
	      xpos += 64;
	    }
	    float w = textWidth(lines[i]);
	    if (xpos + w > 0 && xpos < width)
	      text(lines[i], xpos, height-16);
	    xpos = xpos + w + spaceW;
	  }
	}
	
	public void draw()
	{
		frame.setLocation(1, 1);
		try {
			pushMatrix();
			sketch.handleDraw();
			popMatrix();
		}
		catch (Exception e)
		{
			println(e.getMessage());
		}
		
		g.beginDraw();
		//draw_lines();
		/*stroke(0);
		for (int i = 0; i < height; i+=3)
		{
		    line(0, i, width, i);
		}*/
		//textFont(mono);
		//text("pattern: "+ currentIndex, 10,25);
		/*if (strobe != patternrow )
		{
			OscMessage lamp1on = new OscMessage("/lamp1");
			lamp1on.add(255); // add an int to the osc message 

			OscMessage lamp1off = new OscMessage("/lamp1");
			lamp1off.add(0); // add an int to the osc message

			if (strobe == -1) { strobe =patternrow; background(colors[1]); oscP5.send(lamp1off, lichttafel); }
			else if (channel4instr == 28 && channel1instr == 28 && channel2instr == 28 && channel3instr == 28) { strobe =-1; background(colors[1]); oscP5.send(lamp1on, lichttafel); }
	        else if (channel4instr == 28 && channel1instr == 28 && channel2instr == 28) { strobe = -1; background(colors[2]); oscP5.send(lamp1on, lichttafel);}
		    else if (channel4instr == 28 && channel1instr == 28) { strobe = -1; background(colors[3]); oscP5.send(lamp1on, lichttafel);}
		    else if (channel4instr == 28) { strobe = -1; background(colors[4]); oscP5.send(lamp1on, lichttafel);}
	        else if (channel4instr == 28 || channel1instr == 28 || channel2instr == 28 || channel3instr == 28) { strobe = -1; background(colors[0]); oscP5.send(lamp1on, lichttafel);}
		}*/
		
		g.endDraw();
		counter++;
		
		if ( currentIndex != _runningIndex)
		{
			if ( currentIndex == -1 )
			{
				build();
			}
			if ( getShit()  == null ) 
			{
				_runningIndex = currentIndex; // just continue if next is null
			}
			else frameCount = -1; // triggers setup
		}
	}	
		
	public void frameResized(int w, int h)
	{
		println(w,h);
	}
	
	public void oscEvent(OscMessage message) 
	{
		if (message.checkAddrPattern("/patternevent" ) )
        {
		    /* print the address pattern and the typetag of the received OscMessage */
		    //print("### received an osc message.");
		    //print(" addrpattern: "+message.addrPattern());
		    //println(" typetag: "+message.typetag());
		    
		    //songposition = message.get(0).intValue();
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
		    //System.out.println(patternnr);
		    int idxNr = patternnr % sketches.size();  // sketches array determines maximum index nr
		    if ( currentIndex != idxNr )
			{
				loopCount++;
				loopIndex[idxNr]++;
			}
			currentIndex = idxNr;
		}
		
		try
		{
	      Method oscEvent = sketch.getClass().getMethod("oscEvent",
	                        new Class[] { OscMessage.class });
	      oscEvent.invoke(sketch, message );
	    } 
		catch (Exception e) {
	    	//System.out.println("No modRowEvent found in the sketch!");
	    	// no such method, or an error.. which is fine, just ignore
	    }

	}
	
	public void build()
	{
		sketches.clear();
		currentIndex = 0;


		//hack at position 0 (cannot be null)
        sketches.add(Arrays.asList(new SketchShit("pattern28.pde", new pattern28())));
        sketches.add(null); //1
        sketches.add(null); //2
        sketches.add(null); //3
        sketches.add(null); //4
        sketches.add(Arrays.asList(new SketchShit("pattern5.pde", new pattern5())));
        sketches.add(null); //6
        sketches.add(Arrays.asList(new SketchShit("pattern7.pde", new pattern7())));
        sketches.add(null); //8
        sketches.add(Arrays.asList(new SketchShit("pattern9.pde", new pattern9())));
        // 10
        sketches.add(null); //10
        sketches.add(Arrays.asList(new SketchShit("pattern11.pde", new pattern11())));
        sketches.add(null); //12
        sketches.add(null); //13
        sketches.add(Arrays.asList(new SketchShit("pattern14.pde", new pattern14())));
        sketches.add(Arrays.asList(new SketchShit("pattern15.pde", new pattern15())));
        sketches.add(null); //16
        sketches.add(Arrays.asList(new SketchShit("blue_alien.pde", new blue_alien())));        // 17
        sketches.add(Arrays.asList(new SketchShit("pattern18.pde", new pattern18())));
        sketches.add(Arrays.asList(new SketchShit("pattern19.pde", new pattern19())));
        // 20 
        sketches.add(Arrays.asList(new SketchShit("pattern_20.pde", new pattern_20())));
        sketches.add(Arrays.asList(new SketchShit("pattern21.pde", new pattern21())));
        sketches.add(Arrays.asList(new SketchShit("pattern22.pde", new pattern22())));
        sketches.add(Arrays.asList(new SketchShit("pattern29.pde", new pattern29()))); //23
        sketches.add(Arrays.asList(new SketchShit("pattern24.pde", new pattern24())));
        sketches.add(Arrays.asList(new SketchShit("pattern25.pde", new pattern25())));
        sketches.add(Arrays.asList(new SketchShit("pattern26.pde", new pattern26())));
        sketches.add(Arrays.asList(new SketchShit("pattern_27.pde", new pattern_27())));
        sketches.add(Arrays.asList(new SketchShit("pattern28.pde", new pattern28())));
        sketches.add(null); //29
        sketches.add(Arrays.asList(new SketchShit("pattern_40.pde", new pattern_40()))); //30
        // 30 
        sketches.add(Arrays.asList(new SketchShit("paulinas_c_flight_demo_mika_de_cloe.pde", new paulinas_c_flight_demo_mika_de_cloe())));
        sketches.add(null); //32
        sketches.add(Arrays.asList(new SketchShit("paulinas_c_flight_demo_mika_de_cloe.pde", new paulinas_c_flight_demo_mika_de_cloe())));
        sketches.add(Arrays.asList(new SketchShit("pattern34.pde", new pattern34()))); //34
        sketches.add(Arrays.asList(new SketchShit("pattern34.pde", new pattern34()))); //35
        sketches.add(Arrays.asList(new SketchShit("pattern_36.pde", new pattern_36())));
        sketches.add(null); //37
        sketches.add(null); //38

	}
	
	public SketchShit getShit()
	{
		if (currentIndex > sketches.size() - 1 )
			currentIndex = currentIndex % sketches.size();
		List<SketchShit> lsht = sketches.get(currentIndex);
		if (lsht == null) return null;
		return lsht.get(loopIndex[currentIndex] % lsht.size());
	}
	
	public void settings() 
	{  
		if ( presentation )
			fullScreen(2);
		else
			size(720, 480);
		build();
	}
	
	static public void main(String[] passedArgs) 
	{
		String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "MergeApp" };
	    if (passedArgs != null) {
	      PApplet.main(concat(appletArgs, passedArgs));
	    } else {
	      PApplet.main(appletArgs);
	    }
	  }
}
