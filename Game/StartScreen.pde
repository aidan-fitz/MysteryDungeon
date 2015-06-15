public class StartScreen {

  Game game;
  boolean mouseOverStartButton;
  int startButtonWidth, startButtonHeight;

  public StartScreen(Game game) {
    this.game = game;
    startButtonWidth = 100;
    startButtonHeight = 50;
    mouseOverStartButton = false;
  }

  void draw() {
    R.bg();
    textAlign(CENTER, CENTER);
    drawLogo();
    drawButton();
    drawCopyright();
  }
  
  void drawLogo() {
    fill(255, 192, 0);
    textSize(72);
    text("Crazy Dungeon", width/2, height/2 - 100);
  }

  void drawButton() {
    update(mouseX, mouseY);
    if (mouseOverStartButton) {
      fill(104);
    } else {
      fill(0);
    } 
    stroke(255);
    rectMode(CENTER);
    rect(width/2, height/2, startButtonWidth, startButtonHeight);
    textSize(32);
    fill(255);
    text("Start", width/2, height/2 - 5);
  }
  
  void drawCopyright() {
    textSize(14);
    text("\u00a9 2015 Aidan Fitzgerald and Ethan Ansorge", width/2, height/2 + 40);
  }

  void update(int x, int y) {
    if (overRect(width/2 - startButtonWidth/2, height/2 - startButtonHeight/2, startButtonWidth, startButtonHeight)) {
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

