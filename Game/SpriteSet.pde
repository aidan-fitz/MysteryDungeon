/**
 * A single class to throw all our sprites in (like R.java in Android apps)
 * so we can load once, use anytime, anywhere.
 */
public class SpriteSet {

  public final PImage heroSprite, enemySprite, heroDefendingImage, enemyDefendingImage, backgroundImage, heartImage, halfHeartImage, emptyHeartImage, wallImage, groundImage, stairsImage, gameOverImage, startScreenImage;

  public SpriteSet() {
    enemySprite = loadImage("enemy.png");
    heroSprite = loadImage("hero.png");
    heroDefendingImage = loadImage("heroDefending.png");
    enemyDefendingImage = loadImage("enemyDefending.png");
    backgroundImage = loadImage("background.png");
    heartImage = loadImage("heart.png");
    halfHeartImage = loadImage("halfHeart.png");
    emptyHeartImage = loadImage("emptyHeart.png");
    wallImage = loadImage("wall.png");
    groundImage = loadImage("ground.png");
    stairsImage = loadImage("stairs2.png"); // stairs.png is upward staircase - both sprites (c) Pokemon/Nintendo
    gameOverImage = loadImage("gameOver.png");
    startScreenImage = loadImage("startScreen.png");
  }
  
  public void bg() {
    background(backgroundImage);
  }
}

