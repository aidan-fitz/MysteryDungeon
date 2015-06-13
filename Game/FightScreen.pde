public class FightScreen{
  PImage heroDefendingImage, enemyDefendingImage, backgroundImage;
  public FightScreen(Dungeon dungeon){
    heroDefendingImage = loadImage("heroDefending.png");
    enemyDefendingImage = loadImage("enemyDefending.png");
    backgroundImage = loadImage("background.png");
  }
  public void draw(){
   image(backgroundImage,0,0);
   image(heroDefendingImage, 100, 420);
   image(enemyDefendingImage, 500, 400, 233, 300);
   rect(300,620,230,100);
   fill(0,200,0);
   textSize(32);
   text("Attack", 370, 660); 
   fill(0, 102, 153, 51); 
  }
}
  
