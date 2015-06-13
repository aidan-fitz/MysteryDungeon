public class StartScreen{
  
  Game game;
  boolean mouseOverStartButton;
  int startButtonX, startButtonY, startButtonWidth, startButtonHeight;
  
  public StartScreen(Game game){
    this.game = game;
    startButtonX = 100;
    startButtonY = 100;
    startButtonWidth = 100;
    startButtonHeight = 50;
    mouseOverStartButton = false;
    setup();
  }
  
  void setup(){
    size(960, 720);
  }
  
  void draw(){
    //mousePressed();
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
    stroke(255);
    rect(startButtonX, startButtonY, startButtonWidth, startButtonHeight);
    }
    
  void update(int x, int y) {
    if (overRect(startButtonX, startButtonY, startButtonWidth, startButtonHeight)) {
      mouseOverStartButton = true;
    }else{
      mouseOverStartButton = false;
    }
  }
  
boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
  
  }


  
