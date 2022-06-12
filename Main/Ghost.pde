public class Ghost implements Entity{

  int type;
  float x, y, targetX, targetY, prevTargetX, prevTargetY;
  int pgx, pgy;
  float dx = 1;
  float dy = 1;
  int direction;
  boolean isScared;
  boolean isDead;
  int trappedTimer;
  int killTimer = 50;
  color[] ghostColors = {
    color(255, 0, 0), 
    color(244, 194, 194), 
    color(0, 255, 255), 
    color(251, 191, 119), 
  };

  Ghost(int itype) {
    type = itype % ghostColors.length;
    x = 10 + 20 * 15;
    y = 10 + 20 * 14;
    targetX = x;
    targetY = y;
    prevTargetX=targetX;
    prevTargetY=targetY;
    trappedTimer = type * 50;
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

  void notAfraid() {
    if (isScared) {
      isScared = false;
      direction=(direction+2)%4;
      targetX = prevTargetX;
      targetY = prevTargetY;
    }
  }
  
  void Afraid() {
    if (!isDead) {
      isScared = true;
      direction=(direction+2)%4;
      targetX = prevTargetX;
      targetY = prevTargetY;
    }
  }  
  
  void draw() {
    simulate();
    render();
    if (!isDead) 
      killCheck();
  }
  
  void simulate() {
    trappedTimer--;
    if (trappedTimer > 0) return;
    float px = x;
    float py = y;
    if (targetX < x) 
      x -= dx;
    if (targetX > x) 
      x += dx;
    if (targetY < y) 
      y -= dy;
    if (targetY > y) 
      y += dy;;
    if (px==x&&py==y) {
      prevTargetX = targetX;
      prevTargetY = targetY;
      int walls = 0;
      for (int i = 0; i < 4; i++) {
        if ( grid.isWall(x+decodeX[i], y+decodeY[i]) ) {
          walls ++;
        }
      }
      if (walls == 4) {
        direction = 4;
        targetX = x+decodeX[direction];
        targetY = y+decodeY[direction];
        return;
      }
      if (walls == 3) {
        for (int i = 0; i < 4; i++) {
          if (!grid.isWall(x+decodeX[i], y+decodeY[i])) {
            direction = i;
          }
        }
        targetX = x+decodeX[direction];
        targetY = y+decodeY[direction];
        return;
      }
      if (walls == 2) {
        int result = 5;
        for (int i = 0; i < 4; i ++) {
          if ( !grid.isWall(x+decodeX[i], y+decodeY[i])) {
            if ( i != (direction+2)%4 ) {
              result = i;
            }
          }
        }
        direction = result;
        targetX = x+decodeX[direction];
        targetY = y+decodeY[direction];
        return;
      }
      int gx = int(player.x); 
      int gy = int(player.y);
      if (!toCorners) {
        if (type == 1 ) { // PINK = Get in front of pacman.
          gx = int(player.x)+4*decodeX[player.direction];
          gy = int(player.y)+4*decodeY[player.direction];
          if ( player.direction == 3 ) { // Classic pink ghost behaviour.
            gx = int(player.x-80);
          }
        }
        if ( type == 2 ) { // CYAN - Negative RED's positions, offset a couple of squares.
          float mpx = player.x+2*decodeX[player.direction];
          float mpy = player.y+2*decodeY[player.direction];
          if (player.direction == 3) { // Classic cyan ghost behaviour.
            mpx = player.x - 40;
          }
          gx = int(2*mpx - ghosts[0].x);
          gy = int(2*mpy - ghosts[0].y);
        }
        if ( type == 3 ) { // ORANGE - Get close, then back off.
          if (dist(player.x, player.y, x, y) < 160) {
            gx = 0;
            gy = height;
          }
        }
      } else {
        gx = width;
        gy = height;
        if ( type == 1 || type == 3 ) gx = 0; 
        if ( type == 1 || type == 0 ) gy = 0;
      }
      if (isDead||isScared) {
        gx = 310;
        gy = 290;
        if (isDead && (x >=gx - 40 && x <=gx+40) && (y>=gy-40 && y <= gy +40)) 
          isDead = false;
      }    
      pgx = gx;
      pgy = gy;
      float best = -1 ;
      int result = 5;
      for ( int w = 0; w < 4; w++) {
        if ( w!=(direction+2)%4 && !grid.isWall(x+decodeX[w], y+decodeY[w])) {
          float newDist = dist(x+decodeX[w], y+decodeY[w], gx, gy);
          if ( best == -1 || newDist < best) {
            best = newDist;
            result = w;
          }
        }
      }
      direction = result;
      targetX = x+decodeX[direction];
      targetY = y+decodeY[direction];
      return;
    }
  }
  
  void render() {
    stroke(0);
    fill(isScared?color(0, 0, 255):ghostColors[type]);
    pushMatrix();
    translate(x, y);
    if (!isDead) {
      rect(-11, -1, 22, 11);
      arc(0, 0, 22, 22, PI, TWO_PI);
      for (int i=0; i<4; i++) {
        arc(-7+5*i, 10, 5, 5, 0, PI);
      }
    }
    fill(255);
    noStroke();
    ellipse(-4, 0, 4, 8);
    ellipse(4, 0, 4, 8);
    if (isDead||!isScared) {
      fill(0, 0, 255);
      int eyex = (direction==2?-1:0)+(direction==0?1:0);
      int eyey = (direction==3?-3:0)+(direction==1?3:0);
      ellipse(-4+eyex, eyey, 3, 3);
      ellipse(4+eyex, eyey, 3, 3);
    }
    popMatrix();
  }
  
  void killCheck() {
    if (grid.killAt(x, y)) {
      isDead = true;
    }
  }
}
