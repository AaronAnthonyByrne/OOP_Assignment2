class Enemy extends Object
{
  PVector pos, direction;
  Player p1;
  int speed, size;
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

  void render()
  {
    int spawnPos = (int) random(0, 4);

    if (spawnPos ==0)
    {
      enemies.add(new Enemy(new PVector(random (-200, 0), random(-200, height + 200), player);
    }
    if (spawnPos ==1)
    {
      enemies.add(new Enemy(new PVector(random (width, width+200), random(-200, height + 200), player);
    }
    if (spawnPos ==2)
    {
      enemies.add(new Enemy(new PVector(random (width -200, width+200), random(height, 200), player);
    } else
    {
      enemies.add(new Enemy(new PVector(random (width -200, width+200), random(-200, 0), player);
    }
    amountEnemies --;
  }
  /* 
   // Enemy sprite
   stroke(1, 82, 0); 
   fill(0, 255, 0);
   ellipse(width/2 + 280, height/2 + 245, 30, 30);
   
   // Health sprite
   stroke(255, 0, 0);
   fill(255, 0, 0, 90);
   ellipse(width/2 + 280, height/2 + 300, 30, 30);
   stroke(255);
   fill(255);
   line(width/2 + 270, height/2 + 300, width/2 + 290, height/2 + 300);
   line(width/2 + 280, height/2 + 290, width/2 + 280, height/2 + 310);
   
   // MachineGun sprite
   stroke(255);
   fill(255, 90);
   ellipse(width/2 + 320, height/2 + 300, 30, 30);
   stroke(255);
   fill(255);
   ellipse(width/2 + 312, height/2 + 300, 4, 4);
   ellipse(width/2 + 320, height/2 + 300, 4, 4);
   ellipse(width/2 + 328, height/2 + 300, 4, 4);
   
   // Laser Sprite
   stroke(255);
   fill(255, 90);
   ellipse(width/2 + 360, height/2 + 300, 30, 30);
   stroke(0, 0, 255);
   line(width/2 + 352, height/2 + 300, width/2 + 368, height/2 + 300);
   //shape(EnemyBody);
  /*/


  void update()
  {
    int timer = millis();
    if (timer % 30 == 0 && amountEnemies>0)
    {
      render();
    }
    for (int i =0; i< enemies.size(); i++)
    {
      Enemy e = Object.get(i);
      e.update();
    }
    if ( remainingEnemies == 0 && level < rounds.length -1)
    {
      level ++;
      startTime = millis();
      gameOn = false;
      rComplete = true;
    }
    //All levels beaten
    else if (remainingEnemies == 0 && level == rounds.length-1)
    {
      gameOn = false;
      win = true;
      state = 2;
    }

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