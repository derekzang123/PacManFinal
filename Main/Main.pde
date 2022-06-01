Controller keyboardInput;

  void keyPressed() {
    keyboardInput.press(keyCode);
  }

  void keyReleased() {
    keyboardInput.release(keyCode);
  }

  void setup() {
    size(616, 792);
    keyboardInput = new Controller();
  }

  //Visualize which keys are being held down...
  void draw() {
    background(0);

    if (keyboardInput.isPressed(Controller.P1_LEFT)) {
      //move pacman left
    }
    if (keyboardInput.isPressed(Controller.P1_RIGHT)) {
      //move pacman right
    }
    if (keyboardInput.isPressed(Controller.P1_UP)) {
      //move pacman up
    }
    if (keyboardInput.isPressed(Controller.P1_DOWN)) {
      //move pacman down
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
