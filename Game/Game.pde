void setup()
{
  size(1200, 650);
  Player player = new Player(width/2, height/2, 0, 50, 'w', 's', 'a', 'd', ' ');
  item.add(player);
}

ArrayList<Object> item = new ArrayList<Object>();
boolean[] keys = new boolean[1000];//to allow multiple key presses
float timeDelta = 1.0f/60.0f; //to control the time

//checking for key presses. 
void keyPressed()
{
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}

boolean checkKey(int k)
{
  if (keys.length >= k)
  {
    return keys[k] || keys[Character.toUpperCase(k)];
  }
  return false;
}

void draw()
{
  background(0);
  stroke(255);

  //print out all object to the screen.
  for (int i = item.size() -1; i >=0; i --)
  {
    Object ob = item.get(i);
    ob.update();
    ob.render();
  }

  int count =0;
  if (frameCount % 60 == 0)
  {
    count ++;
    if (count == 5)
    {
      Gun power = new Gun();
      power.pos = new PVector(random(0, width), random(0, height));
      item.add(power);
    }
  }
}