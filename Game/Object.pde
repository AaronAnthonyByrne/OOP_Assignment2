abstract class Object
{
  PVector pos;
  PVector forward;
  float size;
  
  Object()
  {
    
  }
  
  abstract void update();
  abstract void render();
}