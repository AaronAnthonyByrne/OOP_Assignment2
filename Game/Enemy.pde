class Enemy extends Object
{
  PShape EnemyBody;
  float theta, size;

  Enemy(float x, float y, float theta, float size)
  {
    pos = new PVector(x, y);
    forward = new PVector(0, -1);
    this.theta = theta;
    this.size = size;
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
      Enemy e = enemies.get(i);
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
  }
}