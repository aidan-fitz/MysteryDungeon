import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

import java.util.*;

SpriteSet R;

Dungeon dungeon;
StartScreen startScreen;
FightScreen fightScreen;
EndScreen endScreen;



boolean isUp, isDown, isRight, isLeft, isSpace, isF, playing, won;

int tileSize = 20;

void setup() {
  size(960, 720);
  R = new SpriteSet();
  dungeon = new Dungeon("Nano Woods", 5);
  startScreen = new StartScreen(this);
  endScreen = new EndScreen();
  playing = false;
  won = false;
}

void draw() {
  background(255);
  if (playing) {
    if (dungeon.getCreatureInFight() == null || !dungeon.getInCombat()) {
      fightScreen = null;
      dungeon.getHero().processKeys(isUp, isDown, isRight, isLeft, isSpace);
      dungeon.draw();
      if (dungeon.getHero().getAttemptAttacking()) {
        dungeon.attack();
      }
      dungeon.getHero().setAttemptAttacking(false);
    } else if(dungeon.heroIsAlive()){
      if (fightScreen == null) {
        fightScreen = new FightScreen(dungeon);
      }
      fightScreen.processKeys(isUp, isDown, isSpace, isF);
      fightScreen.draw();
    } else {
      System.out.println("Game Over");
    }
  } else {
    if (won){
    endScreen.draw();
    } else {
    startScreen.draw();
    }
  }
}

void handleKey(boolean pressed) {
  if (keyCode == 32) {//space
    isSpace = pressed;
  }
  if (keyCode == UP) {
    isUp = pressed;
  }
  if (keyCode == LEFT) {
    isLeft = pressed;
  }
  if (keyCode == RIGHT) {
    isRight = pressed;
  }
  if (keyCode == DOWN) {
    isDown = pressed;
  }
  if (keyCode == 70){
    isF = pressed;
  }
}
void keyPressed() {
  handleKey(true);
}
void keyReleased() {
  handleKey(false);
}
void mousePressed() {
  playing = true;
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

