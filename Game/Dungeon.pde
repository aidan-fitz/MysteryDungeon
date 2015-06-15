import java.util.*;

public class Dungeon {

  private String name;

  private int totalFloors, currentFloor;

  private Floor floor;

  private List<Creature> enemies;

  private Hero hero;

  private Random rng;

  private Creature creatureInFight;
  
  private boolean heroAlive, inCombat;

  public Dungeon(String name, int floors) {
    this.name = name;
    totalFloors = floors;
    currentFloor = 1;
    rng = new Random();
    creatureInFight = null;
    heroAlive = true;
    inCombat = false;
    enemies = new ArrayList<Creature>();
    hero = new Hero(20, 10, 32, 10, this, false, rng);
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
      playing = false;
      won = true;
    } else {
      enemies = new ArrayList<Creature>();
      floor = new Floor(rng, this);
    }
  }
  public Hero getHero() {
    return hero;
  }
  public List<Creature> getEnemies() {
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

  public void removeEnemy(Creature enemy) {
    enemies.remove(enemy);
  }

  public void setHeroDead(){
    heroAlive = false;
  }

  public boolean heroIsAlive(){
    return heroAlive;
  }

  public Random getRNG(){
    return rng;
  }
  
  public void setInCombat(boolean newBoolean){
    inCombat = newBoolean;
  }
  
  public boolean getInCombat(){
    return inCombat;
  }
  
  public void attack() {
    // If not enough time has elapsed since the last battle, no battle
    if (millis() - lastBattleEnded < 5000)
      return;
    for (int i = 0; !inCombat && i < enemies.size(); i++) {
      Creature currEnemy = enemies.get(i);
      System.out.println(hero.distTo(currEnemy));
      if (hero.distTo(currEnemy) < 2) {
        inCombat = true;
        creatureInFight = currEnemy;
      }
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
    // Dungeon name and floor number
    fill(255);
    textSize(16);
    textAlign(LEFT, TOP);
    text(name + " B" + currentFloor + "F", 10, 10);
  }
}

