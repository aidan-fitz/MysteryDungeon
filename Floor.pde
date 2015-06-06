import java.util.*;
import java.io.*;

public class Floor implements Iterable<Floor.Tile> {

  public static final char OPEN = ' ', WALL = 'X', STAIRS = 'S', 
  WATER = 'w', LAVA = 'L', TRAP_UNTRIGGERED = 't', TRAP_TRIGGERED = 'T';

  private char[][] map;

  private List<Creature> enemies;

  private Random rng;

  public Floor(List<Creature> team, Random rng) {
    this.rng = rng;
    map = loadLayout();
    
    println(sizeX() + "," + sizeY());
  }

   public Tile getTile(int x, int y){
      return new Tile(x, y);
    }
  /**
   * Determines placement of wall (X) and floor tiles (SPACE).
   * Floor tiles are arranged in rectangular, non-overlapping rooms
   * connected by one-tile-wide corridors.
   */
<<<<<<< HEAD
  private void makeLayout() {
    List<Room> rooms = new LinkedList<Room>();
    // keep making rooms until I get tired of it
    // always make at least one room
    //    do {
    for (int i = 0; i < 3; i++) {
      makeRoom(rooms);
    }
    //    while (rng.nextBoolean ());

    // then connect them with corridors
    //    while (!connected (rooms) || rng.nextBoolean()) {
    //      makeCorridor(rooms);
    //    }
  private char[][] loadLayout() {
    File mapLayout;

    try {
      mapLayout = (File) oneOf(mapFiles(), rng);
    } 
    catch (IOException e) {
      e.printStackTrace();
      mapLayout = null;
    }

    // Load contents of mapLayout into char[][] map, line by line
    List<char[]> lines = new ArrayList<char[]>(36);
    Scanner sc;
    try {
      sc = new Scanner(mapLayout);
    } 
    catch (FileNotFoundException e) {
      // shouldn't happen
      e.printStackTrace();
      sc = null;
    }
    while (sc.hasNext ()) {
      lines.add(sc.nextLine().toCharArray());
    }
    return lines.toArray(new char[lines.size()][]);
  }

<<<<<<< HEAD
  /* Helper functions for makeLayout */

  private void makeRoom(List<Room> rooms) {
    // TODO make sure rooms don't overlap
    int x1 = rng.nextInt(sizeX()), 
    y1 = rng.nextInt(sizeY()), 
    x2 = x1 + rng.nextInt(sizeX() - x1), 
    y2 = y1 + rng.nextInt(sizeY() - y1);

    Room newRoom = new Room(x1, x2, y1, y2);

    if (canMakeRoomHere(rooms, newRoom)) {
      // Then go ahead
      for (int x = x1; x < x2; x++) {
        for (int y = y1; y < y2; y++) {
          map[y][x] = OPEN;
        }
=======
  // oneOf requires a list
  private final List<File> mapFiles() throws IOException {
    // http://stackoverflow.com/a/2102989
    File dir = new File(dataPath(""));
    println(dir.getCanonicalPath());
    File[] mapFileArray = dir.listFiles(new FilenameFilter() {
      @Override
        public boolean accept(File dir, String name) {
        return name.endsWith(".map");
>>>>>>> golduck2
      }
      rooms.add(newRoom);
    } else {
      makeRoom(rooms);
    }
<<<<<<< HEAD
  }

  private boolean canMakeRoomHere(List<Room> rooms, Room newRoom) {
    for (Room oldRoom : rooms) {
      if (newRoom.overlaps(oldRoom))
        return false;
    }
    return true;
  }

  private void makeCorridor(List<Room> rooms) {
    Room from = (Room) oneOf(rooms, rng), 
    to = (Room) anotherOf(rooms, from, rng);
    // do something
    // fire lasers through random walls, then dig a tunnel when they intersect
=======
    );
    return Arrays.asList(mapFileArray);
>>>>>>> golduck2
  }

  public int sizeX() {
    return map[0].length;
  }

<<<<<<< HEAD
  private class Room {
    public int x1, y1, x2, y2;

    public Room(int x1, int y1, int x2, int y2) {
      this.x1 = x1;
      this.y1 = y1;
      this.x2 = x2;
      this.y2 = y2;
    }

    // h/t http://www.geeksforgeeks.org/find-two-rectangles-overlap/
    public boolean overlaps(Room other) {
      return (x1 <= other.x2 && x2 <= other.x1)
        && (y1 <= other.y2 && y2 <= other.y1);
    }
=======
  public int sizeY() {
    return map.length;
>>>>>>> golduck2
  }

  // Void methods for building the floor
  // makeEnemies() and makeTraps() can be safely left blank

  private void makeStairs() {
  }

  private void placeTeam() {
  }

  private void makeTraps() {
  }

  // end of maze setup functions

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
        // Untriggered traps and open tiles look identical
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
      rect(tileSize*x, tileSize*y, tileSize, tileSize);
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

