int[][] grid;
int x, y;
int dir=3;
int scl=10;
int cols;
int rows;

void setup() {
  //size(1200, 800);
  fullScreen();
  background(255);
  stroke(0, 100);
  cols = (int)width/scl;
  rows = (int)height/scl;
  grid = new int[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j]=0;
      rect(i*scl, j*scl, scl, scl);
    }
  }

  x=cols/2;
  y=rows/2;
  grid[x][y]=1;
  stroke(0);
  //noStroke();
  frameRate(5);
}
int speed;

void draw() {
  speed=floor(map(mouseX, 0, width, 1, 200));
  frameRate(floor(map(speed, 1, 200, 5, 200)));
  //speed=100;
  for (int i = 0; i<speed; i++) {
    x=(x+cols)%cols;
    y=(y+rows)%rows;
    if (grid[x][y]==0) {
      grid[x][y]=(grid[x][y]+1)%2;
      fill(0);
      rect(x*scl, y*scl, scl, scl);
      left();
    } else {
      grid[x][y]=(grid[x][y]+1)%2;
      fill(255);
      rect(x*scl, y*scl, scl, scl);
      right();
    }
    //if (grid[x][y]<2) {
    //  grid[x][y]=(grid[x][y]+1)%4;
    //  left();
    //} else {
    //  grid[x][y]=(grid[x][y]+1)%4;
    //  right();
    //}
  }
  //loadPixels();
  //for (int i = 0; i < width; i++) {
  //  for (int j = 0; j < height; j++) {
  //    int index=i+j*width;
  //    if (grid[i][j]==0) {
  //      pixels[index] = color(255);
  //    } else if (grid[i][j]==1) {
  //      pixels[index]=color(0);
  //    } else if (grid[i][j]==2) {
  //      pixels[index]=color(255, 0, 0);
  //    } else if (grid[i][j]==3) {
  //      pixels[index]=color(0, 120, 120);
  //    }
  //  }
  //}
  //updatePixels();
  fill(255, 0, 0);
  rect(x*scl, y*scl, scl, scl);
}
void right() {
  switch(dir) {
  case 0: 
    ++x;
    break;
  case 1: 
    ++y;
    break;
  case 2: 
    --x;
    break;
  case 3: 
    --y;
    break;
  }
  dir=(dir+1)%4;
}
void left() {
  switch(dir) {
  case 0: 
    --x;
    break;
  case 1: 
    --y;
    break;
  case 2: 
    ++x;
    break;
  case 3: 
    ++y;
    break;
  }
  dir = (dir+3)%4;
}
