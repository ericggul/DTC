Square thisSquare;

public void setup(){
  size(800,800);
  background(0);
  thisSquare = new Square(0, 0);

}

public void draw(){
  thisSquare.xPos = 160;
  thisSquare.yPos = 160;
  
  rotate(cos(45));
  thisSquare.display();
}

class Square{
  int xPos;
  int yPos;
  Square(int _xP, int _yP){
    xPos = _xP;
    yPos = _yP;
  }
  void display(){
    noStroke();
    strokeWeight(0);
    fill(color(35,156,128));
    for(int i=0; i<48; i++){
    for(int j=0; j<48; j++){
      fill(color(35+i*1,156-i*2,128+j*2));
      rect(xPos+i*10, yPos+j*10, 10, 10);
    }
  }
  }
}
