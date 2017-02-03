class PowerUp extends gObject implements Charge
{
  Player p;
  boolean active;
  int num;

  PowerUp(PVector pos, Player p)
  {
    this.pos =pos;
    this.p=p;
    size=25;
    num = (int) random(0, 3);
  }

  void applyto(Player player)
  {
    player.power++;
  }



  void update()
  {
    if (active)
    {
    }
  }
}