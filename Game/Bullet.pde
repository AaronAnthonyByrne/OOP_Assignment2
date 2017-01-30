class Bullet extends Object
{
  float theta;
  float size;
  float speed = 200;
  float expiry;
  float fired;

  Bullet(float x, float y, float theta, float size, float expiry)
  {
    pos = new PVector(x, y);
    forward = new PVector(0, 1);
    this.theta= theta;
    this.size = size;
    this.expiry = expiry;
    this.fired = 0;
  }

  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    stroke(255);
    line(0, -size/2, 0, size/2);
    popMatrix();
  }

  void update()
  {
    forward.x = sin(theta);
    forward.y = - cos(theta);

    pos.add(PVector.mult(PVector.mult(forward, speed), timeDelta));

    if (pos.x>width)
    {
      pos.x=0;
    }
    if (pos.x <0)
    {
      pos.x = width;
    }

    if (pos.y >height)
    {
      pos.y=0;
    }
    if (pos.y<0)
    {
      pos.y= height;
    }

    fired += timeDelta;
    if (fired > expiry)
    {
      item.remove(this);
    }
  }
}