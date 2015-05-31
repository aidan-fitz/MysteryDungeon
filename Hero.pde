    public class Hero extends Creature{
        long nextMovement;
        
        public Hero(int health, int level, int r, int c, color creatureColor){
            super(health, level, r, c, creatureColor);
            nextMovement = millis() + 50;
        }
        
        public void processKeys(boolean isUp, boolean isDown, boolean isRight, boolean isLeft) {
          if (millis() >= nextMovement){
            nextMovement = millis() + 50;
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
        }
      }
    }
