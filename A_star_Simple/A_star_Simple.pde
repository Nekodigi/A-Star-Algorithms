
int cols = 30;
int rows = 30;
float wallRate=0.3f;
boolean solving = true;

Spot[][] grid = new Spot[cols][rows];
ArrayList<Spot> closedSet = new ArrayList<Spot>();
ArrayList<Spot> openSet = new ArrayList<Spot>();
ArrayList<Spot> path = new ArrayList<Spot>();
float wid, hei;
int heurType = 0;
int debugMode = 0;
int iter = 2;

Spot current;
Spot start;
Spot end;

void setup(){
  size(600, 600);
  //fullScreen();
  colorMode(HSB, 360, 100, 100);
  wid = width/cols;
  hei = height/rows;
  reset();
}

void draw(){
  background(0);
  if(solving){
    A_star();
  }
  fill(360);
  stroke(0);
  for(int i = 0; i < cols; i++){
    for(int j = 0; j < rows; j++){
      grid[i][j].show(color(360));
    }
  }
  
  for(Spot spot : closedSet){
    int col = color(0);
    switch(debugMode){
      case 0:
        col = color(spot.f*1%360, 100, 100);
        break;
      case 1:
        col = color(spot.g*1%360, 100, 100);
        break;
      default:
        col = color(spot.h*1%360, 100, 100);
        break;
    }
    spot.show(col);
  }
  
  for(Spot spot : openSet){
    spot.show(color(100, 100, 100));
  }
  
  path = new ArrayList<Spot>();
  Spot temp = current;
  path.add(temp);
  while(temp.previous != null){
    path.add(temp.previous);
    temp = temp.previous;
  }
  for(Spot seg : path){
    seg.show(color(200, 100, 100));
  }
}