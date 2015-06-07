public class Creature {
  private Dungeon dungeon;
  private int health;
  private int r,c; //position in the floor map
  private int level;
  private color creatureColor;
  public Creature(int health, int level, int r, int c, color creatureColor, Dungeon dungeon) {
    this.r = r;
    this.c = c;
    this.health = health;
    this.level = level;
    this.creatureColor = creatureColor;
    this.dungeon = dungeon;
  }
  public int getHealth() {
    return health;
  }
  public int getLevel() {
    return level;
  }
  public void setHealth(int health) {
    this.health = health;
  }
  public void setLevel(int level) {
    this.level = level;
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
    stroke(0);
    fill(creatureColor);
    ellipseMode(CORNER);
    ellipse(c * 20, r * 20, 20, 20);
  }
}

