public class Hero extends Creature {
  long nextMovement;
  int maxHealth = 20;
  boolean attemptAttacking;
  public Hero(double health, double energy, int x, int y, Dungeon dungeon, boolean enemy, Random rng) {
    super(health, energy, x, y, dungeon, enemy, rng);
    nextMovement = millis() + 120;
    attemptAttacking = false;
  }

  public void processKeys(boolean isUp, boolean isDown, boolean isRight, boolean isLeft, boolean isSpace) {
    if (millis() >= nextMovement) {
      nextMovement = millis() + 120;
      if (isUp) {
        if (getTileUp().canWalk()) {
          moveY(-1);
        }
      }
      if (isDown) {
        if (getTileDown().canWalk()) {
          moveY(1);
        }
      }
      if (isLeft) {
        if (getTileLeft().canWalk()) {
          moveX(-1);
        }
      }
      if (isRight) {
        if (getTileRight().canWalk()) {
          moveX(1);
        }
      }
      if (isSpace) {
        attemptAttacking = true;
      }
      if (getTile().getType() == Floor.STAIRS) {
        dungeon.nextFloor();
      }
    }
  }
  public boolean getAttemptAttacking() {
    return attemptAttacking;
  }
  public void setAttemptAttacking(boolean updated) {
    attemptAttacking = updated;
  }
}

