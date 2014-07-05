void handleKeyboard() {
   if (key == '+') {
      int pointSize = datahandler.getPointSize();
      datahandler.setPointSize(pointSize + 1);
      println("key pressed: +, pointSize: " + pointSize);
    }
    if (key == '-') {
      int pointSize = datahandler.getPointSize();
      datahandler.setPointSize(pointSize - 1);
      println("key pressed: -, pointSize: " + datahandler.getPointSize());
    }
    if (key == 'q' || key == 'Q') {
      int gridSize = datahandler.getGridSize();
      datahandler.setGridSize(gridSize - 1);
      println("key pressed: q, gridSize: " + datahandler.getGridSize());
    }
    if (key == 'w' || key == 'W') {
      int gridSize = datahandler.getGridSize();
      datahandler.setGridSize(gridSize + 1);
      println("key pressed: W, gridSize: " + datahandler.getGridSize());
    }
    if (key == '+') {
      int pointSize = datahandler.getPointSize();
      datahandler.setPointSize(pointSize + 1);
      println("key pressed: +, pointSize: " + datahandler.getPointSize());
    }
    if (key == ' ') {
      datahandler.setRecordPDF(true);
      println("key pressed: spacebar, going to save to PDF");
    }
    if (key == 'b' || key == 'B') {
      boolean brightnessMode = datahandler.getBrightnessMode();
      if (brightnessMode == true) {
        datahandler.setBrightnessMode(false);
      } else {
        datahandler.setBrightnessMode(true);
      }
      println("key pressed: b, brightnessMode: " + datahandler.getBrightnessMode());
    }
}

