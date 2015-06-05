    public class Hero extends Creature{
        long nextMovement;
        boolean attemptAttacking;
        public Hero(int health, int level, int x, int y, color creatureColor){
            super(health, level, x, y, creatureColor);
            nextMovement = millis() + 120;
            attemptAttacking = false;
        }
        
        public void processKeys(boolean isUp, boolean isDown, boolean isRight, boolean isLeft, boolean isSpace) {
          if (millis() >= nextMovement){
            nextMovement = millis() + 120;
            if (isUp) {
            moveV(-1);
          }
          if (isDown) {
            moveV(1);
          }
          if (isLeft) {
            moveH(-1);
          }
          if (isRight) {
            moveH(1);
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
