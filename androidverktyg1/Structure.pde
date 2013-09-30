
//Structure for the objects that are built when a player places a structure
class Structure {

  String type;
  int player;
  float x, y;
  int turn;
  String placed="";
  int sz=20;
  int pColor;
  Structure(float x, float y) {
    this.x=x;
    this.y=y;
    turn=turnCounter;
  }


  void setPlaced(String input) {
    placed=input;
    println("placed är nu= "+input);
  }
  float getX() {
    return x;
  }  
  String getPlaced() {
    return placed;
  }
  float getY() {
    return y;
  }  
  int getTurn() {
    return turn;
  }
  void setColor(int c) {
    pColor=c;
  }
  void display() {
    pushStyle();
    fill(pColor);
    stroke(0);
    rect(x, y, sz, sz);
    popStyle();
    textSize(25);
    text(placed, x+sz+3, y+10);
    text(turn, x+sz+3, y+sz+10);
  }
}

