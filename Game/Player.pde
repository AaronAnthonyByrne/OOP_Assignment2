class Player
{
  PVector velocity;
  PVector PlayerAcc;
  PVector force;
  PVector pos;
  PVector forward;
  float size;
  float speed = 5;
  float theta;
  float power = 100;
  int health, maxHealth, lastBulletTime, bulletCoolDown, ammo;
  boolean hitCD;

  color fill, stroke, bulletFill;
  
  char up, down, left, right;


  Player(float x, float y, float theta, float size, char up, char down, char left, char right)
  {
    pos = new PVector(x, y);
    forward = new PVector(0, -1);
    PlayerAcc = new PVector(0, 0);
    velocity = new PVector(0, 0);
    force = new PVector(0, 0);
    this.theta = theta;
    this.size = size;


    this.left = left;
    this.right = right;
    this.up = up;
    this.down = down;
    this.health = 5;
    maxHealth = health;
    bulletCoolDown = 250;
    fill=color(0);
    stroke = color(#FFFFFF);
    bulletFill = color(255);

  }


  void update()
  {
    forward.x= sin(theta);
    forward.y = -cos(theta);

    if (checkKey(up)&& pos.y - speed > 0)
    {
      force.add(PVector.mult(forward, power));
    }
    if (checkKey(down) && pos.y + speed < height)
    {
      force.add(PVector.mult(forward, -power));
    }
    if (checkKey(left) && pos.x - speed > 0)
    {
      theta -= 0.1f;
    }
    if (checkKey(right) && pos.x + speed < width)
    {
      theta += 0.1f;
    }

    // so player doesn't die instanly
    if (hitCD)
    {
      player.stroke = color(255, 0, 0);
      if(millis() - hitTime > hitCoolDown)
      {
        hitCD = false;
        player.stroke= color(255);
      }
    }
    
    //if health is gone GAME OVER!
    if (health <= 0)
    {
      gameOn = false;
      win = false;
      state = 2;
    }
    
    if(mousePressed)
    {
      if(millis() - lastBulletTime > bulletCoolDown)
      {
        PVector mousePos = new PVector(mouseX,mouseY);
        PVector location = new PVector(pos.x, pos.y);
        //sound for firing
        item.add(new Bullet(player,bulletFill, location, mousePos));
        totalShots ++;
        if (ammo > 0)
        {
          ammo --;
          if (ammo == 0)
          {
            bulletCoolDown = 200;
            bulletFill = color(255);
          }
        }
        lastBulletTime=millis();
      }
    }
  }
}    