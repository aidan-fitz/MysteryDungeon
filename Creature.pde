public class Creature {
  private Dungeon dungeon;
  private int health;
  private int r,c; //position in the floor map
  private int level;
  private color creatureColor;
  private boolean enemy;
  long nextMovement;
  PImage enemyImage, heroImage; 
  public Creature(int health, int r, int c, color creatureColor, Dungeon dungeon, boolean enemy) {
    this.r = r;
    this.c = c;
    this.health = health;
    this.creatureColor = creatureColor;
    this.dungeon = dungeon;
    this.enemy = enemy;
    enemyImage = loadImage("enemy.png");
    heroImage = loadImage("hero.png");
    nextMovement = millis() + 1000;
  }
  public int getHealth() {
    return health;
  }
  public void setHealth(int health) {
    this.health = health;
  }
  public void move(){
   if (dist(r, c, dungeon.getHero().getR(), dungeon.getHero().getC()) < 10){
     if (millis() % 10 == 0){
       if (c > dungeon.getHero().getC()){
           moveH(-1);
       }
       if (c < dungeon.getHero().getC()){
           moveH(1);
       }
       if (r > dungeon.getHero().getR()){
           moveV(-1);
       }
       if (r < dungeon.getHero().getR()){
           moveV(1);
     }
     }
   }else{
     if (millis() >= nextMovement){
        nextMovement = millis() + 1000;
        Random rand = new Random();
        int randomNum = rand.nextInt(4);
        if (randomNum == 0){
          moveH(-1);
        }
        if (randomNum == 1){
          moveH(1);
        }
        if (randomNum == 2){
          moveV(-1);
        }
        if (randomNum == 3){
          moveV(1);
        }
      }
    }
  }
  public void moveH(int distance){ //negative is left
    c = c + distance;
  }
  public void moveV(int distance){ //negative is up
    r = r + distance;
  }
  public int getR(){
    return r;
  }
  public int getC(){
    return c;
  }
  public void setColor(color creatureColor){
    this.creatureColor = creatureColor;
  }
  public void draw(){
    imageMode(CORNER);
    if (enemy){
      move();
      image(enemyImage, c * 20, r * 20, 20, 20);
    }else{
      image(heroImage, c * 20, r * 20, 20, 20);
    }
  }
}

