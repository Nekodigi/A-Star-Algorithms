class Spot{
  int x;
  int y;
  
  Spot(int i, int j){
    x = i;
    y = j;
  }
  
  void show(color col){
    fill(col);
    stroke(0);
    println(x, y, w, h);
    rect(x*w, y*h, w, h);
  }
}