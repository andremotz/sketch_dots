/**
 * sketch_dots
 * 
 * André Motz, 12/22/2013
 * 
 * usage:
 * -/+ de/increase dotSize
 * q/w de/increase gridSize
 * spacebar save to vector-PDF (frame-####.pdf)
 * b Brightness-mode on/off
 */
import processing.pdf.*;

PImage img;
Datahandler datahandler;

void setup() {

  img = loadImage("William_Gibson_by_FredArmitage.jpg");

  datahandler = new Datahandler();
  datahandler.setImgWidth(img.width);
  datahandler.setImgHeight(img.height);
  int windowWidth = 10;
  int windowHeight = 10;

  println("img dimensions: " + datahandler.getImgWidth() + 
    "x" + datahandler.getImgHeight() + " px");

  println("display dimensions: " + displayWidth + 
    "x" + displayHeight + " px");

  int imgWidth = datahandler.getImgWidth();
  int imgHeight = datahandler.getImgHeight();

  //set proportionally correct windowsize
  
  float imgScaling;
  if (imgWidth > imgHeight) {
    // is landscape image
    
    imgScaling = (float) displayWidth / (float) imgWidth;
    windowWidth = displayWidth;
    windowHeight = (int) ((float) imgScaling * imgHeight);
    
  } 
  else {
    // is potrait image
    
    imgScaling = (float) displayHeight / (float) imgHeight;
    windowWidth = (int) ((float) imgScaling * imgWidth);
    windowHeight = displayHeight;
    
  }
  
  println("imgScaling: " + imgScaling);
  println("window dimensions: " + windowWidth + 
      "x" + windowHeight + " px");

  datahandler.setWindowWidth(windowWidth);
  datahandler.setWindowHeight(windowHeight);
  size(windowWidth, windowHeight);

  noStroke();

  int pointSize = 10;
  int gridSize = 10;
  datahandler.setPointSize(pointSize);
  datahandler.setGridSize(gridSize);

  drawDotsOnScreen();
}

void draw() {
  boolean record = false;
  datahandler.setRecordPDF(false);

  if (keyPressed) {
    handleKeyboard();

    if (datahandler.getRecordPDF() == true) {
      // Note that #### will be replaced with the frame number. Fancy!
      beginRecord(PDF, "frame-####.pdf");
    }

    drawDotsOnScreen();

    if (datahandler.getRecordPDF() == true) {
      endRecord();
      datahandler.setRecordPDF(false);
    }
  }
}

