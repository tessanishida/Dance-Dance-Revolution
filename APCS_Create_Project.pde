// APCS Create Project


// Using functions from the processing reference library and minim library
// PShape: https://processing.org/reference/PShape.html
// Minim: http://code.compartmental.net/minim/beatdetect_class_beatdetect.html


// Declare Variables 
int score = 0;

PShape leftArrow;  // declares arrows as PShape
PShape downArrow;
PShape upArrow;
PShape rightArrow;

PShape leftArrowOrigin;
PShape downArrowOrigin;
PShape upArrowOrigin;
PShape rightArrowOrigin;

PShape leftArrowTop;
PShape downArrowTop;
PShape upArrowTop;
PShape rightArrowTop;

boolean leftArrowReset = false;   // when the arrow needs to go back down
boolean downArrowReset = false;
boolean upArrowReset = false;
boolean rightArrowReset = false;


int time = 0;

PFont font;

import ddf.minim.*; //imports minim library
import ddf.minim.analysis.*;
Minim minim;
BeatDetect beat;
AudioPlayer musicMin;

float speed = 0;

boolean once = true;

boolean trigger = false;
boolean drawLeft = false;
boolean drawDown = false; 
boolean drawUp = false;
boolean drawRight = false;


void setup () {
  
  background (0); // sets up canvas
  size (800, 800);
  
  font = createFont ("AdobeGothicStd-Bold",50);
 
  
  // Create shape of arrows at the top of canvas
   
   leftArrowTop = createShape ();
    leftArrowTop.beginShape (); 
    leftArrowTop.vertex (50, 100);
    leftArrowTop.vertex (100, 150);
    leftArrowTop.vertex (100, 125);
    leftArrowTop.vertex (150, 125);
    leftArrowTop.vertex (150, 75);
    leftArrowTop.vertex (100, 75);
    leftArrowTop.vertex (100, 50);
    leftArrowTop.endShape (CLOSE);
    
   downArrowTop = createShape ();
    downArrowTop.beginShape (); 
    downArrowTop.vertex (300, 150);
    downArrowTop.vertex (250, 100);
    downArrowTop.vertex (275, 100);
    downArrowTop.vertex (275, 50);
    downArrowTop.vertex (325, 50);
    downArrowTop.vertex (325, 100);
    downArrowTop.vertex (350, 100);
    downArrowTop.endShape (CLOSE);
  
   upArrowTop = createShape ();
    upArrowTop.beginShape (); 
    upArrowTop.vertex (500, 50);
    upArrowTop.vertex (550, 100);
    upArrowTop.vertex (525, 100);
    upArrowTop.vertex (525, 150);
    upArrowTop.vertex (475, 150);
    upArrowTop.vertex (475, 100);
    upArrowTop.vertex (450, 100);
    upArrowTop.endShape (CLOSE);
    
   rightArrowTop = createShape ();
    rightArrowTop.beginShape (); 
    rightArrowTop.vertex (750, 100);
    rightArrowTop.vertex (700, 150);
    rightArrowTop.vertex (700, 125);
    rightArrowTop.vertex (650, 125);
    rightArrowTop.vertex (650, 75);
    rightArrowTop.vertex (700, 75);
    rightArrowTop.vertex (700, 50);
    rightArrowTop.endShape (CLOSE);
    
    

  // Create shape of moving arrows 
  
   leftArrow = createShape (); 
    leftArrow.beginShape (); 
    leftArrow.vertex (100,900);
    leftArrow.vertex (50,850);
    leftArrow.vertex (100,800);
    leftArrow.vertex (100,825);
    leftArrow.vertex (150,825);
    leftArrow.vertex (150,875);
    leftArrow.vertex (100,875);
    leftArrow.endShape (CLOSE);
    
   leftArrowOrigin = createShape(); // saves original location
    leftArrowOrigin.beginShape (); 
    leftArrowOrigin.vertex (100,900);
    leftArrowOrigin.vertex (50,850);
    leftArrowOrigin.vertex (100,800);
    leftArrowOrigin.vertex (100,825);
    leftArrowOrigin.vertex (150,825);
    leftArrowOrigin.vertex (150,875);
    leftArrowOrigin.vertex (100,875);
    leftArrowOrigin.endShape (CLOSE);
    
   
      
   downArrow = createShape (); 
    downArrow.beginShape (); 
    downArrow.vertex (300,900);
    downArrow.vertex (250,850);
    downArrow.vertex (275,850);
    downArrow.vertex (275,800);
    downArrow.vertex (325,800);
    downArrow.vertex (325,850);
    downArrow.vertex (350,850);
    downArrow.endShape (CLOSE);
    
   downArrowOrigin = createShape ();
    downArrowOrigin.beginShape (); 
    downArrowOrigin.vertex (300,900);
    downArrowOrigin.vertex (250,850);
    downArrowOrigin.vertex (275,850);
    downArrowOrigin.vertex (275,800);
    downArrowOrigin.vertex (325,800);
    downArrowOrigin.vertex (325,850);
    downArrowOrigin.vertex (350,850);
    downArrowOrigin.endShape (CLOSE);
    
    
    
   upArrow = createShape (); 
    upArrow.beginShape (); 
    upArrow.vertex (475,900);
    upArrow.vertex (475,850);
    upArrow.vertex (450,850);
    upArrow.vertex (500,800);
    upArrow.vertex (550,850);
    upArrow.vertex (525,850);
    upArrow.vertex (525,900);
    upArrow.endShape (CLOSE);
    
   upArrowOrigin = createShape();
    upArrowOrigin.beginShape (); 
    upArrowOrigin.vertex (475,900);
    upArrowOrigin.vertex (475,850);
    upArrowOrigin.vertex (450,850);
    upArrowOrigin.vertex (500,800);
    upArrowOrigin.vertex (550,850);
    upArrowOrigin.vertex (525,850);
    upArrowOrigin.vertex (525,900);
    upArrowOrigin.endShape (CLOSE);
    
    
    
    
   rightArrow = createShape (); 
    rightArrow.beginShape ();
    rightArrow.vertex (700,900);
    rightArrow.vertex (700,875);
    rightArrow.vertex (650,875);
    rightArrow.vertex (650,825);
    rightArrow.vertex (700,825);
    rightArrow.vertex (700,800);
    rightArrow.vertex (750,850);
    rightArrow.endShape (CLOSE);
    
   rightArrowOrigin = createShape ();
    rightArrowOrigin.beginShape ();
    rightArrowOrigin.vertex (700,900);
    rightArrowOrigin.vertex (700,875);
    rightArrowOrigin.vertex (650,875);
    rightArrowOrigin.vertex (650,825);
    rightArrowOrigin.vertex (700,825);
    rightArrowOrigin.vertex (700,800);
    rightArrowOrigin.vertex (750,850);
    rightArrowOrigin.endShape (CLOSE);
    
    

  minim = new Minim (this);
  musicMin = minim.loadFile("song.mp3"); // loads song to use in minim
  musicMin.play ();
  time = millis (); //record start
  beat = new BeatDetect (); // a beat detection object
}


