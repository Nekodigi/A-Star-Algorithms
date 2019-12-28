
int cols = 192;
int rows = 108;
float wallRate=0.3;

Spot[][] grid = new Spot[cols][rows];
ArrayList<Spot> closedSet = new ArrayList<Spot>();
ArrayList<Spot> openSet = new ArrayList<Spot>();
ArrayList<Spot> path = new ArrayList<Spot>();
ArrayList<Spot> genStack = new ArrayList<Spot>();
float wid, hei;
int heurType = 0;
int debugMode = 0;
int genIter = 60;
int solvIter = 10;
boolean mazeBuilding = true;
boolean solving = true;

Spot genCurrent;
Spot current;
Spot start;
Spot end;

void setup(){
  //size(400, 400);
  fullScreen();
  colorMode(HSB, 360, 100, 100, 100);
  wid = width/cols;
  hei = height/rows;
  reset();
  //frameRate(5);
}

void draw(){
  background(0);
  int iter = solvIter;
  if(mazeBuilding){
    iter = genIter;
  }
  for(int n = 0; n < iter; n++){
    if(mazeBuilding){
      mazeGen();
    }else if(solving){
      A_star();
    }
  }
  
  showAll();
}