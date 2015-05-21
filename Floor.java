public class Floor {

    private char[][] map;

    private List<Creature> enemies;

    public Floor() {
	// can change size later
	map = new char[16][16];
	// fill it up
	makeLayout();
	makeStairs();
	makeEnemies();
	makeTraps();
    }

    // Void methods for building the floor
    // makeEnemies() and makeTraps() can be safely left blank

    /**
     * Determines placement of wall and floor tiles.
     */
    private void makeLayout() {

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