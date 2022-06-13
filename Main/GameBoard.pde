import java.util.*;
import java.io.*;

public class GameBoard {
  
  String[][] data = new String[30][30];
  int pellets = 0; 
  
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
        if (data[j][i].equals("1")) { 

          fill(0, 0, 255); // blue
          pushStyle();
          stroke(0, 0, 255);
          strokeWeight(6);
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
        if (data[j][i].equals("2")) {
          fill(255,153,153);
          noStroke();
          square(20 * i + 10, 20 * j + 10, 4);
        }      
        if (data[j][i].equals("3")) {
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
    if (data[j][i].equals("3")) {
      player.getEnergizer();
      player.score += 50;
    }
    data[j][i] = "0";
    player.score += 10;
    pellets --;
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
  
  void loadGameBoard (String[][] level) {
    for (int j = 0; j < 30; j++) {
      for (int i = 0; i < 30; i ++) {
        data[j][i] = level[j][i];
      }
    }
    countPellets();
  }
  
  boolean killAt (float ix, float iy) {
    int i = int (ix/20);
    int j = int (iy/20);
    int pi = int (player.x/20);
    int pj = int (player.y/20);
    if (i == pi && j == pj) {
      if (player.isEnergized) {
        player.score += 200;
        return true;
      } else {
        player.die();
      }
    }
    return false;
  }
 

  int countPellets () {
    for (int j = 0; j < 30; j ++) {
      for (int i = 0; i < 30; i ++) {
        if ((data[j][i].equals("3") || data[j][i].equals("2"))) {
          pellets ++;
        }
      }
    }
    return pellets;
  }
  
  void clearPellets () {
    for (int j = 0; j < 30; j ++) {
      for (int i = 0; i < 30; i ++) {
        if ((data[j][i].equals("3") || data[j][i].equals("2"))) {
          data[j][i] = "0";
        }
      }
    }
    pellets = 0;
  }
  
}
