public class PacMan implements Entity {
  
  PImage spriteDefault;
  PImage spriteRight;
  PImage spriteLeft;
  PImage spriteUp;
  PImage spriteDown;
  MazeTile startPos;
  int x,y;
  int counter;
  int pelletsEaten;
  double dx,dy = 4;
  String direction;
  boolean isEnergized;
  int lives = 3;
  
  int getX() {
    return x;
  }
  
  int getY() {
    return y;
  }
  
  void setX (int x_) {
    x = x_;
  }
  
  void setY (int y_) {
    y = y_;
  }
  
  void setDirection (String direction_) {
    direction = direction_;
  }
  
  void moveUp () {
    y += dy;
  }
  
  void moveDown() {
    y -= dy;
  }
  
  void moveLeft() {
    x -= dx;
  }
  
  void moveRight() {
    x += dx;
  }
  
  void respawn() {
    lives = 3;
    
  }
  
  void display() {
    spriteDefault = loadImage("pacman.png");
    spriteRight = loadImage("pacmanRight.gif");
    spriteLeft = loadImage("pacmanLeft.gif");
    spriteUp = loadImage("pacmanUp.gif");
    spriteDown = loadImage("pacmanDown.gif");
  }
  
  void isFacingWall() {
    
  }
  
  
  
}
