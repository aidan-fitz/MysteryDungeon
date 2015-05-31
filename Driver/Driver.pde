Ball player, enemy;
boolean isUp, isDown, isRight, isLeft, isSpace, isSpaceReleased;

void setup() {
  isSpaceReleased = true;
  size(200, 600);
  background(255);
  player = new Ball(width/2.0, 3*height/4.0);
  enemy = new Ball(width/2.0, 3*height/4.0);
}


void draw() {
  background(255);
  player.draw();
  fill(0);
  text(frameCount+"", 20, 20);
  processKeys();
  enemy.draw();
}

public void processKeys() {
  if (isUp) {
    player.setY(player.getY()-2.0);
  }
  if (isDown) {
    player.setY(player.getY() + 2.0);
  }
  if (isLeft) {
    player.setX(player.getX()-2.0);
  }
  if (isRight) {
    player.setX(player.getX()+2.0);
  }
  if (isSpace && isSpaceReleased) {
    isSpaceReleased = false; 
    //don't do this again until you release it
    player.fight(enemy);
  }
}

void keyReleased() {
  if (keyCode == 32) {//space
    isSpace = false;
    isSpaceReleased = true;
  }
  if (keyCode == 38) {//up
    isUp = false;
  }
  if (keyCode == LEFT){
    isLeft = false;
  }
  if (keyCode == RIGHT){
    isRight = false;
  }
  if (keyCode == DOWN){
    isDown = false;
  }
}

void keyPressed() {
  if (keyCode == 32) {//space
    isSpace = true;
  }
  if (keyCode == 38) {//up
    isUp = true;
  }
   if (keyCode == LEFT){
    isLeft = true;
  }
  if (keyCode == RIGHT){
    isRight = true;
  }
  if (keyCode == DOWN){
    isDown = true;
  }
}
