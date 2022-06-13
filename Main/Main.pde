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
  levels.add(level2);
  levels.add(level3);
  grid = new GameBoard();
  grid.loadGameBoard(levels.get(0));
  //grid.countPellets();
  player = new PacMan();
  ghosts = new Ghost[4];
  for (int i=0; i<ghosts.length; i++) {
    ghosts[i] = new Ghost(i);
  }
  timerCorners = millis() + 15000;
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
  if (grid.countPellets() == 0)  {
    try {
    level ++;
    grid.loadGameBoard(levels.get(level));
    gameReset();
    if (level == 3 && grid.countPellets() == 0) {
      println("GAME OVER");
    }
    } catch (IndexOutOfBoundsException e) {
      println("GAME OVER");
    }
  }
  fill(255,255,255);
  text("Score: " + str(player.score),20,32.5);
  textSize(15);
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
  if (key == 'c') {
    grid.clearPellets();
  }
  if (key == 'a') {
    try {
      level --;
      grid.loadGameBoard(levels.get(level%4));
      gameReset();
    } 
    catch (IndexOutOfBoundsException e) {
      println("level not found");
    }
  }
  if (key == 'd') {
    try {
      level ++;
      grid.loadGameBoard(levels.get(level%4));
      gameReset();
    } 
    catch (IndexOutOfBoundsException e) {
      println("level not found");
    }
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
