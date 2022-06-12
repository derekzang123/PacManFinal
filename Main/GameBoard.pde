public class GameBoard {
  
  String[][] data = new String[30][30];
  
  GameBoard () {
    for (int j = 0; j < 30; j ++) {
      for (int i = 0; i < 30; i ++) {
        data[j][i] = "2";
        int randBlock = (int)(Math.random() * 4);
        data[j][i] = str(randBlock);
        //make walls
        if (i == 0 || j == 0 || i == 29 || j == 29) {
          data[j][i] = "1";
        }
      }
    }
    data[5][10] = "3";
  }
  
  void draw () {
    for (int j=0; j<width/20; j++) {
      for (int i=0; i<height/20; i++) {
        noFill();      
        if (data[j][i].equals( "1")) { 

          fill(0, 0, 255); // blue
          pushStyle();
          stroke(0, 0, 255);
          strokeWeight(12);
          pushMatrix();
          translate(20*i, 20*j);
          line(10, 10, 10, 10);
          if (i<29 && data[j][i+1].equals("1")) {
            line(10, 10, 30, 10);
          }
          if (j<29 && data[j+1][i].equals("1")) {
            line(10, 10, 10, 30);
          }
          popMatrix();
          popStyle();
        }
        if (data[j][i] .equals( "2")) {
          fill(255,153,153);
          noStroke();
          square(20 * i + 10, 20 * j + 10, 4);
        }      
        if (data[j][i] .equals( "3")) {
          fill(255,153,153);
          noStroke();
          ellipse(20*i+10, 20*j+10, 10, 10);
        }
      }
    }
  }
  
  boolean isWall (float ix, float iy) {
    int i = int (ix/20);
    int j = int (iy/20);
    return (data[j][i].equals("1"));
  }
  
  void eatDotAt (float ix, float iy) {
    int i = int (ix/20);
    int j = int (iy/20);
    if (data[j][i]. equals(  "3")) {
      player.getEnergizer();
    }
    data[j][i] = "0";
  }
  
  void editGameBoard (int ix, int iy) {
    int i = int (ix/20);
    int j = int (iy/20);
    data[j][i] = str(int((data[j][i]) + 1) % 4);
  }
  
  void saveGameBoard () {
    String[] temp = new String[30];
    for (int j = 0; j < 30; j ++) {
      temp[j] = "";
      for (int i = 0; i < 30; i ++) {
        temp[j] += data[j][i];
      }
    }
    saveStrings("world.dat",temp);
    println("gameboard saved");
  }
  
  void loadGameBoard () {
    if (data != null) {
      for (int j = 0; j < 30; j ++) {
        for (int i = 0; i < 30; i ++) {
          data[j][i] = data[j][i];
        }
      }
    }
    println("gameboard loaded");
  }
  
  boolean killAt (float ix, float iy) {
    int i = int (ix/20);
    int j = int (iy/20);
    int pi = int (player.x/20);
    int pj = int (player.y/20);
    if (i == pi && j == pj) {
      if (player.isEnergized) {
        return true;
      } else {
        player.die();
      }
    }
    return false;
  }
  
  void onKeyPressed () {
    if (key == 'k') {
      saveGameBoard();
    }
    if (key == 'l') {
      loadGameBoard();
    }
  }
}
