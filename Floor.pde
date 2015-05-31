import java.util.*;

public class Floor implements Iterable<Floor.Tile> {

  public static final char OPEN = ' ', WALL = 'X', STAIRS = 'S', 
  WATER = 'w', LAVA = 'L', TRAP_UNTRIGGERED = 't', TRAP_TRIGGERED = 'T';

  private char[][] map;

  private List<Creature> enemies;

  private Random rng;

  public Floor(List<Creature> team, Random rng) {
    this.rng = rng;
    map = new char[36][48];
    makeLayout();
  }

  // Void methods for building the floor
  // makeEnemies() and makeTraps() can be safely left blank

  public int sizeX() {
    return map[0].length;
  }

  public int sizeY() {
    return map.length;
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
    //    while (!connected (rooms) || rng.nextBoolean()) {
    //      makeCorridor(rooms);
    //    }

    for (int r = 0; r < sizeY (); r++) {
      for (int c = 0; c < sizeX (); c++) {
        if (map[r][c] == '\0')
          map[r][c] = WALL;
      }
    }
  }

  /* Helper functions for makeLayout */

  private void makeRoom(List<Room> rooms) {
    // TODO make sure rooms don't overlap
    int y1 = rng.nextInt(sizeY()), 
    x1 = rng.nextInt(sizeX()), 
    sy = rng.nextInt(sizeY() - y1), 
    sx = rng.nextInt(sizeX() - x1);
    for (int y = 0; y < sy; y++) {
      for (int x = 0; x < sx; x++) {
        map[y1+y][x1+x] = OPEN;
      }
    }
    rooms.add(new Room(y1, x1, sy, sx));
  }

  private void makeCorridor(List<Room> rooms) {
    Room from = (Room) oneOf(rooms, rng), 
    to = (Room) anotherOf(rooms, from, rng);
    // do something
    // fire lasers through random walls, then dig a tunnel when they intersect
  }

  private boolean connected(List<Room> rooms) {
    return true;
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

  // end of helper functions for makeLayout

  private void makeStairs() {
  }

  private void placeTeam() {
  }

  private void makeEnemies() {
  }

  private void makeTraps() {
  }

  // end of maze setup functions

    public Tile get(int row, int col) {
    return new Tile(row, col);
  }

  public class Tile {

    private int x, y;

    public Tile(int x, int y) {
      this.x = x;
      this.y = y;
    }

    public char getType() {
      return map[y][x];
    }

    public boolean canWalk() {
      return getType() != WALL;
    }

    public color getColor() {
      switch (getType()) {
      case OPEN: 
      case TRAP_UNTRIGGERED:
        return #ccff99; // light yellow
      case WALL:
        return #006600; // dark green
      case STAIRS:
        return #999999; // gray
      case WATER:
        return #00a0ff; // blue
      case LAVA:
        return #ff6900; // red-orange
      case TRAP_TRIGGERED:
        return #cc0000; // deep red
      default:
        return #000000; // black
      }
    }

    public void draw() {
      rectMode(CORNER);
      //noStroke();
      stroke(0);
      fill(getColor());
      rect(20*x, 20*y, 20, 20);
    }
  }

  public Iterator<Tile> iterator() {
    return new Iterator<Tile>() {
      private int x = 0, y = 0;

      public Tile next() {
        // Check this at the beginning
        if (y >= sizeY()) {
          throw new IndexOutOfBoundsException();
        }

        int cx = x, cy = y;
        x++;
        if (x >= sizeX()) {
          y++;
          x = 0;
        }
        return new Tile(cx, cy);
      }

      public boolean hasNext() {
        return x < sizeX() && y < sizeY();
      }

      public void remove() {
        throw new UnsupportedOperationException();
      }
    };
  }
}

