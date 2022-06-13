static GameBoard grid;
static PacMan player;
static Ghost[] ghosts;
static boolean toCorners = false;
static int timerCorners;
static int[] decodeX = {22, 0, -22, 0, 0};
static int[] decodeY = {0, 22, 0, -22, 0};
ArrayList<String[][]>levels = new ArrayList<String[][]>();
int level = 0;


void setup() {
  size(600, 600);
  levels.add(level0);
  levels.add(level1);
  grid = new GameBoard();
  grid.loadGameBoard(levels.get(0));
  player = new PacMan();
  ghosts = new Ghost[5];
  for (int i=0; i<ghosts.length; i++) {
    ghosts[i] = new Ghost(i);
  }
  timerCorners = millis() + 15000;
  grid.countPellets();
}

void draw() {
  background(0);
  grid.draw();
  player.draw();
  for (int i=0; i<ghosts.length; i++) {
    ghosts[i].draw ();
  }
  if ( millis() > timerCorners) {
    timerCorners = millis() + 20000;
    toCorners = !toCorners;
  }
  if (grid.pellets == 0) {
    level ++;
    grid.loadGameBoard(levels.get(level));
    gameReset();
  }
}

void keyPressed() {
  player.onKeyPressed();
  if (key == ' ') { 
    toCorners = !toCorners;
  }
  if (key == 'e' ) {
    player.die();
  }
  if (key == 'r' ) {
    gameReset();
  }
  if (key == 'l') {
    gameReset();
    grid.loadGameBoard(levels.get(level + 1));
  }
   
}

void mousePressed() {
  grid.editGameBoard(mouseX, mouseY);
}

void gameReset() {
  player.die();
  for (int i=0; i<ghosts.length; i++)
    ghosts[i] = new Ghost (i);
}
