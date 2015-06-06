import java.util.*;

public class Dungeon {

  private String name;

  private int totalFloors, currentFloor;

  private Floor floor;

  private List<Creature> team;

  private Random rng;

  public Dungeon(String name, int floors) {
    this.name = name;
    totalFloors = floors;
    currentFloor = 1;
    rng = new Random((name.hashCode() << 16) ^ totalFloors);
    floor = new Floor(team, rng);
  }

  public void nextFloor() {
    currentFloor++;
    if (currentFloor > totalFloors) {
      // exit the dungeon
    } else {
      floor = new Floor(team, rng);
    }
  }

  public void draw() {
    for (Floor.Tile tile : floor) {
      tile.draw();
    }
  }
}

