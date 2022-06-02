public class PacMan implements Entity {
  
  float startX = 30;
  float startY = 30;
  float x,y;
  float dx = 3,dy = 3;
  float mouthOpen, mouthOpenMax, mouthStep;
  boolean isMouthOpen = true;
  boolean isDead = false;
  boolean isEnergized = false;
  int energizerCountdown;
  int direction;
  
  PacMan () {
    respawn();
  }
  
  void respawn () {
    x = startX;
    y = startY;
    direction = 0;
    mouthOpen = 0;
    mouthOpenMax = 0.4;
    mouthStep = 0.1;
    isEnergized = false;
    isDead = false;
    energizerCountdown = 0;
  }
  
  void die () {
    isDead = true;
    mouthOpenMax = TWO_PI;
    mouthStep = 0.1;
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
  
  void draw () {
    simulate();
    render();
  }
  
  void simulate () {
    if (mouthOpen > PI) {
      respawn();
    }
    if (isDead) {
      animateMouth();
      return;
    }
    float px=x,py=y;
    if (direction == 0) {
      moveRight();
    }
    //check if the button P1_RIGHT is being pressed:
    if (direction == 1) {
      moveDown();
    }
    if (direction == 2) {
      moveLeft();
    }
    //check if the button P1_RIGHT is being pressed:
    if (direction == 3) {
      moveUp();
    }
    if (grid.isWall(x,y)) {
      x = px;
      y = py;
    } else {
      animateMouth();
      grid.eatDotAt(x,y);
    }
    if (energizerCountdown > 0) {
      energizerCountdown --;
    }
    if (energizerCountdown == 0) {
      isEnergized = false;
      for (int i = 0; i < ghosts.length; i ++) {
        ghosts[i].notAfraid();
      }
    }
  }
  
  void animateMouth () {
    if (isMouthOpen) {
      mouthOpen += mouthStep;
    } else {
      mouthOpen -= mouthStep;
    }
    if (mouthOpen > mouthOpenMax || mouthOpenMax < 0) {
      isMouthOpen = !isMouthOpen;
    }
  }
  
  boolean hasEnergizer () {
    return isEnergized;
  }
  
  void getEnergizer () {
    isEnergized = true;
    energizerCountdown = 500;
    for (int i = 0; i < ghosts.length; i ++) {
      ghosts[i].Afraid();
    }
  }
  
  void render () {
    pushMatrix();
    translate(x,y);
    rotate(HALF_PI * direction);
    stroke(0);
    fill(255,233,0);
    ellipse(0,0,22,22);
    fill(255,233,0);
    arc(0,0,22,22,-mouthOpen,mouthOpen);
    popMatrix();
  }
  
  void onKeyPressed() {
    if ( key == CODED ) {
      if ( keyCode == 'W' ) {
        direction = 0;
      }
      if ( keyCode == DOWN )  {
        direction = 1;
      }
      if ( keyCode == LEFT ) {
        direction = 2;
      }
      if ( keyCode == UP ) {
        direction = 3;
      }
    }
  }
}

 
