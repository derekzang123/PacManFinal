public class MazeTile {
  
  final int squaresize = 22;
  int boardX, boardY;
    
  public MazeTile (int boardX_, int boardY_) {
    boardX = boardX_;
    boardY = boardY_;
  }
  
  void display () {
    square(boardX*squaresize, boardY*squaresize, squaresize);
  }
  
}
