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
      if (num ==0)
      {
        // Health sprite
        stroke(255, 0, 0);
        fill(255, 0, 0, 90);
        ellipse(pos.x, pos.y, size, size);
        stroke(255);
        fill(255);
        line(pos.x-10, pos.y, pos.x+10, pos.y);
        line(pos.x, pos.y-10, pos.x, pos.y+10);
      } else if (num ==1)
      {
        // MachinepowerUp sprite
        stroke(255);
        fill(255, 90);
        ellipse(pos.x, pos.y, size, size);
        stroke(255);
        fill(255);
        ellipse(pos.x-8, pos.y, 4, 4);
        ellipse(pos.x, pos.y, 4, 4);
        ellipse(pos.x+8, pos.y, 4, 4);
      } else if (num ==2)
      {
        // Laser Sprite
        stroke(255);
        fill(255, 90);
        ellipse(pos.x, pos.y, size, size);
        stroke(0, 0, 255);
        line(pos.x-8, pos.y, pos.x+8, pos.y);
      }
      if (checkCol(p.pos.x, p.pos.y, pos.x, pos.y, size))
      {
        if (num ==0)
        {
          if (p.health < p.maxHealth)
          {
            p.health +=1;
          }
        } else if (num ==1)
        {
          p.bulletCoolDown=100;
          p.ammo=50;
          p.bulletFill = color(255);
        } else if (num == 2)
        {
          p.bulletCoolDown=50;
          p.ammo=25;
          p.bulletFill = color(0,0,255);
        }
        active = false;
      }
    }
  }
}