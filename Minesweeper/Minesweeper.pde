Cell[][] field;
int cellSize;

void setup() {
  size(600, 600);
  //fullScreen();
  
  cellSize = 50;
  field = new Cell[width / cellSize][height / cellSize];

  for (int i = 0; i < field.length; i++) {
    for (int j = 0; j < field[0].length; j++) {
      if (random(0, 10) <= 2) {
        field[i][j] = new Cell(i * cellSize, j * cellSize, cellSize, true);
      } else {
        field[i][j] = new Cell(i * cellSize, j * cellSize, cellSize, false);
      }
    }
  }

  populateField();
}


void draw() {
  background(255);

  for (int i = 0; i < field.length; i++) {
    for (int j = 0; j < field[0].length; j++) {
      field[i][j].show();
    }
  }
}

void populateField() {
  for (int i = 0; i < field.length; i++) {
    for (int j = 0; j < field[0].length; j++) {
      if (!field[i][j].bomb) {
        if (i < field.length - 1) {
          if (field[i + 1][j].bomb) {     //RIGHT
            field[i][j].value++;
          }
        }
        if (i < field.length - 1 && j < field[0].length - 1) {
          if (field[i + 1][j + 1].bomb) { //BOTTOM RIGHT
            field[i][j].value++;
          }
        }
        if (i > 0) {
          if (field[i - 1][j].bomb) {     //LEFT
            field[i][j].value++;
          }
        }
        if (i > 0 && j < field[0].length - 1) {
          if (field[i - 1][j + 1].bomb) { //BOTTOM LEFT
            field[i][j].value++;
          }
        }
        if (i < field.length - 1 && j > 0) {
          if (field[i + 1][j - 1].bomb) { //TOP RIGHT
            field[i][j].value++;
          }
        }
        if (i > 0 && j > 0) {
          if (field[i - 1][j - 1].bomb) { //TOP LEFT
            field[i][j].value++;
          }
        }
        if (j < field[0].length - 1) {
          if (field[i][j + 1].bomb) {     //TOP
            field[i][j].value++;
          }
        }
        if (j > 0) {
          if (field[i][j - 1].bomb) {     //BOTTOM
            field[i][j].value++;
          }
        }
      }
      field[i][j].getNeighbors(field, i, j);
    }
  }
}

void revealField() {
  for (int i = 0; i < field.length; i++) {
    for (int j = 0; j < field[0].length; j++) {
      field[i][j].revealed = true;
    }
  }
}

void mouseClicked() {
  for (int i = 0; i < field.length; i++) {
    for (int j = 0; j < field[0].length; j++) {
      if (mouseX >= field[i][j].x && mouseX <= field[i][j].x + cellSize && mouseY >= field[i][j].y && mouseY <= field[i][j].y + cellSize) {
        if (mouseButton == LEFT) {
          if (field[i][j].bomb) {
            println("YOU LOSE");
            revealField();
          } else {
            field[i][j].reveal();
          }
        }
        else if (mouseButton == RIGHT){
          field[i][j].turnFlag();
        }
      }
    }
  }
}
