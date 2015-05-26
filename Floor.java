import java.util.*;
import static ListUtil.*;

public class Floor {

  private char[][] map;

  private List<Creature> enemies;

  private Random rng;

  public Floor(List<Creature> team, Random rng) {
    this.rng = rng;
    map = makeBlankGrid();
  }

  // Void methods for building the floor
  // makeEnemies() and makeTraps() can be safely left blank

  private char[][] makeBlankGrid() {
    int h = 24 + rng.nextInt(24);
    int w = 48 + rng.nextInt(36);
    return new char[h][w];
  }

  /**
   * Determines placement of wall (X) and floor tiles (SPACE).
   * Floor tiles are arranged in rectangular, non-overlapping rooms
   * connected by one-tile-wide corridors.
   */
  private void makeLayout() {
    List<Room> rooms = new LinkedList<Room>();
    // keep making rooms until I get tired of it
    // always make at least one room
    do {
      makeRoom(rooms);
    }
    while (rng.nextBoolean ());

    // then connect them with corridors
    while (!connected (rooms) || rng.nextBoolean()) {
      makeCorridor(rooms);
    }

    // fill the rest with X's
    for (int r = 0; r < map.length; r++) {
      for (int c = 0; c < map[0].length; c++) {
        if (map[r][c] != ' ') {
          map[r][c] = 'X';
        }
      }
    }
  }

  /* Helper functions for makeLayout */

  private void makeRoom(List<Room> rooms) {
    // TODO make sure rooms don't overlap
    int r1 = rng.nextInt(map.length), 
    c1 = rng.nextInt(map[0].length), 
    h = rng.nextInt(map.length - r1), 
    w = rng.nextInt(map[0].length - c1);
    for (int r = 0; r < h; r++) {
      for (int c = 0; c < w; c++) {
        map[r1+r][c1+c] = ' ';
      }
    }
  }

  private void makeCorridor(List<Room> rooms) {
    Room from = oneOf(rooms, rng), to = anotherOf(rooms, from, rng);
  }

  private boolean connected(List<Room> rooms) {
    return true;
  }

  // end of helper functions for makeLayout

  private void makeStairs() {
  }

  private void placeTeam() {
  }

  private void makeEnemies() {
  }

  private void makeTraps() {
  }

  private class Room {
    public int r1, c1, h, w;

    public Room(int r1, int c1, int h, int w) {
      this.r1 = r1;
      this.c1 = c1;
      this.h = h;
      this.w = w;
    }
  }



  public static void main(String[] args) {
  }
}

