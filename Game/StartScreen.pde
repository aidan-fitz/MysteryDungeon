public class StartScreen {

  Game game;
  boolean mouseOverStartButton;
  int startButtonX, startButtonY, startButtonWidth, startButtonHeight;

  public StartScreen(Game game) {
    this.game = game;
    startButtonX = 160;
    startButtonY = 385;
    startButtonWidth = 100;
    startButtonHeight = 50;
    mouseOverStartButton = false;
  }

  void draw() {
    image(R.startScreenImage, 0, 0, 960, 720);
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
    text("Start", startButtonX + 15, startButtonY + 7);

    textSize(14);
    text("\u00a9 2015 A&E Productions", startButtonX - 35, startButtonY + startButtonHeight + 10);
  }

  void update(int x, int y) {
    if (overRect()) {
      mouseOverStartButton = true;
    } else {
      mouseOverStartButton = false;
    }
  }

  boolean overRect() {
    return mouseX >= startButtonX && mouseX <= startButtonX+startButtonWidth
      && mouseY >= startButtonY && mouseY <= startButtonY+startButtonHeight;
  }
}
