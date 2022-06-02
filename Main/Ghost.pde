public class Ghost implements Entity {

  int ghostType;
  float x, y, targetX, targetY;
  float prevGhostX, prevGhostY, prevTargetX, prevTargetY;
  float dx, dy;
  int mode;
  int direction;
  boolean isScared;
  boolean isDead;
  int trapTimer;
  color[] ghost_colors = {
    color(255, 0, 0), 
    color(255, 64, 196), 
    color(0, 255, 255), 
    color(255, 128, 0), 
    color(0, 255, 0), 
  };
  PacMan player;

  Ghost (int type) {
    ghostType = type % 5;
    x = 310;
    y = 290;
    targetX = x;
    targetX = y;
    prevTargetX = targetX;
    prevTargetY = targetY;
    trapTimer = 200 * type;
  }

  float getX () {
    return x;
  }
  float getY () {
    return y;
  }

  void setX (float x_) {
    x = x_;
  }
  void setY (float y_) {
    y = y_;
  }
  void setDirection (int dir) {
    direction = dir;
  }

  void moveUp () {
    y -= dy;
  }

  void moveDown() {
    y += dy;
  }

  void moveLeft() {
    x -= dx;
  }

  void moveRight() {
    x += dx;
  }

  void notAfraid () {
    if (isScared) {
      isScared = false;
      direction = (direction+2)%4;
      targetX = prevTargetX;
      targetY = prevTargetY;
    }
  }

  void Afraid () {
    if (! isDead) {
      isScared = true;
      direction = (direction+2)%4;
      targetX = prevTargetX;
      targetY = prevTargetY;
    }
  }

  void draw () {
    simulate();
    render();
    if (! isDead) {
      checkDead();
    }
  }

  void simulate () {
    trapTimer --;
    float prevX = x;
    float prevY = y;
    if (targetX < x) {
      x -= dx;
    }
    if (targetX > x) {
      x += dx;
    }
    if (targetY < y) {
      y -= dx;
    }
    if (targetY > y) {
      y += dx;
    }
    if (prevX == x && prevY == y) {
      prevTargetX = targetX;
      prevTargetY = targetY;
      int walls = 0;
      for (int i = 0; i < 4; i ++) {
        if (GameBoard.isWall(x+decodeX[i], y + decodeY[i])) {
          walls ++;
        }
      }
      if (walls == 4) {
        direction = 4;
        targetX = x + decodeX[direction];
        targetY = y + decodeY[direction];
        return;
      }
      if (walls == 3) {
        for (int i = 0; i < 4; i ++) {
          if !(GameBoard.isWall(x + decodeX[i], y + decodeY[i]) {
            direction = i;
          }
        }
        targetX = x + decodeX[direction];
        targetY = y + decodeY[direction];
        return;
      }
      if (walls == 2) {
        int res = 5;
        for (int i = 0; i < 4; i ++) {
          if !(GameBoard.isWall(x + decodeX[i], y + decodeY[i]) {
            if (w != (direction + 2) % 4) {
              res = i;
            }
          }
        }
        direction = res;
        targetX = x + decodeX[direction];
        targetY = y + decodeY[direction];
        return;
      }
      player = new PacMan();
      //-----RED-----
      int ghostX = int(player.x);
      int ghostY = int(player.y);
      if (!toCorners) {
        //-----PINK-----
        if (type == 1) {
        ghostX = int(player.x) + 4 * decodeX[player.direction];
        ghostY = int(player.y) + 4 * decodeY[player.direction];
        if (player.direction == 3) {
          ghostX = int(player.x - 80);
        }
      }
      //-----CYAN-----
      if (type == 2) {
        float mPlayerX = player.x + 2 * decodeX[player.direction];
        float mPlayery = player.y + 2 * decodeY[player.direction];
        if (player.direction == 3) {
          mPlayerX = player.x - 40;
        }
        ghostX = int(2 * mPlayerX - GameBoard.ghosts[0].x);
        ghostY = int(2 * mPlayerX - GameBoard.ghosts[0].y);
        //offset Red's movements by a bit
      }
     //-----ORANGE-----
     if (type == 3) {
       if (dist(player.x,player.y,x,y) < 160) {
         ghostX = 0;
         ghostY = height;
       }
     }
    } else {
      ghostX = width;
      ghostY = height;
      if (type == 1 || type == 3) {
        ghostX = 0;
      }
      if (type == 1 || type == 0) {
        ghostY = 0;
      }
      if (isDead || isScared) {
        
      }
    }
  }
}
