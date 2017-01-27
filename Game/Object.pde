abstract class Object
{
  PVector pos;
  PVector forward;
  float size;
  
  Object()
  {
    println("This is inside the abstract object class constructor");
  }
  
  abstract void update();
  abstract void render();
}