public class Creature {
  private Dungeon dungeon;
  private int health;
  private int x, y; //position in the floor map
  private int level;
  private boolean enemy;
  long nextMovement;
  PImage enemyImage, heroImage; 

  public Creature(int health, int x, int y, Dungeon dungeon, boolean enemy) {
    this.x = x;
    this.y = y;
    this.health = health;
    this.dungeon = dungeon;
    this.enemy = enemy;
    enemyImage = loadImage("enemy.png");
    heroImage = loadImage("hero.png");
    nextMovement = millis() + 1000;
  }

  public int getHealth() {
    return health;
  }

  public void setHealth(int health) {
    this.health = health;
  }

  public void move() {
    float distance = dist(x, y, dungeon.getHero().getX(), dungeon.getHero().getY());
    if (distance < 1) {
      dungeon.setAttacking(true);
    }
    if (distance < 10) {
      targetedMove();
    } else {
      randomMove();
    }
  }

  public void targetedMove() {
    if (millis() % 10 == 0) {
      if (x > dungeon.getHero().getX()) {
        if (dungeon.getFloor().getTile(x - 1, y).canWalk()) {
          moveX(-1);
        }
      }
      if (x < dungeon.getHero().getX()) {
        if (dungeon.getFloor().getTile(x + 1, y).canWalk()) {
          moveX(1);
        }
      }
      if (y > dungeon.getHero().getY()) {
        if (dungeon.getFloor().getTile(x, y - 1).canWalk()) {
          moveY(-1);
        }
      }
      if (y < dungeon.getHero().getY()) {
        if (dungeon.getFloor().getTile(x, y + 1).canWalk()) {
          moveY(1);
        }
      }
    }
  }

  public void randomMove() {
    if (millis() >= nextMovement) {
      nextMovement = millis() + 1000;
      Random rand = new Random();
      int randomNum = rand.nextInt(4);
      if (randomNum == 0) {
        if (dungeon.getFloor().getTile(x - 1, y).canWalk()) {
          moveX(-1);
        }
      }
      if (randomNum == 1) {
        if (dungeon.getFloor().getTile(x + 1, y).canWalk()) {
          moveX(1);
        }
      }
      if (randomNum == 2) {
        if (dungeon.getFloor().getTile(x, y - 1).canWalk()) {
          moveY(-1);
        }
      }
      if (randomNum == 3) {
        if (dungeon.getFloor().getTile(x, y + 1).canWalk()) {
          moveY(1);
        }
      }
    }
  }

  public void moveX(int distance) { //negative is left
    x += distance;
  }

  public void moveY(int distance) { //negative is up
    y += distance;
  }

  public int getX() {
    return x;
  }

  public int getY() {
    return y;
  }

  public void setXY(int x, int y) {
    this.x = x;
    this.y = y;
  }

  public void draw() {
    imageMode(CORNER);
    if (enemy) {
      move();
      image(enemyImage, x * 20, x * 20, 20, 20);
    } else {
      image(heroImage, x * 20, y * 20, 20, 20);
    }
  }
}

