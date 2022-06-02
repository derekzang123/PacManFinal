public class Ghost implements Entity {

  int type;
  float x, y, targetX, targetY;
  float prevGhostX, prevGhostY, prevTargetX, prevTargetY;
  float dx = 1.5, dy = 1.5;
  int direction;
  boolean isScared;
  boolean isDead;
  int trapTimer;
  color[] ghostColors = {
    color(255, 0, 0), 
    color(255, 64, 196), 
    color(0, 255, 255), 
    color(255, 128, 0), 
    color(0, 255, 0), 
  };

  Ghost (int itype) {
    type = itype % ghostColors.length;
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
    if (!isDead) {
      isScared = true;
      direction = (direction+2)%4;
      targetX = prevTargetX;
      targetY = prevTargetY;
    }
  }

  void draw () {
    simulate();
    render();
    if (!isDead) {
      checkDead();
    }
  }

  void simulate () {
    trapTimer --;
    if (trapTimer > 0) {
      return;
    }
    float prevX = x;
    float prevY = y;
    if (targetX < x) {
      moveLeft();
    }
    if (targetX > x) {
      moveRight();
    }
    if (targetY < y) {
      moveUp();
    }
    if (targetY > y) {
      moveDown();
    }
    if (prevX == x && prevY == y) {
      prevTargetX = targetX;
      prevTargetY = targetY;
      int walls = 0;
      for (int i = 0; i < 4; i ++) {
        if (grid.isWall(x+decodeX[i], y + decodeY[i])) {
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
          if (!grid.isWall(x + decodeX[i], y + decodeY[i])) {
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
          if (!(grid.isWall(x + decodeX[i], y + decodeY[i]))) {
            if (i != (direction + 2) % 4) {
              res = i;
            }
          }
        }
        direction = res;
        targetX = x + decodeX[direction];
        targetY = y + decodeY[direction];
        return;
      }
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
          float mPlayerY = player.y + 2 * decodeY[player.direction];
          if (player.direction == 3) {
            mPlayerX = player.x - 40;
          }
          ghostX = int(2 * mPlayerX - ghosts[0].x);
          ghostY = int(2 * mPlayerY - ghosts[0].y);
          //offset Red's movements by a bit
        }
        //-----ORANGE-----
        if (type == 3) {
          if (dist(player.x, player.y, x, y) < 160) {
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
          ghostX = 310;
          ghostY = 310;
          if (isDead && x == ghostX && y == ghostY) {
            isDead = false;
          }
        }
        prevGhostX = ghostX;
        prevGhostY = ghostY;
        float best = -1;
        int res = 5;
        for (int i = 0; i < 4; i ++) {
          if (i != (direction + 2)%4 && !grid.isWall(x + decodeX[i], y + decodeY[i])) {
            float newDistance = dist(x + decodeX[i], y + decodeY[i], ghostX, ghostY);
            if (best == -1 || newDistance < best) {
              best = newDistance;
              res = i;
            }
          }
        }
        direction = res;
        targetX = x + decodeX[direction];
        targetY = y + decodeY[direction];
        return;
      }
    }
  }


  void render () {
    stroke(0);
    fill(isScared?color(0, 0, 255):ghostColors[type]);
    pushMatrix();
    translate(x, y);
    if (!isDead) {
      rect(-11, -1, 22, 11); 
      arc(0, 0, 22, 22, PI, TWO_PI);
      for (int i = 0; i < 4; i ++) {
        arc(-7 + 5 * i, 10, 5, 5, 0, PI);
      }
    }
    fill(255);
    noStroke();
    ellipse(-4, 0, 4, 8);
    ellipse(4, 0, 4, 8);
    if (isDead || ! isScared) {
      fill(0, 0, 255);
      int eyex = (direction==2?-1:0)+(direction==0?1:0);
      int eyey = (direction==3?-3:0)+(direction==1?3:0);
      ellipse(-4+eyex, eyey, 3, 3);
      ellipse(4+eyex, eyey, 3, 3);
    }
    popMatrix();
  }

  void checkDead () {
    if (grid.killAt(x, y)) {
      isDead = true;
    }
  }
}
