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
  
  void display () {
    for (int j=0; j<height/20; j++) {
      for (int i=0; i<width/20; i++) {
        noFill();      
        if (data[j][i].equals( "1")) { 

          fill(0, 0, 255); // blue
          pushStyle();
          stroke(0, 0, 255);
          //stroke(0, 255-map(dist(player.x,player.y,20*i,20*j),0,200,0,255), 255 );
          strokeWeight(12);
          pushMatrix();
          translate(20*i, 20*j);
          line(10, 10, 10, 10);
          if (i<29 && data[j][i+1] .equals(  "1")) {
            line(10, 10, 30, 10);
          }
          if (j<29 && data[j+1][i] .equals(  "1")) {
            line(10, 10, 10, 30);
          }
          popMatrix();
          popStyle();
        }
        if (data[j][i] .equals( "2")) {
          fill(196);
          noStroke();
          ellipse(20*i+10, 20*j+10, 6, 6);
        }      
        if (data[j][i] .equals( "3")) {
          fill(255);
          noStroke();
          ellipse(20*i+10, 20*j+10, 12, 12);
        }
      }
    }
  }
  
  boolean isWall (float x, float y) {
    int x_ = int (x/20);
    int y_ = int (y/20);
    return data[x_][y_].equals("1");
  }
  
  void eatDotAt (float x, float y) {
    int x_ = int (x/20);
    int y_ = int (y/20);
    if (data[x_][y_].equals("3")) {
      data[x_][y_] = "0";
    }
  }
  
  void saveGameBoard () {
    String[] temp = new String[30];
    for (int i = 0; i < 30; i ++) {
      temp[i] = "";
      for (int j = 0; j < 30; j ++) {
        temp[i] += data[i][j];
      }
    }
    saveStrings("world",temp);
    println("gameboard saved");
  }
  
  void loadGameBoard () {
    String[] temp = loadStrings("world");
    if (temp != null) {
      for (int i = 0; i < 30; i ++) {
        for (int j = 0; j < 30; j ++) {
          data[i][j] = "" + temp[i].charAt(j);
        }
      }
    }
    println("gameboard loaded");
  }
  
  boolean deadAt (float x, float y) {
    int x_ = int (x/20);
    int y_ = int (y/20);
    int pX_ = int (player.x/20);
    int pY_ = int (player.y/20);
    if (x_ == pX_ && y_ == pY_) {
      if (player.isEnergized) {
        return false;
      } else {
        player.die();
      }
    }
    return true;
  }
  
  void keyPressed () {
    if (key == 's') {
      saveGameBoard();
    }
    if (key == 'l') {
      loadGameBoard();
    }
  }
}
