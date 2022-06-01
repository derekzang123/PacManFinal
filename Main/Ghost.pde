public class Ghost implements Entity{
  
  PImage sprite;
  PImage spriteFrightened;
  int x,y;
  int dx,dy;
  int mode;
  String direction;
  
  int getX () {
    return x;
  }
  int getY () {
    return y;
  }
  
  void setX (int x_) {
    x = x_;
  }
  void setY (int y_) {
    y = y_;
  }
  void setDirection (String dir) {
    direction = dir;
  }
  
  void moveUp () {
    y -= dy;
  }
  
  void moveDown() {
    y += dy;
  }
  
  void moveLeft() {
    x -= dx;
  }
  
  void moveRight() {
    x += dx;
  }
  
  void respawn() {
  }
  
  void display () {
    sprite = loadImage("ghost.png");
    image(sprite,x,y);
  }
  
   boolean isFacingWall (double x, double y, String dir) {
     
   }
   
   boolean isAtIntersection (double x, double y, String dir) {
     
   }
   
   boolean validMove (double x, double y) {
     
   }
   
   double getDistance (double x, double y, double x_, double y_) {
     
   }
   
   void moveChase () {
     
   }
}
