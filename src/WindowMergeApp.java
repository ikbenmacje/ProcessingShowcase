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
    int loopIndex[] = {0,0,0,0,0,0,0,0,0};
    int loopCount = 0;
    PApplet sketch;
    Boolean presentation = false;
    
    int go_played;
    int go_draw_frame_count = 0;
    float choose = 0.0f;
    
    OscP5 oscP5 = null;
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
    
	public void setup()
	{
		if (oscP5 == null) oscP5 = new OscP5(this,6200);
		SketchShit sht = getShit();
		sketch = sht.sketch;
		_runningIndex = currentIndex;
		if (sketch.g== null )
		{
			sketch.g = this.g;
			sketch.setSize(this.width, this.height);
			
			sketch.sketchPath(this.sketchPath());
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
		rectMode(CORNER);
		textAlign(LEFT);
		clear();
        try 
        {
            sketch.setup();
        }
        catch (Exception e)
        {
            println(e);
            e.printStackTrace();
        }
        go_played = 0;
	}

	public void postEvent(processing.event.Event pe) 
	{
		if (sketch != null) sketch.postEvent(pe);
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
		go_draw_for(15);
		g.endDraw();
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
	
	public void go_draw_for(int frames) // frames = het aantal frames dat je wilt tekenen
	{
	  if ( go_played == 1 )
	  {
	    go_draw_frame_count = frames;
	    go_played = 0;
	    choose = random(1);
	  }
	  if (go_draw_frame_count != 0 )
	  {
	    //
	    // Vanaf hier kun je je eigen draw dingen doen
	    //
		if ( choose > 0.5 )
		{
			go_bleep();
		}
		else
		{
			go_gogov2();
		}
	    
	    // einde draw dingen
	    //
	    go_draw_frame_count = go_draw_frame_count - 1;
	  }
	}
	
	public void go_bleep()
	{
	  fill(121, 134, 210);
	  text("GO", 160, 140);
	    textSize(100);
	    fill(254, 237, 246);
	  text("GO", 360, 240);
	  textSize(200);
	      fill(255, 83, 191);
	  text("GO", 560, 40);
	  textSize(50);
	    fill(255, 83, 191);
	  text("GO", 120, 290);
	    textSize(100);
	    fill(121, 134, 210);
	  text("GO", 700, 300);
	  textSize(200);
	      fill(254, 237, 246);
	  text("GO", 230, 60);
	  textSize(50);
	}
	
	public void go_gogov2()
	{
	    fill(121,134,210);
	    text("GO",-30,550);
	    textSize(400);
	    fill(255,83,191);
	    
	    text("GO",330,260);
	    fill(254,237,246);
	    
	    text("GO",100,380);
	}
		
	public void frameResized(int w, int h)
	{
		println(w,h);
	}
	
	public void modRowEvent( int channel, int instrument, int note )
	{
		try
		{
	      Method modRowEvent = sketch.getClass().getMethod("modRowEvent",
                            new Class[] { int.class, int.class, int.class });
	      modRowEvent.invoke(sketch, channel, instrument, note );
	    } catch (Exception e) {
	    	//System.out.println("No modRowEvent found in the sketch!");
	    	// no such method, or an error.. which is fine, just ignore
	    }
		//  We reageren alleen op instrument 2
	    if (instrument == 2)
		{
		    println(channel +":"+ instrument +":"+ note);
		    //  Whatever instrument is being played just set a background color from the note played.
		    go_played = 1;
		}
	}
	
	public void modPatternEvent( int pattern, int position )
	{
		System.out.println("pattern " + pattern + " , position " + position );
		if ( currentIndex != pattern )
		{
			if ( pattern == 8 )
			{
				loopCount++;
				if (loopCount >= sketches.get(5).size() -1 ) System.exit(0);
			}
			else if (pattern == 4 ) // we're coming from position 6
			{
				loopIndex[2]++;
				loopIndex[3]++;
			}
			else if ( pattern == 7 )
			{
				loopIndex[4]++;
				loopIndex[5]++;
				loopIndex[2]++;
				loopIndex[3]++;
			}
			else if (pattern != 2 && pattern != 3 && pattern != 4 && pattern != 5  )
			{
				loopIndex[pattern]++;
			}
		}
		currentIndex = pattern;
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
		    int pattern = message.get(1).intValue();
		    patternrow = message.get(2).intValue();
		    channel1note = message.get(3).intValue();
		    channel1instr = message.get(4).intValue();
		    channel1effect = message.get(5).charValue();
		    channel1effect_param = message.get(6).stringValue();
			//if (channel1note != 0)
				this.modRowEvent(0,channel1instr, channel1note);
		    channel2note = message.get(7).intValue();
		    channel2instr = message.get(8).intValue();
		    channel2effect = message.get(9).charValue();
		    channel2effect_param = message.get(10).stringValue();    
			//if (channel2note != 0)
				this.modRowEvent(1,channel2instr, channel2note);
		    channel3note = message.get(11).intValue();
		    channel3instr = message.get(12).intValue();
		    channel3effect = message.get(13).charValue();
		    channel3effect_param = message.get(14).stringValue();
			//if (channel3note != 0)
				this.modRowEvent(2,channel3instr, channel3note);
		    channel4note = message.get(15).intValue();;
		    channel4instr = message.get(16).intValue();
		    channel4effect = message.get(17).charValue();
		    channel4effect_param = message.get(18).stringValue();
			//if (channel4note != 0)
				this.modRowEvent(3,channel4instr, channel4note);

		    //System.out.println(pattern);
		    //patternrow = message.get(2).intValue();
		    if ( currentIndex != pattern )
			{
				loopCount++;
				loopIndex[pattern]++;
			}
			currentIndex = pattern;			
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
		// order is the pattern number!!! (78+51=129)
		sketches.add(Arrays.asList(new SketchShit("sketch_200610a_maartenastridagnes.pde", new sketch_200610a_maartenastridagnes())));
		sketches.add(null);
		sketches.add(Arrays.asList(new SketchShit("Skillslabfinal_part_2_v2.pde", new Skillslabfinal_part_2_v2()), 
				                   new SketchShit("part2.pde", new part2()),
				                   new SketchShit("Dave_Haverkort_skillslab_patt2_BYOB.pde", new Dave_Haverkort_skillslab_patt2_BYOB()),
				                   new SketchShit("Dave_Haverkort_skillslab_patt2_GO_GO.pde", new Dave_Haverkort_skillslab_patt2_GO_GO())
								));
		sketches.add(Arrays.asList(new SketchShit("Skillslabfinal_part_3_v2.pde", new Skillslabfinal_part_3_v2()), 
								   new SketchShit("part3.pde", new part3()),
								   new SketchShit("Dave_Haverkort_skillslab_patt3_BYOB.pde", new Dave_Haverkort_skillslab_patt3_BYOB()),
								   new SketchShit("Dave_Haverkort_skillslab_patt3_GO_GO.pde", new Dave_Haverkort_skillslab_patt3_GO_GO())
						   		));
		sketches.add(Arrays.asList(new SketchShit("MuziekGo.pde", new MuziekGo()),
								   new SketchShit("muziekding2.pde", new muziekding2()),
								   new SketchShit("Eind_visual_Skillslab_4.pde", new Eind_visual_Skillslab_4()),
								   new SketchShit("skillslab_sketch_patroon45_susanne.pde", new skillslab_sketch_patroon45_susanne())
						));
		sketches.add(Arrays.asList(new SketchShit("Patt5_Bloem.pde", new Patt5_Bloem()),
				                   new SketchShit("MuziekBlokken.pde", new MuziekBlokken()),
				                   new SketchShit("Eind_visual_Skillslab_5.pde", new Eind_visual_Skillslab_5()),
				                   new SketchShit("skillslab_sketch_samengevoegd_patroon5.pde", new skillslab_sketch_samengevoegd_patroon5()),
								   new SketchShit("Patt5_3.pde", new Patt5_3())
						));
		sketches.add(null);
		sketches.add(Arrays.asList(new SketchShit("credits.pde", new credits())));
		sketches.add(Arrays.asList(new SketchShit("sketch_200610a_maartenastridagnes.pde", new sketch_200610a_maartenastridagnes())));
	}
	
	public SketchShit getShit()
	{
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
