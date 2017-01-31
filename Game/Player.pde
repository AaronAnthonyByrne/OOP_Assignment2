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


    create();
  }

  void create()
  {
    // Laser between player & mouse
    strokeWeight(.5);
    stroke(255, 0, 0);
    line(mouseX, mouseY, player.pos.x, player.pos.y);

    fill(0);
    stroke(#FFFFFF);
    theta = atan2(player.pos.x - mouseX, player.pos.y - mouseY);
    translate(player.pos.x, player.pos.y);
    rotate(-player.theta-PI); 
    strokeWeight(4);
    ellipse(0, 0, 50, 50);
    line(0, 10, 0, 40);
  }

  void render()
  {
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

    if (hitCD)
    {
      player.stroke = color(255, 0, 0);
      if(millis() - hitTime > hitCoolDown)
      {
        
      /*if (checkKey(shoot) && elapsed > toPass && power > 0)
       {
       PVector bp = PVector.add(pos, PVector.mult(forward, 40));
       Bullet b = new Bullet(bp.x, bp.y, theta, 20, 5);
       Object.add(b);
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
       }*/
    }