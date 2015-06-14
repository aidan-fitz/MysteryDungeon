import java.util.*;
import java.io.*;

public class Floor implements Iterable<Floor.Tile> {

  public static final char OPEN = ' ', WALL = 'X', STAIRS = 'S', 
  WATER = 'w', LAVA = 'L', TRAP_UNTRIGGERED = 't', TRAP_TRIGGERED = 'T';

  private char[][] map;

  private Random rng;

  PImage wallImage, groundImage, stairsImage;

  private Dungeon dungeon;

  public Floor(Random rng, Dungeon dungeon) {
    this.rng = rng;
    this.dungeon = dungeon;
    map = loadLayout();
    wallImage = loadImage("wall.png");
    groundImage = loadImage("ground.png");
    stairsImage = loadImage("stairs2.png"); // stairs.png is upward staircase - both sprites (c) Pokemon/Nintendo
    makeStairs();
    makeEnemies();
  }

  public Tile getTile(int x, int y) {
    return new Tile(x, y);
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
    Tile s = randomFloorTile();
    s.setType(STAIRS);
  }
  private void makeEnemies() {
    for (int i = 0; i < 4; i++) {
      // TODO make sure creatures don't coincide
      Tile s = randomFloorTile();
      Creature newEnemy = new Creature(15, rng.nextInt(6) + 5, s.getX(), s.getY(), dungeon, true, rng);
      dungeon.addEnemy(newEnemy);
    }
  }

  private void makeTraps() {
  }

  // end of maze setup functions

    public Tile get(int row, int col) {
    return new Tile(row, col);
  }

  public Tile randomTile() {
    return new Tile(rng.nextInt(sizeX()), rng.nextInt(sizeY()));
  }

  public Tile randomFloorTile() {
    Tile t = null;
    while (t == null || !t.canWalk ()) {
      t = randomTile();
    }
    return t;
  }

  /**
   * Different from randomFloorTile(): Can be water etc. and won't have a
   * Creature on it
   */
  public Tile randomWalkableTile(boolean floorOnly) {
    Tile t = null;
    while (t == null || !t.canWalk ()) {
      t = randomTile();
    }
    return t;
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

    public void setType(char type) {
      map[y][x] = type;
    }

    public int getX() {
      return x;
    }

    public int getY() {
      return y;
    }

    public boolean exists() {
      return 0 <= x && x < sizeX() && 0 <= y && y < sizeY();
    }

    public boolean canWalk() {
      return getType() != WALL && !isOccupied();
    }

    public List<Tile> getNeighbors() {
      List neighbors = new LinkedList<Tile>();
      for (int dx = -1; dx <= 1; dx++) {
        for (int dy = -1; dy <= 1; dy++) {
          if (dx != 0 || dy != 0) {
            Tile t = new Tile(x + dx, y + dy);
            if (t.exists()) {
              neighbors.add(t);
            }
          }
        }
      }
      return neighbors;
    }

    public int numWalkableNeighbors() {
      int n = 0;
      for (Tile t : getNeighbors ()) {
        if (t.canWalk()) {
          n++;
        }
      }
      return n;
    }

    public boolean isOccupied() {
      int i = 0;
      List<Creature> creatures = new ArrayList<Creature>(dungeon.getEnemies());
      creatures.add(dungeon.getHero());
      while (i < creatures.size ()) {
        Creature creature = creatures.get(i);
        if (x == creature.getX() && y == creature.getY()) {
          return true;
        }
        i = i + 1;
      }
      return false;
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
      noStroke();
      switch (getType()) {
      case OPEN:
        imageMode(CORNER);
        image(groundImage, x * tileSize, y * tileSize, tileSize, tileSize);
        return;
      case WALL:
        imageMode(CORNER);
        image(wallImage, x * tileSize, y * tileSize, tileSize, tileSize);
        return;
      case STAIRS:
        imageMode(CORNER);
        image(stairsImage, x * tileSize, y * tileSize, tileSize, tileSize);
        return;
      default:
        rectMode(CORNER);
        fill(getColor());
        rect(tileSize*x, tileSize*y, tileSize, tileSize);
      }
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

