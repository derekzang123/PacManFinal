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
  
  void setY (int y_) {
    y = y_;
  }
  
  void setX (int x_) {
    x = x_;
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
  
  void display() {
    spriteDefault = loadImage("pacman.png");
    image(spriteDefault,x,y);
  }
  
  void displayRight () {
    spriteRight = loadImage("pacmanRight.gif");
    image(spriteRight,x,y);
  }
  
  void displayLeft () {
    spriteLeft = loadImage("pacmanLeft.gif");
    image(spriteLeft,x,y);
  }
  
  void displayUp () {
    spriteUp = loadImage("pacmanUp.gif");    
    image(spriteUp,x,y);
  }
  
  void displayDown () {
   spriteDown = loadImage("pacmanDown.gif");
   image(spriteDown,x,y);
  }
  
  void respawn () {
    lives = 3;
    //paint default image in starting spot
  }
  
  boolean hasEnergizer () {
    return isEnergized;
  }
  
  void getEnergizer () {
    isEnergized = true;
  }
  
  int getPelletsEaten () {
    return pelletsEaten;
  }
}
