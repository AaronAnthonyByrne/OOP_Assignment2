class Enemy extends Object
{
  PShape EnemyBody;
  float theta,size;
  
  Enemy(float x, float y, float theta, float size)
  {
    pos = new PVector(x, y);
    forward = new PVector(0, -1);
    this.theta = theta;
    this.size = size;
  }
  
  void create()
  {
    EnemyBody = createShape(ELLIPSE,width/2 +280, height/2 +245,30,30);
    EnemyBody.setStroke(color(1,82,0));
    EnemyBody.setFill(color(0,255,0));
  }
  void render()
  {
    

   //shape(EnemyBody);
    
  }
  
  void update()
  {
  }
  
}