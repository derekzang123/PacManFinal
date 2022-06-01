public class Pellet {
  
  MazeTile position;
  int posX,posY;
  
  public Pellet (int posX_, int posY_) {
    posX = posX_;
    posY = posY_;
    position = new MazeTile(posX,posY);
  }
  
  void display () {
    //draw pellet
    square (22 * posX + 9, 22 * posY + 9, 4);
    fill(255, 153, 153);
  }
  
  void clear () {
    fill(0);
  }
  
}
