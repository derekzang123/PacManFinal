public class GameBoard {
  
  String[][] data = new String[30][30];
  
  GameBoard () {
    for (int i = 0; i < 30; i ++) {
      for (int j = 0; j < 30; j ++) {
        data[i][j] = "2";
        int randBlock = (int)(Math.random() * 4);
        data[i][j] = str(randBlock);
        //make walls
        if (i == 0 || i == j || i == 29 || j == 29) {
          data[i][j] = "1";
        }
      }
    }
    data[5][10] = "3";
  }
  
  void display ()
}
