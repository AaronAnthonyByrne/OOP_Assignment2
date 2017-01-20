class Object{
  //delcare the PVectors first
  PVector velocity;
  PVector acceloration;
  PVector position;
  PVector move;
  
  //declare floats
  float theta; //for changing direction of player and for shooting
  float size;
  float speed = 10; // speed of the player or enemy
  float alive;
  float radius;
  float mass = 1;
  int health;
  
  char up, down, left, right, fire;
  
  PShape player;
  
  void Player()
  {
    
  }
}