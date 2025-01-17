int armAngle = 0;
int angleChange = 5;
final int ANGLE_LIMIT = 135;
int headBangler = 0;
int headChange = 1;
final int HEAD_LIMIT = 27;

void setup()
{
  size(200, 200);
  background(255);
  smooth();
  frameRate(30);
}

void draw(){
  background(255);
  pushMatrix();
  translate(50,50);
  drawRobot();
  armAngle += angleChange;
  headBangler += headChange;
  
  if (armAngle > ANGLE_LIMIT || armAngle < 0){
    angleChange = -angleChange;
    armAngle += angleChange;
    headChange = -headChange;
    headBangler += headChange;
  }
  popMatrix();
}

void drawRobot()
{
  noStroke();
  fill(38, 38, 200);
  rect(20, 0, 38, 30); // head
  rect(14, 32, 50, 50); // body

  drawLeftArm();
  drawRightArm();
  
  rect(22, 84, 16, 50); // left leg
  rect(40, 84, 16, 50); // right leg
  
  fill(222, 222, 249);
  ellipse(30, 12, 12, 12); // left eye
  ellipse(47, 12, 12, 12); // right eye
}



void drawLeftArm(){
 pushMatrix();
 translate(12, 32);
 rotate(radians(armAngle));
 rect(-12, 0, 12, 37);
 popMatrix();
}

void drawRightArm(){
  pushMatrix();
  translate(66, 32);
  rotate(radians(-armAngle));
  rect(0,0,12,37);
  popMatrix();
}
