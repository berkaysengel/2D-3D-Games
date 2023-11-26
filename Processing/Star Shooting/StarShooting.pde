color green = color(0, 255, 0, 125);
color red = color(255, 0, 0, 200);
color black = color(0);
ArrayList<Star> stars = new ArrayList<Star>();

void setup() {
  fullScreen();
  background(black);
  assignStar();
}

void draw() {
  background(black);
  drawMouseEllipse();
  getStar();
  movementAnimation();
  checkColorCondition();
}
void assignStar() {
  for(int i=0; i<20; i++) {
    stars.add(new Star((int)random(0, 0.85*displayWidth + 1), (int)random(-150, displayHeight/2 + 1), (int)random(3,11), (int)random(-5,5), (int)random(3, 7), (int)random(15,26), 0, green));
  }
}

void getStar() {
  for(int i=0; i<stars.size(); i++) {
    stars.get(i).drawStars(stars.get(i).xPos, stars.get(i).yPos, stars.get(i).size, stars.get(i).vertexNo);
  }
}

void movementAnimation() {
  for(int i = 0; i<stars.size(); i++) {
    if(stars.get(i).vertexNo % 3 == 0 || (stars.get(i).vertexNo % 5 == 0)) stars.get(i).xPos += stars.get(i).speedX; 
    }
  for(int i = 0; i<stars.size(); i++) stars.get(i).yPos += stars.get(i).speedY;
    for(int i = 0; i<stars.size(); i++) {
    if(stars.get(i).xPos > displayWidth) {
    stars.get(i).xPos = (int)random(0, 0.85*displayWidth + 1);
    stars.get(i).counter += 1;
    }
  }
    for(int i = 0; i<stars.size(); i++) {
    if(stars.get(i).yPos > displayHeight) {
    stars.get(i).counter += 1;
    stars.get(i).yPos = (int)random(-150, displayHeight/2 + 1);
    }
  }
}
void checkColorCondition() {
  for(int i = 0; i<stars.size(); i++) {
    if(stars.get(i).counter == 10) stars.get(i).colorRGB = red;
  }
}

void mousePressed() {
  for(int i=0; i<stars.size(); i++) {
  if(abs(stars.get(i).xPos - mouseX) <= 15 && abs(stars.get(i).yPos - mouseY) <= 15 && stars.get(i).colorRGB == green) {
    stars.get(i).colorRGB = black;
    stars.remove(i);
 }
  }
}

void keyPressed() {
  if(keyCode == UP) {
      for(int i=0; i<stars.size(); i++) {
      if(stars.get(i).vertexNo < 10) stars.get(i).vertexNo += 1;
      }
    }
    if(keyCode == DOWN) {
      for(int i=0; i<stars.size(); i++) {
      if(stars.get(i).vertexNo > 3) stars.get(i).vertexNo -= 1;
      }
    }
}
void drawMouseEllipse() {
  fill(255, 0, 0, 175);
  ellipse(mouseX, mouseY, 25, 25);
}
