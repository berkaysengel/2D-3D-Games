class Star {
  int xPos, yPos, vertexNo, speedX, speedY, counter;
  float size;
  color colorRGB;
  
  Star(int xPos, int yPos, int vertexNo, int speedX, int speedY, float size, int counter, color colorRGB) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.vertexNo = vertexNo;
    this.speedX = speedX;
    this.speedY = speedY;
    this.size = size;
    this.counter = counter;
    this.colorRGB = colorRGB;
  }
  
  void drawStars(int xPos, int yPos, float size, int vertexNo) {
  fill(colorRGB);
  beginShape();
  noStroke();
  for (int i = 0; i <= 360; i+=360/vertexNo) {
  vertex(xPos + size * 2.75 * cos(radians(i)),yPos + size * 2.75 * sin(radians(i)));
  vertex(xPos + size * cos(radians(i+(180/vertexNo))),yPos + size * sin(radians(i+(180/vertexNo))));
}
  endShape();
  }
}
