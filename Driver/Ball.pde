public class Ball {
  private float x, y;
  public float r;
  private color c;
  public Ball(float x, float y) {
    r = 20.0;
    this.x = x;
    this.y = y;
    c = color(100, 100, 100);
  } 
  public void randomColor() {
    c = color(random(255), random(255), random(255));
  }

  public void draw() {
    stroke(0);
    fill(c);
    ellipse(x, y, r*2, r*2);
  }

  public float getX() {
    return x;
  }
  public float getY() {
    return y;
  }

  public void setX(float newx) {
    x = newx;
  }
  public void setY(float newy) {
    y = newy;
  }
  public void fight(Ball other){
    if (dist(this.getX(), this.getY(), other.getX(), other.getY()) < 100){
      other.randomColor();
    }
  }
}
