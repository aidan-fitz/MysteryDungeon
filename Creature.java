public class Creature {

  private int health;

  private int level;

  public Creature(int health, int level) {
    this.health = health;
    this.level = level;
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
}

