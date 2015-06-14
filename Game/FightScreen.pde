public class FightScreen {
  PImage heroDefendingImage, enemyDefendingImage, backgroundImage, heartImage, halfHeartImage, emptyHeartImage;
  int a = 0;
  long nextMovement;
  public FightScreen(Dungeon dungeon) {
    heroDefendingImage = loadImage("heroDefending.png");
    enemyDefendingImage = loadImage("enemyDefending.png");
    backgroundImage = loadImage("background.png");
    heartImage = loadImage("heart.png");
    halfHeartImage = loadImage("halfHeart.png");
    emptyHeartImage = loadImage("emptyHeart.png");
    nextMovement = 1000;
  }

  public void draw() {
    //image(backgroundImage,0,0);
    image(heroDefendingImage, 100, 420);
    image(enemyDefendingImage, 500, 400, 233, 300);
    float i = 0;
    while (i < dungeon.getHero ().maxHealth / 2) {
      if (i + 0.5 == dungeon.getHero().getHealth() / 2.0) {
        image(halfHeartImage, 300 + 40 * i, 400, 30, 30);
      } else {
        if (i < dungeon.getHero().getHealth() / 2) {
          image(heartImage, 300 + 40 * i, 400, 30, 30);
        } else {
          image(emptyHeartImage, 300 + 40 * i, 400, 30, 30);
        }
      }
      i = i + 1;
    }
  }
}

