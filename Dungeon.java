public class Dungeon {

    private String name;

    private int totalFloors, currentFloor;

    private Floor floor;

    private List<Creature> team;

    public Dungeon(String name, int floors) {
	this.name = name;
	totalFloors = floors;
	currentFloor = 1;
	floor = new Floor();
    }

    public void nextFloor() {
	currentFloor++;
	if (currentFloor > totalFloors) {
	    // exit the dungeon
	}
	else {
	    floor = new Floor();
	}
    }

}