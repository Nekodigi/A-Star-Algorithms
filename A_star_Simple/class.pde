class Spot{
  int i;
  int j;
  float f;
  float g = 0;
  float h = 0;
  ArrayList<Spot> neighbors = new ArrayList<Spot>();
  Spot previous;
  boolean wall = false;
  
  Spot(int i, int j){
    this.i = i;
    this.j = j;
    if(random(1) < wallRate){
      wall = true;
    }
  }
  
  public void calcF(){
    f = g + h;
  }
  
  public void addNeighbors(){
    if(i < cols-1){
      neighbors.add(grid[i+1][j]);
    }
    if(i > 0){
      neighbors.add(grid[i-1][j]);
    }
    if(j < rows-1){
      neighbors.add(grid[i][j+1]);
    }
    if(j > 0){
      neighbors.add(grid[i][j-1]);
    }
  }
  
  public void show(int col){
    if(wall == true){
      fill(0);
    }else{
      fill(col);
    }
    stroke(0);
    rect(i*wid, j*hei, wid, hei);
  }
}