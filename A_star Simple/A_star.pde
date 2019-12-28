
int cols = 10;
int rows = 10;
Spot[][] grid = new Spot[cols][rows];
ArrayList<Spot> closedSet = new ArrayList<Spot>();
ArrayList<Spot> openSet = new ArrayList<Spot>();

float w, h;

Spot start;
Spot end;

void setup(){
  size(400, 400);
  for(int i = 0; i < cols; i++){
    for(int j = 0; j < rows; j++){
      grid[i][j] = new Spot(i, j);
    }
  }
  
  w = width/cols;
  h = height/rows;
  start = grid[0][0];
  end = grid[cols-1][rows-1];
  
  openSet.add(start);
}

void draw(){
  background(100);
  
  if(openSet.size() > 0){
    
  }else{
    
  }
  fill(255);
  stroke(0);
  for(int i = 0; i < cols; i++){
    for(int j = 0; j < rows; j++){
      grid[i][j].show(color(255));
    }
  }
  
  for(Spot spot : closedSet){
    spot.show(color(255, 0, 0));
  }
  
  for(Spot spot : openSet){
    spot.show(color(0, 255, 0));
  }
}