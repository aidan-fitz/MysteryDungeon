    public class Hero extends Creature{
        long nextMovement;
        boolean attemptAttacking;
        public Hero(int health, int r, int c, color creatureColor, Dungeon dungeon, Boolean enemy){
            super(health, r, c, dungeon, enemy);
            nextMovement = millis() + 120;
            attemptAttacking = false;
        }
        
        public void processKeys(boolean isUp, boolean isDown, boolean isRight, boolean isLeft, boolean isSpace) {
          if (millis() >= nextMovement){
            nextMovement = millis() + 120;
            if (isUp) {
              if(dungeon.getFloor().getTile(getX(), getY() - 1).canWalk()){
              moveY(-1);
              }
          }
          if (isDown) {
             if(dungeon.getFloor().getTile(getX(), getY() + 1).canWalk()){
            moveY(1);
             }
          }
          if (isLeft) {
            if(dungeon.getFloor().getTile(getX() - 1, getY()).canWalk()){
            moveX(-1);
            }
          }
          if (isRight) {
            if(dungeon.getFloor().getTile(getX() + 1, getY()).canWalk()){
            moveX(1);
            }
          }
          if (isSpace){
            attemptAttacking = true;
          }
        }
        }
        public boolean getAttemptAttacking(){
          return attemptAttacking;
        }
        public void setAttemptAttacking(boolean updated){
          attemptAttacking = updated;
        }
    }
