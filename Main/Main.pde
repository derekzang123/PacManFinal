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


  
