import java.util.*;

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
    // keep making rooms until I get tired of it
    
    // then connect them with corridors
    
    // fill the rest with X's
  }

  private void makeStairs() {
  }

  private void placeTeam() {
  }

  private void makeEnemies() {
  }

  private void makeTraps() {
  }
}

