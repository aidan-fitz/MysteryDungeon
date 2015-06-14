public class Creature {
  private Dungeon dungeon;
  private double health, energy;
  private int x, y; //position in the floor map
  private int level;
  private boolean enemy;
  Random rng;
  long nextMovement;
  PImage enemyImage, heroImage; 

  public Creature(double health, double energy, int x, int y, Dungeon dungeon, boolean enemy, Random rng) {
    this.x = x;
    this.y = y;
    this.health = health;
    this.dungeon = dungeon;
    this.enemy = enemy;
    this.rng = rng;
    this.energy = energy;
    enemyImage = loadImage("enemy.png");
    heroImage = loadImage("hero.png");
    nextMovement = millis() + 1000;
  }

  public Floor.Tile getTile() {
    return dungeon.getFloor().getTile(x, y);
  }
  public Floor.Tile getTileUp() {
    return dungeon.getFloor().getTile(x, y-1);
  }
  public Floor.Tile getTileDown() {
    return dungeon.getFloor().getTile(x, y+1);
  }
  public Floor.Tile getTileLeft() {
    return dungeon.getFloor().getTile(x-1, y);
  }
  public Floor.Tile getTileRight() {
    return dungeon.getFloor().getTile(x+1, y);
  }


  public float distTo(Creature other) {
    return dist(x, y, other.x, other.y);
  }

  public double getHealth() {
    return health;
  }

  public void setHealth(double health) {
    this.health = health;
  }

  public double getEnergy() {
    return energy;
  }

  public void setEnergy(double energy) {
    this.energy = energy;
  }

  public void move() {
    float distance = dist(x, y, dungeon.getHero().getX(), dungeon.getHero().getY());
    System.out.println(distance);
    if (distance < 2) {
      dungeon.setCreatureInFight(this);
    } else {
      if (millis() >= nextMovement) {
        nextMovement = millis() + 1000;
        if (distance < 10) {
          targetedMove();
        } else {    
          randomMove();
        }
      }
    }
  }

  public void targetedMove() {
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

  public void randomMove() {
    int randomNum = rng.nextInt(4);
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
      image(enemyImage, x * 20, y * 20, 20, 20);
    } else {
      image(heroImage, x * 20, y * 20, 20, 20);
    }
  }
}

