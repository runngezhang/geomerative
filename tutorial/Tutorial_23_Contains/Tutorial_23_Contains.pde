import processing.xml.*;
import processing.opengl.*;
import geomerative.*;

RGroup grp;

boolean ignoringStyles = false;

void setup(){
  size(600, 600);
  smooth();
  g.smooth = true; 

  // VERY IMPORTANT: Allways initialize the library before using it
  RG.init(this);
  RG.ignoreStyles(ignoringStyles);
  
  RCommand.setSegmentator(RG.ADAPTATIVE);
   
  grp = RG.loadSVG("mapaAzimutal.svg");
  grp.centerIn(g, 100, 1, 1);
}

void draw(){
  translate(width/2, height/2);
  
  background(255);
  stroke(0);
  noFill();
  
  grp.draw();
  RPoint p = new RPoint(mouseX-width/2, mouseY-height/2);
  for(int i=0;i<grp.countElements();i++){
    if(grp.elements[i].contains(p)){
       RG.ignoreStyles(true);
       fill(0,100,255,250);
       noStroke();
       grp.elements[i].draw();
       RG.ignoreStyles(ignoringStyles);
    }
  }
}

void mousePressed(){
  ignoringStyles = !ignoringStyles;
  RG.ignoreStyles(ignoringStyles);
}