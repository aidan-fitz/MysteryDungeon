import java.util.*;

public class Dungeon {

  private String name;

  private int totalFloors, currentFloor;

  private Floor floor;

  private List<Creature> enemies;
  private Hero hero;
  
  private Random rng;

  public Dungeon(String name, int floors) {
    this.name = name;
    totalFloors = floors;
    currentFloor = 1;
    rng = new Random();
    floor = new Floor(enemies, rng);
    enemies = new ArrayList<Creature>();
    Creature enemy = new Creature(20,10,10,10, color(0,255,0), this);
    enemies.add(enemy);
    hero = new Hero(20, 1, 20, 20, color(255,0,0), this);
  }

  public void nextFloor() {
    currentFloor++;
    if (currentFloor > totalFloors) {
      // exit the dungeon
    } else {
	floor = new Floor(enemies, rng);
    }
  }
  public Hero getHero(){
     return hero;
  }
  public Floor getFloor(){
      return floor;
  }
  
  public void attack(){
    System.out.println(hero.getX() + " " + hero.getY());
    Creature enemy = null;
    int i = 0;
    while (i < enemies.size()){
        Creature currEnemy = enemies.get(i);
      if (dist(currEnemy.getX(), currEnemy.getY(), hero.getX(), hero.getY()) <= 1){
           enemy = currEnemy;
           enemy.setColor(color(100,100,100));
         
      }
      i = i + 1;
    }
  }
  
  public void draw() {
    for (Floor.Tile tile: floor) {
      tile.draw();
    }
    hero.draw();
    int i = 0;
    while (i < enemies.size()){
      enemies.get(i).draw();
      i = i + 1;
    }
  }
}

