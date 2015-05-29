import java.util.*;

Dungeon dungeon;

void setup() {
  size(800, 600);
  dungeon = new Dungeon("Nano Woods", 1);
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

