float func(float input, float op){
  return input * op;
}

public class circle {
  int cX = width / 2;
  int cY = height/ 2;
  int radius;
  
  circle(int _r) {
    radius = _r;
  }
  
  float xPoint(float p, float pTotal){
    float mP = p % pTotal;
    return cos(mP * TWO_PI / pTotal) * radius + cX;
  }
  
  float yPoint(float p, float pTotal){
    float mP = p % pTotal;
    return sin(mP * TWO_PI / pTotal) * radius + cY;
  }
  
  void displayConnections(float increm, float tot, float op){
    float sub = 0;
    while(sub < tot){
      float res = func(sub, op) % tot;
      strokeWeight(1);
      stroke(255);
      line(xPoint(sub, tot), yPoint(sub, tot), xPoint(res, tot), yPoint(res, tot));
      sub += increm;
    }
  }
  
  void displayPoints(float pTotal, int size){
    for(int i = 0; i < pTotal; i++){
      fill(255);
      ellipse(xPoint(i, pTotal), yPoint(i, pTotal), size, size);
    }
  }
  
  void display() {
    noFill();
    stroke(255);
    strokeWeight(2);
    ellipseMode(RADIUS);
    ellipse(cX, cY, radius, radius);
  }
}

void setup(){
  size(800, 600);
}

circle c;
float points = 499;
int step = 0;
float operator = 2;

void draw(){
  background(50);
  c = new circle(240);
  c.display();
  c.displayPoints(points, 2);
  c.displayConnections(1, points, operator);
  
  
  if(mouseY > height / 2){
    operator += float(mouseX - width/2) / (width * 10);
  }
  
  
  //points += 0.01;
  textSize(18);
  text(str(operator), c.cX - 40, c.cY + c.radius + 50);
  step += 1;
}