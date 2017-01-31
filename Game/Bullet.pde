class Bullet extends Object
{
  Player p;
  PVector mousePos;
  PVector pos;
  PVector trajectory;
  float speed;
  int size;
  boolean alive;
  color bulletFill;
 

  Bullet(Player p, color bulletFill, PVector pos, PVector mousePos)
  {
    this.p = p;
    this.pos = pos;
    this.mousePos = mousePos;
    alive = true;
    speed = 10;
    size =5;
    this.bulletFill = bulletFill;
    //subtract the enemies position from players to aquire the trajectory
    trajectory = PVector.sub(mousePos,pos);
    //Normalise the vector to length 1 
    trajectory.normalize();
    //give it some speed.
    trajectory.mult(speed);
    
  }

  void update()
  {
    if(alive)
    {
      pos.add(trajectory);
      stroke(bulletFill);
      fill(bulletFill);
      ellipse(pos.x,pos.y, size,size);
    }
    
  }
}