public class StartScreen{
  
  Game game;
  boolean mouseOverStartButton;
  float startButtonX, startButtonY, startButtonWidth, startButtonHeight;
  
  public StartScreen(Game game){
    this.game = game;
    startButtonX = 100;
    startButtonY = 100;
    startButtonWidth = 100;
    startButtonHeight = 50;
  }
  
  void setup(){
    size(960, 720);
    mouseOverStartButton = true;
  }
  
  void draw(){
    mousePressed();
    update(mouseX, mouseY); 
    textSize(32);
    fill(0, 102, 153);
    //text("Mystery Dungeon", startButtonX, startButtonY); 
    text("Start", startButtonX,startButtonY); 
    if (mouseOverStartButton){
      fill(color(51));
    }else{
      fill(color(0));
    } 
    rect(startButtonX, startButtonY, startButtonWidth, startButtonHeight);
    }
  void update(int x, int y) {
    if (mouseX >= startButtonX && mouseX <= startButtonX + startButtonWidth && mouseY >= startButtonY && mouseY <= startButtonY + startButtonHeight) {
      mouseOverStartButton = true;
    }else{
      mouseOverStartButton = false;
    }
  }

  void mousePressed() {
    if (mouseOverStartButton){
      game.setPlaying(true);
    }
  }
}
  
