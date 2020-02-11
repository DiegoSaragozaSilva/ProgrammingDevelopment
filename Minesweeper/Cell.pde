class Cell {
  boolean bomb, revealed, flag;
  float x, y, h;
  int value;
  ArrayList<Cell> neighbors;

  Cell(float x, float y, float h, boolean isBomb) {
    this.x = x;
    this.y = y;
    this.h = h;
    this.bomb = isBomb;
    this.value = 0;
    this.revealed = false;
    this.flag = false;
    neighbors = new ArrayList<Cell>();
  }

  void show() {
    push();
    stroke(0);
    if (bomb && revealed) {
      fill(255, 0, 0);
    } else if (!revealed) {
      fill(200);
    }
    rect(x, y, h, h);

    if (!bomb && revealed && value > 0) {
      fill(0);
      textAlign(CENTER);
      text(value, x + h / 2, y + h / 2);
    }

    if (flag && !revealed) {
      push();
      fill(255, 0, 0);
      circle(x + h / 2, y + h / 2, h * 0.75);
      pop();
    }
    pop();
  }

  void getNeighbors(Cell[][] field, int i, int j) {
    if (!field[i][j].bomb) {
      if (i < field.length - 1) {
        neighbors.add(field[i + 1][j]);
      }
      if (i < field.length - 1 && j < field[0].length - 1) {
        neighbors.add(field[i + 1][j + 1]);
      }
      if (i > 0) {
        neighbors.add(field[i - 1][j]);
      }
      if (i > 0 && j < field[0].length - 1) {
        neighbors.add(field[i - 1][j + 1]);
      }
      if (i < field.length - 1 && j > 0) {
        neighbors.add(field[i + 1][j - 1]);
      }
      if (i > 0 && j > 0) {
        neighbors.add(field[i - 1][j - 1]);
      }
      if (j < field[0].length - 1) {
        neighbors.add(field[i][j + 1]);
      }
      if (j > 0) {
        neighbors.add(field[i][j - 1]);
      }
    }
  }

  void reveal() {
    if (!this.revealed) {
      if (this.value > 0) {
        this.revealed = true;
        return;
      } else if (this.value == 0) {
        this.revealed = true;
        for (Cell neighbor : neighbors) {
          neighbor.reveal();
        }
        return;
      }
    }
    return;
  }

  void turnFlag() {
    if (!flag) {
      this.flag = true;
      return;
    }
    this.flag = false;
    return;
  }
}
