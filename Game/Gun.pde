class Gun extends Object implements Charge
{
  Gun()
  {
  }
  
  void applyto(Player player)
  {
    player.ammo++;
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x,pos.y);
    noFill();
    stroke(255,255,0);
    rectMode(CENTER);
    rect(0,0,30,30);
    popMatrix();
  }
  
  void update()
  {
  }
}