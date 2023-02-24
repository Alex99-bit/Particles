int numCircles = 100;
Circle[] circles;

void setup() {
  size(1400, 800);
  circles = new Circle[numCircles];
  for (int i = 0; i < numCircles; i++) {
    circles[i] = new Circle();
    circles[i].setSpeed((int) random(1, 2));
  }
  smooth();
}

void draw() {
  fill(255, 10);
  rect(0, 0, width, height);
  for (int i = 0; i < numCircles; i++) {
    circles[i].move();
    circles[i].display();
    //allCirclesAtCenter &= circles[i].areAllCirclesAtCenter();
    circles[i].stop_();
  }
}

class Circle {
  int x, y;
  int diameter;
  int speed;

  Circle() {
    x = (int) random(0, width);
    y = (int) random(0, height);
    diameter = (int) random(10, 50);
  }

  void setSpeed(int newSpeed) {
    speed = newSpeed;
  }

  void display() {
    fill(0);
    circle(x,y,diameter);
  }

  void move() {
    x += (width / 2 - x) / (10 * speed);
    y += (height / 2 - y) / (10 * speed);
  }

  boolean areAllCirclesAtCenter() {
    return abs(x - width / 2) <= 1 && abs(y - height / 2) <= 1;
  }
  
  void stop_(){
    if(areAllCirclesAtCenter()){
      noLoop();
    }
  }
}
