public static Game game;

void setup() {
  size(1200, 700);
  game = new Game();
}

void draw() {
  background(40);

  game.display();

  delay(1);
}


void keyPressed() {
    if (key == ' ') {
     game.getBird().jump();
    }
}

void velThread(){
  while(true){
    game.getBird().updateVelocity(); 
  }
}