void drawDotsOnScreen() {

  int pointSize = datahandler.getPointSize();
  int gridSize = datahandler.getGridSize();
  
  int imgWidth = datahandler.getImgWidth();
  int imgHeight = datahandler.getImgHeight();
  
  int windowWidth = datahandler.getWindowWidth();
  int windowHeight = datahandler.getWindowHeight();
  
  
  background(0);

  for (int y = 0; y < windowHeight; y = y + gridSize) {
    for (int x = 0; x < windowWidth; x = x + gridSize) {
      boolean brightnessMode = datahandler.getBrightnessMode();

      /* current scale must be calculated with the bitma
       to catch all pixels.
       
       map(value, start1, stop1, start2, stop2)
       pixel 1728 = map(x, 0, width, 0, imgWidth
       1728 = map(720, 0, 1440, 0, 3456)
       */
      int mappedX = (int) map(x, 0, windowWidth, 0, imgWidth);
      int mappedY = (int) map(y, 0, windowHeight, 0, imgHeight);

      color pix = img.get(mappedX, mappedY);

      if (brightnessMode == true) {

        color white = #FFFFFF;
        fill(white, 128);

        // map(value, start1, stop1, start2, stop2)
        float pointSizeBrightnessMode = map(brightness(pix), 0, 255, 0, pointSize);
        ellipse(x, y, pointSizeBrightnessMode, pointSizeBrightnessMode);
      } 
      else {

        fill(pix, 128);
        ellipse(x, y, pointSize, pointSize);
      }
    }
  }
}

