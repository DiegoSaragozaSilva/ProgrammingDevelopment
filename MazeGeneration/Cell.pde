class Cell {

  int i, j, size;
  boolean[] walls = new boolean[4];
  boolean visited;
  color col;

  float f, g, h;

  ArrayList<Cell> neighbours;
  Cell previous;

  Cell(int i, int j, int size) {
    this.i = i;
    this.j = j;
    this.size = size;
    for (int x = 0; x < walls.length; x++) {
      walls[x] = true;
    }
    visited = false;

    col = color(255, 255, 255);

    f = 0;
    g = 0;
    h = 0;

    neighbours = new ArrayList<Cell>();
  }

  void show() {
    float x = i * size;
    float y = j * size;
    push();
    fill(col);
    noStroke();
    rect(x, y, size, size);
    pop();

    stroke(0);
    if (walls[0]) { //TOP
      line(x, y, x + size, y);
    }
    if (walls[1]) { //RIGHT
      line(x + size, y, x + size, y + size);
    }
    if (walls[2]) { //BOTTOM
      line(x + size, y + size, x, y + size);
    }
    if (walls[3]) { //LEFT
      line(x, y + size, x, y);
    }
  }

  void fillQuad() {
    float x = i * size;
    float y = j * size;
    col = color(3, 78, 252);

    fill(0, 255, 0);
    rect(x, y, size, size);
  }

  ArrayList getValidNeighbours(Cell[][] grid) {
    if (i < grid.length - 1) {
      neighbours.add(grid[i + 1][j]); //RIGHT
    }
    if (i > 0) {
      neighbours.add(grid[i - 1][j]); //LEFT
    }
    if (j < grid[0].length - 1) {
      neighbours.add(grid[i][j + 1]); //BOTTOM
    }
    if (j > 0) {
      neighbours.add(grid[i][j - 1]); //TOP
    }
    return neighbours;
  }

  void show(color c) {
    float x = i * size;
    float y = j * size;

    noStroke();
    fill(c);
    rect(x, y, size, size);
  }
}
