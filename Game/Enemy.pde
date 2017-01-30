class Enemy extends Object
{
  Enemy()
  {
  }
  
  void create()
  {
    EnemyBody = createShape(ELLIPSE,width/2 +280, height/2 +245,30,30);
    EnemyBody.setStroke(color(1,82,0));
    EnemyBody.setFill(color(0,255,0));
  }
  void render()
  {
  }
  
  void update()
  {
  }
  
}