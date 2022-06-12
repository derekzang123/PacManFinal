static GameBoard grid;
static PacMan player;
static Ghost[] ghosts;
static boolean toCorners = false;
static int timerCorners;
static int[] decodeX = {22, 0, -22, 0, 0};
static int[] decodeY = {0, 22, 0, -22, 0};



void setup() {
  size(600, 600);
  grid = new GameBoard();
  player = new PacMan();
  ghosts = new Ghost[5];
  for (int i=0; i<ghosts.length; i++) {
    ghosts[i] = new Ghost(i);
  }
  timerCorners = millis() + 10000;
}

void draw() {
  background(0);
  grid.draw();
  player.draw();
  for (int i=0; i<ghosts.length; i++) {
    ghosts[i].draw ();
  }
  if ( millis() > timerCorners) {
    timerCorners = millis() + 10000;
    toCorners = !toCorners;
  }
}

void keyPressed() {
  grid.onKeyPressed();
  player.onKeyPressed();
  if ( key == ' ') { 
    toCorners = !toCorners;
  }
  if ( key == 'e' ) {
    player.die();
  }
  if ( key == 'r' ) {
    gameReset();
   }
}

void mousePressed() {
  grid.editGameBoard(mouseX, mouseY);
}

void gameReset() {
  player.die();
  ghostsReset();
}

void ghostsReset() {
  for (int i=0; i<ghosts.length; i++)
    ghosts[i] = new Ghost (i);
}
