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

void betWallBreak(Spot a, Spot b){
  a.wall = false;
  b.wall = false;
  Spot mid = grid[(a.i+b.i)/2][(a.j+b.j)/2];
  mid.wall = false;
  mid.visited = true;
}

void A_star(){
  if(openSet.size() > 0){
    int winner = 0;
    for (int i = 0; i < openSet.size(); i++){
      if(openSet.get(i).f < openSet.get(winner).f){
        winner = i;
      }
    }
    
    current = openSet.get(winner);
    
    if(current == end){
      println("DONE");
      solving = false;
    }
    openSet.remove(current);
    closedSet.add(current);
    for(Spot neighbor : current.neighbors){
      if(neighbor.wall == false && !closedSet.contains(neighbor)){
        //float tempG = neighbor.g = current.g + 1;
        float tempG = neighbor.g = current.g + heuristic(neighbor, current);
        if(openSet.contains(neighbor)){//really need? replace by neighbor.g == 0?
          if (tempG < neighbor.g){
            neighbor.g = tempG;
          }
        }
        else{//first visit
          neighbor.g = tempG;
          openSet.add(neighbor);
        }
        neighbor.h = heuristic(neighbor, end);
        neighbor.calcF();
        neighbor.previous = current;
      }
    }
    
  }else{
    println("NO SOLUTION");
    solving = false;
  }
}