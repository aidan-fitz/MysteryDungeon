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
    Creature enemy = new Creature(20,10,10,10, color(0,255,0), this, true);
    enemies.add(enemy);
    hero = new Hero(20, 1, 20, 15, color(255,0,0), this, false);
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
    Creature enemy = null;
    int i = 0;
    while (i < enemies.size()){
        Creature currEnemy = enemies.get(i);
        System.out.println(dist(currEnemy.getR(), currEnemy.getC(), hero.getR(), hero.getC()));
      if (dist(currEnemy.getR(), currEnemy.getC(), hero.getR(), hero.getC()) <= 2){
           enemy = currEnemy;
           enemy.setColor(color(100,100,100));
         
      }
      i = i + 1;
    }
  }

  public void draw() {
    for (Floor.Tile tile : floor) {
       if ( 0 <= tile.getX() && tile.getX() < floor.sizeX() && 0 <= tile.getY() && tile.getY() < floor.sizeY()){
        tile.draw();
       }
    }
    hero.draw();
    int i = 0;
    while (i < enemies.size()){
      enemies.get(i).draw();
      i = i + 1;
    }
  }
  
  public int sizeX() {
    return floor.sizeX();
  }
  
  public int sizeY() {
    return floor.sizeY();
  }
}

