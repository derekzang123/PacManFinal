Controller keyboardInput;
PacMan player;

  void keyPressed() {
    keyboardInput.press(keyCode);
  }

  void keyReleased() {
    keyboardInput.release(keyCode);
  }

  void setup() {
    size(308, 396);
    keyboardInput = new Controller();
    player = new PacMan();
  }

  //Visualize which keys are being held down...
  void draw() {
    background(0);
    player.display();
    if (keyboardInput.isPressed(Controller.P1_LEFT)) {
      player.moveLeft();
      player.displayLeft();
    }
    if (keyboardInput.isPressed(Controller.P1_RIGHT)) {
      player.moveRight();
      player.displayRight();
    }
    if (keyboardInput.isPressed(Controller.P1_UP)) {
      player.displayUp();
      player.moveUp();
    }
    if (keyboardInput.isPressed(Controller.P1_DOWN)) {
      player.displayDown();
      player.moveDown();
    }
  }


  /**************CONTROLLER TAB************/
  class Controller {
    static final int P1_UP = 0;
    static final int P1_DOWN = 1;
    static final int P1_LEFT = 2;
    static final int P1_RIGHT = 3;
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
