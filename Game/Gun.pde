class Gun extends gObject implements Charge
{
  Player p;
  int size;
  boolean active;
  int num;

  Gun(PVector pos, Player p)
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