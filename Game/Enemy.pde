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

  void create()
  {
    EnemyBody = createShape(ELLIPSE, width/2 +280, height/2 +245, 30, 30);
    EnemyBody.setStroke(color(1, 82, 0));
    EnemyBody.setFill(color(0, 255, 0));
  }
  void render()
  {
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
     */
  }

  void update()
  {
  }
}