public class PacMan implements Entity {

  MazeTile startPos;
  double x,y;
  int counter;
  int pelletsEaten;
  double dx,dy = 4;
  String direction;
  boolean isEnergized;
  
  int getX() {
    return x;
  }
  
  int getY() {
    return y;
  }
  
  void setX (x_) {
    x = x_
  }
  
  void setY (y_) {
    y = y_
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
    
  }
  
  void display() {
    //draw PacMan sprite
  }
  
  void isFacingWall() {
    
  }
  
  
  
}
