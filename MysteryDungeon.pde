import java.util.*;

Dungeon dungeon;

int tileSize = 20;

void setup() {
  dungeon = new Dungeon("Nano Woods", 1);
  size(tileSize*dungeon.sizeX(), tileSize*dungeon.sizeY());
}

void draw() {
  background(255);
  dungeon.draw();
}




// utility methods

public static Object oneOf(List l, Random rng) {
  int i = rng.nextInt(l.size());
  return l.get(i);
}

public static Object anotherOf(List l, Object alreadyChosen, Random rng) {
  Object elem = null;
  while (elem == null || Arrays.asList (alreadyChosen).contains(elem)) {
    elem = oneOf(l, rng);
  }
  return elem;
}

