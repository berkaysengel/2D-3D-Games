float randomX, randomY;
int openLight = 0;
void setup() {
  size(400, 400, P3D);
  noStroke();
  randomX = random(width + 1);
  randomY = random(height + 1);
}

void draw() {
  background(0);
  spotLight(0, 255, 0, mouseX, mouseY, openLight, 0, 0, -1, PI/2, 10);
  if (abs(mouseX - randomX) <= 50 && abs(mouseY - randomY) <= 50) openLight = 120;
  else openLight = 0;
  translate(randomX, randomY);
  sphere(50);
}
