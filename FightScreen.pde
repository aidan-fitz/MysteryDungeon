public class FightScreen{
  Hero hero;
  Creature enemy;
  Dungeon dungeon;
  
  public FightScreen(Dungeon dungeon){
    this.dungeon = dungeon;
  }
  public void setup(){
    size(960, 720);
  }
  public void draw(){
    fill(255,0,0);
    rect(30,30,30,30);
    if(dungeon.getAttacking()){
      dungeon.setAttacking(false);
    }
  }
}
  
