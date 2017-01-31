class Gun extends Object implements Charge
{
  Gun()
  {
  }
  
  void applyto(Player player)
  {
    player.power++;
  }
  

  
  void update()
  {
  }
}