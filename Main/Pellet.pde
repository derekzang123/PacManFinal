public class Pellet {
  
  MazeTile position;
  int posX,posY;
  
  public Pellet (int posX_, int posY_) {
    posX = posX_
    posY = posY_
    position = new MazeTile(posX,posY);
  }
  
  void display () {
    //draw pellet
    square (8 * posX + 3, 8 * posY + 3, 2);
    fill(255, 153, 153);
  }
  
  void clear () {
    //clear pellet when eaten
  }
  
}
