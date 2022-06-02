static GameBoard grid;
static PacMan player;
static Ghost[] ghosts;
static boolean toCorners = false;
static int timerCorners;
static int[] decodeX = {20,0,-20,0,0};
static int[] decodeY = {20,0,-20,0,0};



  void setup() {
    size(601,601);
    grid = new GameBoard();
    grid.loadGameBoard();
    player = new PacMan();
    ghosts = new Ghost[5];
    for (int i = 0; i < 5; i ++) {
      ghosts[i] = new Ghost(i);
    }
    timerCorners = millis() + 10000;
  }

  //Visualize which keys are being held down...
  void draw() {
    background(0);
    player.display();
    grid.display();
    for (int i = 0; i < 5; i++) {
      ghosts[i].display();
    }
    if (millis() > timerCorners) {
      toCorners = !toCorners;
    }
  }


  
