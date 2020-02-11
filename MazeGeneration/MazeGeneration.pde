//Maze Generation
int cellSize;
Cell[][] grid;
ArrayList<Cell> stack;
Cell start, end, current;

//A* algorithm
ArrayList<Cell> openSet;
ArrayList<Cell> closedSet;

void setup() {
  //size(800, 640);
  fullScreen();
  //frameRate(5);

  cellSize = 50;
  grid = new Cell[int(width / cellSize)][int(height / cellSize)];

  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[0].length; j++) {
      grid[i][j] = new Cell(i, j, cellSize);
      grid[i][j].getValidNeighbours(grid);
    }
  }

  stack = new ArrayList<Cell>();

  start = grid[0][0];

  current = start;
  current.visited = true;

  stack.add(current);

  end = grid[grid.length - 1][grid[0].length - 1];

  openSet = new ArrayList<Cell>();
  closedSet = new ArrayList<Cell>();

  openSet.add(start);
}

void draw() {
  background(255);

  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[0].length; j++) {
      grid[i][j].show();
    }
  }

  ArrayList<Cell> validNeighbours = getNeighbours(current.i, current.j);
  if (validNeighbours != null) {
    Cell randomNeighbour = validNeighbours.get(int(random(0, validNeighbours.size())));

    if (randomNeighbour.i - current.i == 1) {
      current.walls[1] = false;
      randomNeighbour.walls[3] = false;
    } else if (randomNeighbour.i - current.i == -1) {
      current.walls[3] = false;
      randomNeighbour.walls[1] = false;
    } else if (randomNeighbour.j - current.j == 1) {
      current.walls[2] = false;
      randomNeighbour.walls[0] = false;
    } else if (randomNeighbour.j - current.j == -1) {
      current.walls[0] = false;
      randomNeighbour.walls[2] = false;
    }

    current = randomNeighbour;
    current.visited = true;
    current.fillQuad();
    stack.add(current);
  } else if (stack.size() > 0) {
    current = getLastElement(stack);
    current.fillQuad();
  } else if (stack.size() == 0) {
    println("The maze has been built!");
    println("Finding the optimal path...");
    //A* pathfinding algorithm

    if (openSet.size() > 0) {
      //Take the best option based on the f score
      int winner = 0;
      for (int i = 0; i < openSet.size(); i++) {
        if (openSet.get(i).f < openSet.get(winner).f) {
          winner = i;
        }
      }
      current = openSet.get(winner);

      if (current == end) {
        println("Best path was find!");
        noLoop();
      }

      //Take the best move and move it to the closed set
      openSet.remove(current);
      closedSet.add(current);

      //Find the current cell neighbours
      ArrayList<Cell> neighbours = current.getValidNeighbours(grid);

      //Loop through all the neighbours and find the best valid one
      for (int w = 0; w < neighbours.size(); w++) {
        Cell neighbour = neighbours.get(w);
        if (neighbour != null) {
          int xoffset = neighbour.i - current.i;
          int yoffset = neighbour.j - current.j;

          if (!closedSet.contains(neighbour)) {
            if (xoffset == -1 && current.walls[3] == false || xoffset == 1 && current.walls[1] == false || yoffset == -1 && current.walls[0] == false || yoffset == 1 && current.walls[2] == false) {
              float tempG = current.g + heuristic(neighbour, current);
              //Is this neighbour a better path to follow?
              boolean newPath = false;
              if (openSet.contains(neighbour)) {
                if (tempG < neighbour.g) {
                  neighbour.g = tempG;
                  newPath = true;
                }
              } else {
                neighbour.g = tempG;
                newPath = true;
                openSet.add(neighbour);
              }
              //If there's a new path that's better
              if (newPath) {
                neighbour.h = heuristic(neighbour, current);
                neighbour.f = neighbour.g + neighbour.h;
                neighbour.previous = current;
              }
            }
          }
        }
      }
    }
    //There's no solution
    else {
      println("There's no solution for this maze");
      noLoop();
      return;
    }

    ArrayList<Cell> path = new ArrayList<Cell>();
    Cell temp = current;
    path.add(temp);
    while (temp.previous != null) {
      path.add(temp.previous);
      temp = temp.previous;
    }

    push();
    noFill();
    stroke(255);
    strokeWeight(cellSize / 4);
    beginShape();
    for (int i = 0; i < path.size(); i++) {
      vertex(path.get(i).i * cellSize + cellSize / 2, path.get(i).j * cellSize + cellSize / 2);
    }
    endShape();
    pop();

    //noLoop();
  }
}


ArrayList getNeighbours(int cellI, int cellJ) {
  ArrayList<Cell> neighbours = new ArrayList<Cell>();
  if (cellI < grid.length - 1) {
    if (!grid[cellI + 1][cellJ].visited) {
      neighbours.add(grid[cellI + 1][cellJ]);
    }
  }

  if (cellI > 0) {
    if (!grid[cellI - 1][cellJ].visited) {
      neighbours.add(grid[cellI - 1][cellJ]);
    }
  }

  if (cellJ < grid[0].length - 1) {
    if (!grid[cellI][cellJ + 1].visited) {
      neighbours.add(grid[cellI][cellJ + 1]);
    }
  }

  if (cellJ > 0) {
    if (!grid[cellI][cellJ - 1].visited) {
      neighbours.add(grid[cellI][cellJ - 1]);
    }
  }

  if (neighbours.size() > 0) {
    return neighbours;
  }
  return null;
}

Cell getLastElement(ArrayList<Cell> a) {
  Cell lastElement = a.get(a.size() - 1);
  a.remove(a.size() - 1);
  return lastElement;
}

float heuristic(Cell a, Cell b) {
  return dist(a.i, a.j, b.i, b.j);
}
