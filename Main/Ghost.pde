public class Ghost implements Entity{
  
  int ghostType;
  float x,y;
  float dx,dy,pdx,pdy,pgx,pgy;
  int mode;
  int direction;
  boolean isScared;
  boolean isDead;
  int trapTimer;
  
  float getX () {
    return x;
  }
  float getY () {
    return y;
  }
  
  void setX (int x_) {
    x = x_;
  }
  void setY (int y_) {
    y = y_;
  }
  void setDirection (int dir) {
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
