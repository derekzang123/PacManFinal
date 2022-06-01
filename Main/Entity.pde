interface Entity {
  
  int getX();
  int getY();
  void setY(int y);
  void setX(int x);
  void setDirection(String dir);
  void moveUp();
  void moveDown();
  void moveLeft();
  void moveRight();
  void respawn();
  void display();
  
}
