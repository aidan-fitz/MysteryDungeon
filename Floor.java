import java.util.*;
//import static ListUtil.*;

public class Floor {

    public static final char OPEN = ' ', WALL = 'X', STAIRS = 'S',
	WATER = 'w', LAVA = 'L', TRAP_UNTRIGGERED = 't', TRAP_TRIGGERED = 'T';

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
    char[][] grid = new char[h][w];

    // all walls for printing purposes
    for (int r = 0; r < grid.length; r++) {
      for (int c = 0; c < grid[0].length; c++) {
          grid[r][c] = WALL;
      }
    }
    return grid;
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
    while (rng.nextBoolean());

    // then connect them with corridors
    while (!connected (rooms) || rng.nextBoolean()) {
      makeCorridor(rooms);
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
        map[r1+r][c1+c] = OPEN;
      }
    }
    rooms.add(new Room(r1, c1, h, w));
  }

  private void makeCorridor(List<Room> rooms) {
      Room from = (Room) ListUtil.oneOf(rooms, rng),
	     to = (Room) ListUtil.anotherOf(rooms, from, rng);
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
	
	private int row, col;

	public Tile(int row, int col) {
	    this.row = row;
	    this.col = col;
	}

	public char getType() {
	    return map[row][col];
	}

	public boolean canWalk() {
	    return getType() != WALL;
	}
    }


  public static void main(String[] args) {
      Floor fl = new Floor(null, new Random(201505261159L));
      System.out.println(fl);
  }

    public String toString() {
	StringBuilder yolo = new StringBuilder();
	for (char[] row : map) {
	    yolo.append(row);
	    yolo.append('\n');
	}
	return yolo.toString();
    }
}

