public class StartScreen {

  Game game;
  boolean mouseOverStartButton;
  int startButtonX, startButtonY, startButtonWidth, startButtonHeight;

  public StartScreen(Game game) {
    this.game = game;
    startButtonX = 100;
    startButtonY = 100;
    startButtonWidth = 100;
    startButtonHeight = 50;
    mouseOverStartButton = false;
  }

  void draw() {
    image(R.backgroundImage,0,0);
    //mousePressed();
    update(mouseX, mouseY);
    if (mouseOverStartButton) {
      fill(51);
    } else {
      fill(0);
    } 
    stroke(255);
    rect(startButtonX, startButtonY, startButtonWidth, startButtonHeight);
    textAlign(LEFT, TOP);
    textSize(32);
    fill(255);
    //text("Mystery Dungeon", startButtonX, startButtonY); 
    text("Start", startButtonX + 15, startButtonY + 7);
  }

  void update(int x, int y) {
    if (overRect(startButtonX, startButtonY, startButtonWidth, startButtonHeight)) {
      mouseOverStartButton = true;
    } else {
      mouseOverStartButton = false;
    }
  }

  boolean overRect(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }
}


