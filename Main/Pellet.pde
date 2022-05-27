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
  }
  
  void clear () {
    //clear pellet when eaten
  }
  
}
