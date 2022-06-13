public class PacMan implements Entity {

  float startX = 30;
  float startY = 30;
  float x, y;
  float dx = 1.5, dy = 1.5;
  int direction;
  float mouthOpen, mouthOpenMax, mouthStep;
  boolean isMouthOpen = true;
  boolean isEnergized = false;
  boolean isDead = false;
  int energizerCountdown;
  int score = 0;
  int lives = 3;

  PacMan() {
    respawn();
  }

  void respawn() {
    x = startX;
    y = startY;
    direction = 0;
    mouthOpen = 0; 
    mouthOpenMax = .4; 
    mouthStep = .01;
    isEnergized = false;
    energizerCountdown = 0;
    isDead = false;
  }
  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  void setY (float y_) {
    y = y_;
  }

  void setX (float x_) {
    x = x_;
  }

  void setDirection (int direction_) {
    direction = direction_;
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
  void die() {
    isDead = true;
    mouthOpenMax = TWO_PI;
    mouthStep = .1;
    lives --;
  }
  
  void draw() {
    simulate();
    render();
  }
  void simulate() {
    if (mouthOpen > PI ) respawn();
    if (isDead) { 
      animateMouth(); 
      return;
    }
    float px=x, py=y;
    if (0==direction) 
      x += dx;
    if (1==direction) 
      y += dy;
    if (2==direction) 
      x -= dx;
    if (3==direction) 
      y -= dy;
    if (grid.isWall(x-6, y) || grid.isWall(x, y-6) || grid.isWall(x+6, y) || grid.isWall(x, y+6)) {
      x = px;
      y = py;
    } else {
      animateMouth();
      grid.eatDotAt(x, y);
    }
    if (energizerCountdown > 0) { 
      energizerCountdown--;
    }
    if (energizerCountdown == 0) { 
      isEnergized = false;
      for (int i=0; i<ghosts.length; ghosts[i++].notAfraid ());
    }
  }
  void animateMouth() {
    if (isMouthOpen) {
      mouthOpen+=mouthStep;
    } else {
      mouthOpen-=mouthStep;
    }
    if (mouthOpen > mouthOpenMax || mouthOpen < 0) {
      isMouthOpen = !isMouthOpen;
    }
  }

  void getEnergizer() {
    isEnergized = true;
    energizerCountdown = 500;
    for (int i=0; i<ghosts.length; ghosts[i++].Afraid ());
  }
  void render() {
    pushMatrix();
    translate(x, y);
    rotate(HALF_PI*direction);
    stroke(0);
    fill(255, 255, 0);
    ellipse(0, 0, 22, 22);
    fill(0);
    arc(0, 0, 22, 22, - mouthOpen, mouthOpen);
    popMatrix();
  }

  void onKeyPressed() {
    if ( key == CODED ) {
      if ( keyCode == RIGHT ) 
        direction=0;
      if ( keyCode == DOWN )  
        direction=1;
      if ( keyCode == LEFT )  
        direction=2;
      if ( keyCode == UP )    
        direction=3;
    }
  }
}
