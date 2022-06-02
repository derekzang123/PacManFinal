public class PacMan implements Entity {
  
  float startX = 30;
  float startY = 30;
  float x,y;
  float dx,dy;
  float mouthOpen, mouthOpenMax, mouthStep;
  boolean isMouthOpen = false;;
  boolean isDead = false;
  boolean isEnergized = false;
  int direction;
  Controller keyBoardInput;
  
  PacMan () {
    respawn();
  }
  
  void respawn () {
    x = startX;
    y = startY;
    mouthOpen = 0;
    mouthOpenMax = 0.4;
    mouthStep = 0.1;
    isEnergized = false;
    isDead = false;
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
    keyBoardInput = new Controller();
    if (keyboardInput.isPressed(Controller.P1_RIGHT)) {
      direction = 0;
      moveRight();
    }
    //check if the button P1_RIGHT is being pressed:
    if (keyboardInput.isPressed(Controller.P1_DOWN)) {
      direction = 1;
      moveDown();
    }
    if (keyboardInput.isPressed(Controller.P1_LEFT)) {
      direction = 2;
      moveLeft();
    }
    //check if the button P1_RIGHT is being pressed:
    if (keyboardInput.isPressed(Controller.P1_UP)) {
      direction = 3;
      moveUp();
    }
    if (GameBoard.isWall(x,y)) {
      x = px;
      y = py;
    } else {
      animateMouth();
      GameBoard.eatDotAt(x,y);
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
  }
  
  void render () {
    pushMatrix();
    translate(x,y);
    rotate(HALF_PI * direction);
    stroke(0);
    ellipse(0,0,22,22);
    fill(255,233,0);
    arc(0,0,22,22,-mouthOpen,mouthOpen);
    popMatrix();
  }
  
  void keyPressed() {
    keyboardInput.press(keyCode);
  }

  void keyReleased() {
    keyboardInput.release(keyCode);
  }
}

 /**************CONTROLLER TAB************/
  class Controller {
    static final int P1_RIGHT = 0;
    static final int P1_DOWN = 1;
    static final int P1_LEFT = 2;
    static final int P1_UP = 3;
    boolean [] inputs;

    public Controller() {
      inputs = new boolean[4];//4 valid buttons
    }

    /**@param code: a valid constant e.g. P1_LEFT
    */
    boolean isPressed(int code) {
      return inputs[code];
    }

    void press(int code) {
      println(code);
      if(code == 'A')
      inputs[P1_LEFT] = true;
      if(code == 'D')
      inputs[P1_RIGHT] = true;
      if(code =='W')
      inputs[P1_UP] = true;
      if(code == 'S')
      inputs[P1_DOWN] = true;
    }
    void release(int code) {
      if(code == 'A')
      inputs[P1_LEFT] = false;
      if(code == 'D')
      inputs[P1_RIGHT] = false;
      if(code =='W')
      inputs[P1_UP] = false;
      if(code == 'S')
      inputs[P1_DOWN] = false;
    }
  }
