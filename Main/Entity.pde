interface Entity {
  
  float getX();
  float getY();
  void setY(float y);
  void setX(float x);
  void setDirection(int dir);
  void moveUp();
  void moveDown();
  void moveLeft();
  void moveRight();
  void respawn();
  void simulate();
  void render();
  
}
