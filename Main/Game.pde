class Game {

  private ArrayList<Gate> gates;
  private Bird bird;
  Gate currentGate;

  int score;

  public boolean start = false;
  public boolean stopped = false;
  
  int defaultGateX = 700;
  int gatesSpacing = 450;
  int gatesBufferSize = 10;

  PFont font;

  public Game() {
    bird = new Bird();
    gates = new ArrayList();
    score = 0;

    font = createFont("Arial", 60, true);

    for (int i = 0; i < gatesBufferSize; i++) {
      addGate();
    }

    currentGate = gates.get(0);

    thread("velThread");
  }

  void updateCurrentGate() {
    if (currentGate.getLoc().x + currentGate.getThickness() < bird.getLoc().x) {
      currentGate = gates.get(gates.indexOf(currentGate) + 1);
      score++;
    }
    
    
    if(gates.indexOf(currentGate) > 0){
        gates.get(gates.indexOf(currentGate) - 1).pass();
    }
  
  }

  void addGate() {
    gates.add(new Gate( (gates.isEmpty()) ? defaultGateX : (int) gates.get(gates.size() - 1).getLoc().x + gatesSpacing ));
  }

  void removeGate() {
    if (gates.get(0).getLoc().x < -100) {
      gates.remove(gates.get(0));
      addGate();
    }
  }

  void displayScore() {
    textFont(font);
    fill(255);
    text(score, 25, 70);
  }

  public void display() {
    if(!stopped) {
      updateCurrentGate();
  
      for (Gate g : gates) {
        g.display();
        if (start) g.updateLoc();
      }
  
      removeGate();
  
      bird.display();
  
      displayScore();
    }
  }

  public Bird getBird(){
     return bird; 
  }
  
  public boolean isStarted(){
     return start; 
  }
  
  public void setStarted(boolean b){
    start = b; 
  }

  public Gate getCurrentGate(){
     return currentGate;
  }
  
  public void restart(){
    stopped = true;
    start = false;
    
    gates = new ArrayList();
    score = 0;
    bird.reset();
    
    for (int i = 0; i < gatesBufferSize; i++) {
      addGate();
    }

    currentGate = gates.get(0);
    
    stopped = false;
  }
}