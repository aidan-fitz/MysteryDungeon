import java.util.*;

public class Dungeon {

  private String name;

  private int totalFloors, currentFloor;

  private Floor floor;

  private List<Creature> enemies;

  private Hero hero;

  private Random rng;

  private Creature creatureInFight;

  public Dungeon(String name, int floors) {
    this.name = name;
    totalFloors = floors;
    currentFloor = 1;
    rng = new Random();
    creatureInFight = null;
    enemies = new ArrayList<Creature>();
    hero = new Hero(20, 20, 32, 10, color(255, 0, 0), this, false, rng);
    floor = new Floor(rng, this);
  }
  public int sizeX() {
    return floor.sizeX();
  }

  public int sizeY() {
    return floor.sizeY();
  }
  public void nextFloor() {
    currentFloor++;
    if (currentFloor > totalFloors) {
      // exit the dungeon
    } else {
      floor = new Floor(rng, this);
    }
  }
  public Hero getHero() {
    return hero;
  }
  public List getEnemies() {
    return enemies;
  } 
  public Floor getFloor() {
    return floor;
  }
  public Creature getCreatureInFight() {
    return creatureInFight;
  }
  public void setCreatureInFight(Creature creatureInFight) {
    this.creatureInFight = creatureInFight;
  }
  public void addEnemy(Creature enemy) {
    enemies.add(enemy);
  }
  public void attack() {
    int i = 0;
    while (i < enemies.size ()) {
      Creature currEnemy = enemies.get(i);
      System.out.println(dist(currEnemy.getY(), currEnemy.getX(), hero.getY(), hero.getX()));
      if (dist(currEnemy.getY(), currEnemy.getX(), hero.getY(), hero.getX()) < 2) {
        creatureInFight = currEnemy;
      }
      i = i + 1;
    }
  }

  public void draw() {
      for (Floor.Tile tile : floor) {
        if ( 0 <= tile.getX() && tile.getX() < floor.sizeX() && 0 <= tile.getY() && tile.getY() < floor.sizeY()) {
          tile.draw();
        }
      }
      hero.draw();
      int i = 0;
      while (i < enemies.size ()) {
        enemies.get(i).move();
        enemies.get(i).draw();
        i = i + 1;
      }
  }
}