void draw () {
  
  //collects the time differences between beats
  beat.detect(musicMin.mix);
  if (beat.isOnset() && once == true)
    {
       speed = millis () - time;
       speed = speed/1000;
       beat.setSensitivity(600);
       drawArrow(int(random(1,5)));
       once = false;
    }
    
    // determines the how far up the arrow should move in each frame
    if (speed != 0) 
    {
      speed = 750/(speed*3)/60;
    }
   
  
    
  background (0);
  
  
  shape (leftArrowTop,0,0);
  shape (downArrowTop,0,0);
  shape (upArrowTop,0,0);
  shape (rightArrowTop,0,0);
  
  
  // Arrows randomly move up the screen
 
  // left arrow
  for (int i = 0; i < leftArrow.getVertexCount(); i++) // updates the vertcies of left arrow     
   { 
     if (drawLeft == true)
     {
       leftArrow.setVertex (i, move(leftArrow.getVertex(i)));  // sets new vertex
     }
    
    if (keyPressed) // if left arrow key is pressed when the arrow reaches the top...
    { 
      if (key == CODED) 
      {
        if (keyCode == LEFT && leftArrow.getVertex(0).y>100 && leftArrow.getVertex(0).y<200) 
        {
          score(leftArrowTop);
          leftArrowReset = true;
        } 
      }
    }
    
    if (leftArrow.getVertex(0).y <= 0) // if the arrow moves off the canvas it needs to go to the bottom
    { 
      leftArrowReset = true;
    }
    
    if (leftArrowReset == true) // if the arrow needs to go to the bottom
    {   
      // moves arrow down to a original position
      leftArrow.setVertex (i, leftArrowOrigin.getVertex(i));
      drawLeft = false;
      trigger = true;
    }
  } // end of for loop
  
  leftArrowReset = false;
  
     if (millis() >= time + 500) // changes arrow at the top back to white
     {
      leftArrowTop.setFill (255);
     }
     
  leftArrow.setFill (#F0D90C);   
  shape (leftArrow, 0, 0); // draws left arrow
  

  // down arrow
  for (int i = 0; i < downArrow.getVertexCount(); i++)    
  {
     if (drawDown == true)
     {
       downArrow.setVertex (i, move(downArrow.getVertex(i)));
     }
    
    if (keyPressed) 
    {
      if (key == CODED) 
      {
        if (keyCode == DOWN && downArrow.getVertex(0).y>100 && downArrow.getVertex(0).y<200) 
        {
          score(downArrowTop);
          downArrowReset = true;
        } 
      }
    }
    
    if (downArrow.getVertex(0).y <= 0) 
    {
      downArrowReset = true;
    }
    
    if (downArrowReset == true) 
    {   
      downArrow.setVertex (i, downArrowOrigin.getVertex(i));
      drawDown = false;
      trigger = true;
    }
  }// end of for loop
  
  downArrowReset = false;
  
     if (millis() >= time + 500) 
     {
      downArrowTop.setFill (255);
     }
  
  downArrow.setFill (#F0D90C);   
  shape (downArrow, 0, 0); // draws down arrow
  
  
  
  // up arrow
  for (int i = 0; i < upArrow.getVertexCount(); i++)   
  {
    if (drawUp == true)
    {
      upArrow.setVertex (i, move(upArrow.getVertex(i)));
    }
    
    if (keyPressed) 
    {
      if (key == CODED) 
      {
        if (keyCode == UP && upArrow.getVertex(0).y>100 && upArrow.getVertex(0).y<200) 
        {
          score(upArrowTop);
          upArrowReset = true;
        } 
      }
    }
    
    if (upArrow.getVertex(0).y <= 0) 
    {
      upArrowReset = true;
    }
    
    if (upArrowReset == true) 
    {   
      upArrow.setVertex (i, upArrowOrigin.getVertex(i));
      drawUp = false;
      trigger = true;
    }
  } // end of for loop
 
  upArrowReset = false;
  
   if (millis() >= time + 500) 
     {
      upArrowTop.setFill (255);
     }
 
  upArrow.setFill (#F0D90C);
  shape (upArrow, 0, 0); // draws up arrow



  // right arrow
  for (int i = 0; i < rightArrow.getVertexCount(); i++)      
  {
    if (drawRight == true)
    {
      rightArrow.setVertex (i, move(rightArrow.getVertex(i)));
    }
    
    if (keyPressed) 
    {
      if (key == CODED) 
      {
        if (keyCode == RIGHT && rightArrow.getVertex(0).y>100 && rightArrow.getVertex(0).y<200) 
        {
          score(rightArrowTop);
          rightArrowReset = true;
        }
      }
    }
    
    if (rightArrow.getVertex(0).y <= 0) 
    {
      rightArrowReset = true;
    }
    
    if (rightArrowReset == true) 
    {   
      rightArrow.setVertex (i, rightArrowOrigin.getVertex(i));
      drawRight = false;
      trigger = true;
    }
  } //end of for loop
  
  rightArrowReset = false;
  
   if (millis() >= time + 500) 
     {
      rightArrowTop.setFill (255);
     }
 
  rightArrow.setFill (#F0D90C);
  shape (rightArrow, 0, 0); // draws right arrow
  
  if (trigger == true)
    {
      drawArrow(int(random(1,5)));
      trigger = false; 
    }


  // Display score
  fill (#FA2898);
  textFont (font);
  textSize (50);
  textAlign (CENTER);
  text ("Score: " + score,400,725);

if (millis () > musicMin.length()) {  //clears background and displays final score when the song is finished
  background (0);
  fill (255);
  textFont (font);
  textSize (75);
  textAlign (CENTER,CENTER);
  text ("Final Score: " + score,400,400);
  }    
} // END OF DRAW


PVector move (PVector v)
  {
    v.y += -speed;
    if (v.y > 350 && v.y < 400)
    {
      trigger = true;
    }
    return v;
  }
  
void score (PShape s)
  {
    s.setFill (color(0, 255, 0)); // top arrow turns green
    score = score + 75; // add 75 to score
    time = millis(); // stores the time when the key was pressed
  }
  
void drawArrow (int i)
  {
    if (i == 1)
    {
      drawLeft = true;
    }
    if (i == 2)
    {
      drawUp = true;
    }
    if (i == 3)
    {
      drawDown = true;
    }
    if (i == 4)
    {
      drawRight = true;
    }
  }
  
  
  
  
