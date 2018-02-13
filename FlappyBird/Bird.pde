class Bird{
 
  PVector defaultLoc;
  PVector loc;
  PVector velocity;
  
  int birdSize = 50;
  
  int xVel = 0;
  int maxVel = 7;
  int minVel = -8;
  
  public Bird(){
    defaultLoc = new PVector(200, height / 2 - birdSize / 2);
    loc = new PVector(defaultLoc.x, defaultLoc.y);
    velocity = new PVector(0, 0);
  }
  
  public void setVelocity(PVector velocity){
    this.velocity = velocity;
  }
  
  private void update(){
     loc.add(velocity);
     Gate cg = Main.game.getCurrentGate();
    
     /*TOP*/
     if(loc.y <= 0) Main.game.restart();
     
     /*BOTTOM*/
     if(loc.y + birdSize >= height) Main.game.restart();
     
     /*GATE UP*/
     if(loc.y <= cg.getLoc().y && loc.x + birdSize >= cg.getLoc().x && loc.x <= cg.getLoc().x + cg.getThickness()) Main.game.restart();
     
     /*GATE DOWN*/
     if(loc.y + birdSize >= cg.getLoc().y + cg.getGateHeight() && loc.x + birdSize >= cg.getLoc().x && loc.x <= cg.getLoc().x + cg.getThickness()) Main.game.restart();

  }
  
  public void display(){
    update();
    noStroke();
    fill(255);
    rect(loc.x, loc.y, birdSize, birdSize); 
  }
  
  public PVector getLoc(){
     return loc; 
  }

  void jump() {
      if (!Main.game.isStarted()) Main.game.setStarted(true);
      xVel = maxVel;
  }

  void updateVelocity() {
    if (!Main.game.stopped) {
      if (Main.game.isStarted()) {
        if (xVel > minVel) xVel--;

        delay(75);
      }
      setVelocity(new PVector(0, -xVel));
      //println("x = " + xVel + " vel = " + -xVel + " 0");
      print("");
    }
  }
  
  public void reset(){
    xVel = 0;
    setVelocity(new PVector(0, 0));
    loc = new PVector(defaultLoc.x, defaultLoc.y);
  }
  
}