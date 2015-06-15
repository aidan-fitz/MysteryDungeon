public class FightScreen {

  long nextStartRound, nextPressKey;
  double heroEnergyBeingUsed, enemyEnergyBeingUsed, lastHeroEnergy, lastEnemyEnergy;
  int damageDealt;
  boolean enemyHurt;
  
  public FightScreen(Dungeon dungeon) {
    nextPressKey = millis();
    nextStartRound = millis();
  }

  public void draw() {
    R.bg();
    image(R.heroDefendingImage, 100, 420);
    image(R.enemyDefendingImage, 500, 400, 233, 300);
    float i = 0;
    while (i < dungeon.getHero ().maxHealth / 2) {
      if (i + 0.5 == dungeon.getHero().getHealth() / 2.0) {
        image(R.halfHeartImage, 300 + 40 * i, 400, 30, 30);
      } else {
        if (i < dungeon.getHero().getHealth() / 2) {
          image(R.heartImage, 100 + 30 * i, 300, 30, 30);
        } else {
          image(R.emptyHeartImage, 100 + 30 * i, 300, 30, 30);
        }
      }
      i = i + 1;
    }
    if (millis() < nextStartRound){
      System.out.println("after attack " + heroEnergyBeingUsed + " " + enemyEnergyBeingUsed + " " + damageDealt + " " + enemyHurt);  
    } else {
      System.out.println("waiting for space " + heroEnergyBeingUsed + " / " + dungeon.getHero().getEnergy() + " " + dungeon.getHero().getHealth() + " " + dungeon.getCreatureInFight().getHealth());
      text("Press space to ", 50, 50);
      if (heroEnergyBeingUsed == 0){
        text("defend", 200, 50);
      } else {
         text("attack with " + heroEnergyBeingUsed + " energy", 200, 50);
    }
    text("Press up and down arrows to change attack energy", 50, 100);
  }
  }
  void executeRound() { //takes the energy of both attacks, computes damage
    if (dungeon.getCreatureInFight().getEnergy() < 2.5){
      enemyEnergyBeingUsed = 0;
    } else {
      enemyEnergyBeingUsed = dungeon.getRNG().nextDouble() * (dungeon.getCreatureInFight().getEnergy() - 1) + 1;
    }
    if (heroEnergyBeingUsed == 0 && enemyEnergyBeingUsed == 0) {
      damageDealt = 0;
    }
    if (heroEnergyBeingUsed == 0 && enemyEnergyBeingUsed != 0) {
      damageDealt = 1;
      enemyHurt = false;
    }
    if (heroEnergyBeingUsed != 0 && enemyEnergyBeingUsed == 0) {
      damageDealt = 1;
      enemyHurt = true;
    }
    if (heroEnergyBeingUsed > enemyEnergyBeingUsed) {
      damageDealt = 2;
      enemyHurt = true;
    } else { 
      damageDealt = 2;
      enemyHurt = false;
    }
    if ( dungeon.getHero().getEnergy() + dungeon.getHero().getEnergy() / 2 <= 10){
      dungeon.getHero().setEnergy( dungeon.getHero().getEnergy() + dungeon.getHero().getEnergy() / 2);
    } else {
      dungeon.getHero().setEnergy(10);
    }
    if (dungeon.getCreatureInFight().getEnergy() + dungeon.getCreatureInFight().getEnergy() / 2 <= 10){
      dungeon.getCreatureInFight().setEnergy( dungeon.getCreatureInFight().getEnergy() + dungeon.getCreatureInFight().getEnergy() / 2);
    } else {
      dungeon.getCreatureInFight().setEnergy(10);
    }
    if(enemyHurt){
       dungeon.getCreatureInFight().setHealth(dungeon.getCreatureInFight().getHealth() - damageDealt);
       if (dungeon.getCreatureInFight().getHealth() <= 0){
         dungeon.removeEnemy(dungeon.getCreatureInFight());
         dungeon.setCreatureInFight(null);
         dungeon.setInCombat(false);
       }
    } else {
      dungeon.getHero().setHealth(dungeon.getHero().getHealth() - damageDealt);
      if (dungeon.getHero().getHealth() <= 0){
        dungeon.setCreatureInFight(null);
        dungeon.setHeroDead();
        dungeon.setInCombat(false);
       }
    }

  }

  void processKeys(boolean isUp, boolean isDown, boolean isSpace, boolean isF) {
    if (millis() >= nextStartRound) {
      if (millis() >= nextPressKey) {
        if (isUp) {
          if (heroEnergyBeingUsed + .1 <= dungeon.getHero().getEnergy()) {
            heroEnergyBeingUsed = heroEnergyBeingUsed + .1;
          }
        }
        if (isDown) {
          if (heroEnergyBeingUsed - .1 >= 0) {
            heroEnergyBeingUsed = heroEnergyBeingUsed - .1;
          }
        }  
        if (isSpace) {
          executeRound();
          lastHeroEnergy = heroEnergyBeingUsed;
          lastEnemyEnergy = enemyEnergyBeingUsed;
          heroEnergyBeingUsed = 0;
          enemyEnergyBeingUsed = 0;
          nextStartRound = millis() + 3000;
        }
        if (isF) {
          System.out.println("FLEE");
          dungeon.setInCombat(false);
        }
        nextPressKey = millis() + 100;
      }
    }
  }
}

