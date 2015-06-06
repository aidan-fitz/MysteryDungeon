public class Creature {
  private Dungeon dungeon;
  private int health;
  private int x,y; //position in the floor map
  private int level;
  private color creatureColor;
  public Creature(int health, int level, int x, int y, color creatureColor, Dungeon dungeon) {
    this.x = x;
    this.y = y;
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
    x = x + distance;
  }
  public void moveV(int distance){ //negative is up
    y = y + distance;
  }
  public int getX(){
    return x;
  }
  public int getY(){
    return y;
  }
  public void setColor(color creatureColor){
    this.creatureColor = creatureColor;
  }
  public void draw(){
    stroke(0);
    fill(creatureColor);
    ellipseMode(CORNER);
    ellipse(x * 20, y * 20, 20, 20);
  }
}

