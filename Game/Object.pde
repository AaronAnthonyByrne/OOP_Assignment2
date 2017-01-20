class Object {
  //delcare the PVectors first
  PVector velocity;
  PVector acceleration;
  PVector position;
  PVector move;
  PVector force;

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

  void Player(float x, float y, float theta, float size, char up, char down, char left, char right, char fire)
  {
    position = new PVector(x, y);
    move = new PVector(0, -1);
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    force = new PVector(0, 0);
    radius = size/2;

    this.theta  = theta;
    this.size = size;
    this.left = left;
    this.right = right;
    this.up = up;
    this.down = down;
    this.fire = fire;
    this.health = 10;
    create();
  }

  void create()
  {
    player = createShape();
    player.beginShape();
    player.stroke(255);
    player.vertex(0, 0);
    player.vertex(5, 0);
    player.vertex(5, 5);
    player.vertex(10, 5);
    player.vertex(10, 25);
    player.vertex(-5, 25);
    player.vertex(-5, 5);
    player.vertex(0, 5);
    player.endShape(CLOSE);
  }

  void render()
  {

    pushMatrix();
    translate(position.x, position.y);

    rotate(theta);
    shape(player, 0, 0);
    popMatrix();
  }
}