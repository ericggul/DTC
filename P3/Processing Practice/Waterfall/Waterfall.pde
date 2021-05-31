Circle thisCircle;
float a;

float xspeed = 10.7153;
float yspeed = 8.2534;

int xdirection = 1;
int ydirection = 1;

public void setup(){
  size(800,800);
  background(0);
  thisCircle = new Circle(0, 0, color(66,135,245));

}

public void draw(){
  thisCircle.xPos += (xspeed*xdirection);
  thisCircle.yPos += (yspeed*ydirection);
  
  if(thisCircle.xPos > width || thisCircle.xPos < 0){
    xdirection *= -1;
    xspeed *= random(0.9,1.1);
  }
  if(thisCircle.yPos > height || thisCircle.yPos <0){
    ydirection *= -1;
    yspeed *= random(0.9,1.1);
  }
  
  thisCircle.sColor = color(random(29,65), random(135,235), random(222,245)); 
  
  thisCircle.display();
}

class Circle{
  float xPos;
  float yPos;
  color sColor;
  Circle(float _xP, float _yP, color _sC){
    xPos = _xP;
    yPos = _yP;
    sColor = _sC;
  }
  void display(){
    noStroke();
    strokeWeight(0);
    fill(sColor);
    ellipse(xPos, yPos, random(20,100), random(17,100));
  }
}
