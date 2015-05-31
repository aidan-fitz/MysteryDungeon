import java.util.*;

Dungeon dungeon;
boolean isUp, isDown, isRight, isLeft, isSpace;

void setup() {
  size(800, 600);
  dungeon = new Dungeon("Nano Woods", 1);
  
}

void draw() {
  background(255);
  dungeon.getHero().processKeys(isUp, isDown, isRight, isLeft);
  dungeon.draw();
}

void handleKey(boolean pressed){
  if (keyCode == 32) {//space
    isSpace = pressed;
  }
  if (keyCode == UP) {
    isUp = pressed;
  }
  if (keyCode == LEFT){
    isLeft = pressed;
  }
  if (keyCode == RIGHT){
    isRight = pressed;
  }
  if (keyCode == DOWN){
    isDown = pressed;
  }
}
void keyPressed(){
  handleKey(true);
}
void keyReleased(){
  handleKey(false);
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

