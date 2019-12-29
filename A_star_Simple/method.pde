float heuristic(Spot a, Spot b){
  switch(heurType){
    case 0:
      return (a.i-b.i) * (a.i-b.i) + (a.j-b.j) * (a.j-b.j);
    case 1:
      return dist(a.i, a.j, b.i, b.j);
    case 2:
      return abs(a.i-b.i) + abs(a.j-b.j);
    default:
      return 1;
  }
}

void reset(){
  mazeRebuild();
  routeReset();
}

void routeReset(){
  openSet = new ArrayList<Spot>();
  closedSet = new ArrayList<Spot>();
  start = grid[0][0];
  end = grid[cols-1][rows-1];
  start.wall = false;
  end.wall = false;
  openSet.add(start);
  current = start;
  solving = true;
}

void mazeRebuild(){
  for(int i = 0; i < cols; i++){
    for(int j = 0; j < rows; j++){
      grid[i][j] = new Spot(i, j);
    }
  }
  
  for(int i = 0; i < cols; i++){
    for(int j = 0; j < rows; j++){
      grid[i][j].addNeighbors();
    }
  }
}