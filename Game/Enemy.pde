class Enemy extends gObject
{
  PVector direction;
  Player p1;
  int speed;
  boolean active;
  color zColour;

  Enemy(PVector pos, Player p)
  {
    this.pos = pos;
    this. p1 = p;
    size = 50;
    speed= (int) random(2, 5);
    active = true;
    direction = new PVector(0, 0);
    zColour = color(0, 0, 255);
  }

  void update()
  {
    if (active)
    {
      fill(zColour);

      if (dist(p1.pos.x, p1.pos.y, pos.x, pos.y)> 50)
      {
        direction.x = p1.pos.x-pos.x;
        direction.y = p1.pos.y-pos.y;
        direction.normalize();
        pos.x += direction.x * speed;
        pos.y += direction.y * speed;
      } else
      {
        if (p1.hitCD == false)
        {
          p1.health --;
          hitTime = millis();
          p1.hitCD = true;
        }
      }
      ellipse(pos.x, pos.y, size, size);
    }
  }
}