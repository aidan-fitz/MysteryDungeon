    public class Hero extends Creature{
        long nextMovement;
        boolean attemptAttacking;
        public Hero(int health, int level, int r, int c, color creatureColor, Dungeon dungeon){
            super(health, level, r, c, creatureColor, dungeon);
            nextMovement = millis() + 120;
            attemptAttacking = false;
        }
        
        public void processKeys(boolean isUp, boolean isDown, boolean isRight, boolean isLeft, boolean isSpace) {
          if (millis() >= nextMovement){
            nextMovement = millis() + 120;
            if (isUp) {
              if(dungeon.getFloor().getTile(getC(), getR() - 1).canWalk()){
              moveV(-1);
              }
          }
          if (isDown) {
             if(dungeon.getFloor().getTile(getC(), getR() + 1).canWalk()){
            moveV(1);
             }
          }
          if (isLeft) {
            if(dungeon.getFloor().getTile(getC() - 1, getR()).canWalk()){
            moveH(-1);
            }
          }
          if (isRight) {
            if(dungeon.getFloor().getTile(getC() + 1, getR()).canWalk()){
            moveH(1);
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
