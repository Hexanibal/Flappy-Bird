class Gate{
  
  private PVector loc;
  
  private int gateHeight = 220;
  private int gateThickness = 80;
  private int gateSpeed = 3;
  
  private boolean past;
  
  public Gate(int locX){
    loc = new PVector(locX, random(20, height - gateHeight - 20));
  }
  
  public PVector getLoc(){
    return loc;
  }
  
  public void setLoc(PVector nLoc){
     loc = nLoc; 
  }
  
  public void display(){
    noStroke();
    if(past) fill(200, 0, 0); else fill(255);
    rect(loc.x, 0, gateThickness, height);
    
    fill(40);
    rect(loc.x, loc.y, gateThickness, gateHeight);
  }
  
  public void updateLoc(){
    setLoc(new PVector(loc.x - gateSpeed, loc.y));
  }
  
  public int getThickness(){
   return gateThickness;
  }
  
  public int getGateHeight(){
     return gateHeight; 
  }
  
  public void pass(){
     past = true; 
  }
}