class Player extends Object
{
  PVector velocity;
  PVector PlayerAcc;
  PVector force;

  float speed = 5;
  float theta;
  int health, maxHealth, lastBulletTime, bulletCoolDown,ammo;
 
  char up, down, left, right, shoot;
  

  Player(float x, float y, float theta, float size, char up, char down, char left, char right, char shoot)
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
    this.shoot = shoot;
    this.health = 5;
    maxHealth = health;
    bulletCoolDown = 250;
    
    
    create();
  }

  void create()
  {
    cowboy= createShape(GROUP);
    head= createShape(ELLIPSE, 0, 0, 25, 25);
    head.setFill(color(255));
    body = createShape(RECT, -25, -12.5, 50, 25);
    body.setFill(color(255));

    cowboy.addChild(body);
    cowboy.addChild(head);
  }

  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);

    //insert health and power here
    rotate(theta);
    shape(cowboy, 0, 0);
    popMatrix();
  }

  void update()
  {
    forward.x= sin(theta);
    forward.y = -cos(theta);

    if (checkKey(up))
    {
      force.add(PVector.mult(forward, power));
    }
    if (checkKey(down))
    {
      force.add(PVector.mult(forward, -power));
    }
    if (checkKey(left))
    {
      theta -= 0.1f;
    }
    if (checkKey(right))
    {
      theta += 0.1f;
    }

    if (checkKey(shoot) && elapsed > toPass && power > 0)
    {
      PVector bp = PVector.add(pos, PVector.mult(forward, 40));
      // Bullet b = new Bullet(bp.x, bp.y, theta, 20, 5);
      //gameObjects.add(b);
      elapsed = 0;
      power --;
    }

    PlayerAcc = PVector.div(force, mass);
    velocity.add(PVector.mult(PlayerAcc, timeDelta));
    pos.add(PVector.mult(velocity, timeDelta));
    force.x = force.y = 0;
    velocity.mult(0.9f);
    elapsed += timeDelta;

    for (int i = 0; i < item.size(); i ++)
    {
      Object ob = item.get(i);
      if (ob instanceof Bullet)
      {
        Bullet b = (Bullet) ob;
        if (dist(ob.pos.x, ob.pos.y, this.pos.x, this.pos.y) < centre)
        {
          health --;
          item.remove(b);
        }
      }
      if (ob instanceof Charge)
      {
        Charge p = (Charge) ob; 
        if (dist(ob.pos.x, ob.pos.y, this.pos.x, this.pos.y) < centre + 15)
        {
         // p.applyTo(this);
          item.remove(ob);
        }
      }
    }
  }
}