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
  }

  /**
   * Determines placement of wall (X) and floor tiles (SPACE).
   * Floor tiles are arranged in rectangular, non-overlapping rooms
   * connected by one-tile-wide corridors.
   */
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

  // oneOf requires a list
  private final List<File> mapFiles() throws IOException {
    // http://stackoverflow.com/a/2102989
    File dir = new File(dataPath(""));
    println(dir.getCanonicalPath());
    File[] mapFileArray = dir.listFiles(new FilenameFilter() {
      @Override
        public boolean accept(File dir, String name) {
        return name.endsWith(".map");
      }
    }
    );
    return Arrays.asList(mapFileArray);
  }

  public int sizeX() {
    return map[0].length;
  }

  public int sizeY() {
    return map.length;
  }

  // Void methods for building the floor
  // makeEnemies() and makeTraps() can be safely left blank

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
      noStroke();
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

