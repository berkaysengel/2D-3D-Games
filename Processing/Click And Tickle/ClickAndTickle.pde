int x_coordinate, y_coordinate, tickleTimer, randomNumber, allowedTimerDuration;
boolean threshold = false;

void setup() {
  size(500, 500);
  textSize(30);
  x_coordinate = (int)random(10, 416);
  y_coordinate = (int)random(10, 452);
  tickleTimer = 0;
  allowedTimerDuration = 1000;
}

void draw() {
  background(0);
  fill(255, 0, 0);
  text("Tickle", x_coordinate, y_coordinate, 75, 39);
  if(mousePressed) {
    if(abs(mouseX - (x_coordinate + 37.5)) <= 37.5 && abs(mouseY - (y_coordinate + 19.5)) <= 19.5) {
      threshold = true;
      tickleTimer = millis();
      randomNumber = (int)random(-5 , 6);
      while(randomNumber == 0) randomNumber = (int)random(-5 , 6);
      if(x_coordinate + randomNumber <= 415 && x_coordinate + randomNumber >= 10) x_coordinate += randomNumber;
      else x_coordinate -= randomNumber;
      if(y_coordinate + randomNumber <= 451 && y_coordinate + randomNumber >= 10) y_coordinate += randomNumber;
      else y_coordinate -= randomNumber;
    }
  }
  if(threshold) {
    if(abs(mouseX - (x_coordinate + 37.5)) > 37.5 || abs(mouseY - (y_coordinate + 19.5)) > 19.5) {
      int elapsedTime = millis() - tickleTimer;
      if(elapsedTime > allowedTimerDuration) threshold = false;
    }
  }
}

void mouseReleased() {
  if(threshold) {
    x_coordinate = (int)random(10, 416);
    y_coordinate = (int)random(10, 452);
    threshold = false;
  }
}
