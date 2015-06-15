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
    drawHearts(dungeon.getCreatureInFight(), 15, false);
    drawHearts(dungeon.getHero(), 20, true);
    if (millis() < nextStartRound) {
      System.out.println("after attack " + heroEnergyBeingUsed + " " + enemyEnergyBeingUsed + " " + damageDealt + " " + enemyHurt);
    } else {
      System.out.println("waiting for space " + heroEnergyBeingUsed + " / " + dungeon.getHero().getEnergy() + " " + dungeon.getHero().getHealth() + " " + dungeon.getCreatureInFight().getHealth());
      text("Press space to ", 80, 50);
      if (heroEnergyBeingUsed == 0) {
        text("defend", 200, 50);
      } else {
        text("attack with " + (int)heroEnergyBeingUsed + " energy", 200, 50);
      }
      text("Press up and down arrows to change attack energy", 50, 100);
    }
  }
  void drawHearts(Creature creature, int maxHealth, boolean isHero) {
    float i = 0;
    while (i < maxHealth / 2) {
      if (i + 0.5 == creature.getHealth() / 2.0) {
        if (isHero) {
          image(R.halfHeartImage, 90 + 30 * i, 330, 30, 30);
        } else {
          image(R.halfHeartImage, 600 + 30 * i, 330, 30, 30);
        }
      } else {
        if (i < creature.getHealth() / 2) {
          if (isHero) {
            image(R.heartImage, 90 + 30 * i, 330, 30, 30);
          } else {
            image(R.heartImage, 600 + 30 * i, 330, 30, 30);
          }
        } else {
          if (isHero) {
            image(R.emptyHeartImage, 90 + 30 * i, 330, 30, 30);
          } else {
            image(R.emptyHeartImage, 600 + 30 * i, 330, 30, 30);
          }
        }
      }
      i = i + 1;
    }
  }
  void executeRound() { //takes the energy of both attacks, computes damage
    if (dungeon.getCreatureInFight().getEnergy() < 2.5) {
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
    if ( dungeon.getHero().getEnergy() + dungeon.getHero().getEnergy() / 2 <= 10) {
      dungeon.getHero().setEnergy( dungeon.getHero().getEnergy() + (10 - dungeon.getHero().getEnergy()) / 2);
    } else {
      dungeon.getHero().setEnergy(10);
    }
    if (dungeon.getCreatureInFight().getEnergy() + dungeon.getCreatureInFight().getEnergy() / 2 <= 10) {
      dungeon.getCreatureInFight().setEnergy( dungeon.getCreatureInFight().getEnergy() + ( 10 - dungeon.getCreatureInFight().getEnergy()) / 2);
    } else {
      dungeon.getCreatureInFight().setEnergy(10);
    }
    if (enemyHurt) {
      dungeon.getCreatureInFight().setHealth(dungeon.getCreatureInFight().getHealth() - damageDealt);
      if (dungeon.getCreatureInFight().getHealth() <= 0) {
        dungeon.removeEnemy(dungeon.getCreatureInFight());
        dungeon.setCreatureInFight(null);
        dungeon.setInCombat(false);
      }
    } else {
      dungeon.getHero().setHealth(dungeon.getHero().getHealth() - damageDealt);
      if (dungeon.getHero().getHealth() <= 0) {
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
          if (heroEnergyBeingUsed + 1 <= dungeon.getHero().getEnergy()) {
            heroEnergyBeingUsed = heroEnergyBeingUsed + 1;
          }
        }
        if (isDown) {
          if (heroEnergyBeingUsed - 1 >= 0) {
            heroEnergyBeingUsed = heroEnergyBeingUsed - 1;
          }
        }  
        if (isSpace) {
          dungeon.getHero().setEnergy(dungeon.getHero().getEnergy() - heroEnergyBeingUsed);
          dungeon.getCreatureInFight().setEnergy(dungeon.getCreatureInFight().getEnergy() - heroEnergyBeingUsed);
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

