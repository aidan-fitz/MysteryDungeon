/**
 * A single class to throw all our sprites and soundtracks in (like R.java in Android apps)
 * so we can load once, use anytime, anywhere.
 */
public class SpriteSet {

  public final PImage heroSprite, enemySprite, heroDefendingImage, enemyDefendingImage, backgroundImage, heartImage, halfHeartImage, emptyHeartImage, wallImage, groundImage, stairsImage, gameOverImage, startScreenImage;
  
  // Audio
  private Minim dj;
  private AudioPlayer titleTheme, dungeonTheme, battleTheme;

  public SpriteSet() {
    // Sprites
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
    
    // Soundtracks
    dj = new Minim(Game.this);
    titleTheme = dj.loadFile("uptown-funk.mp3", 2048);
    dungeonTheme = dj.loadFile("lavender-town.mp3", 2048);
    battleTheme = dj.loadFile("battle.mp3", 2048);
  }
  
  public void bg() {
    background(backgroundImage);
  }
  
  public void startTitleTheme() {
    dungeonTheme.pause();
    battleTheme.pause();
    titleTheme.loop();
  }
  
  public void startDungeonTheme() {
    titleTheme.pause();
    battleTheme.pause();
    dungeonTheme.loop();
  }
  
  public void startBattleTheme() {
    titleTheme.pause();
    dungeonTheme.pause();
    battleTheme.loop();
  }
  
  public void pauseAll() {
    titleTheme.pause();
    dungeonTheme.pause();
    battleTheme.pause();
  }
  
}

