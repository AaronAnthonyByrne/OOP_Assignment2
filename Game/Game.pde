void setup()
{
  size(500, 500);
  //Player player = new Player(width/2, height/2,0,50,'w','s','a','d',' ');
}

ArrayList<Object> thing = new ArrayList<Object>();
boolean[] keys = new boolean[1000];//to allow multiple key presses
float timeDelta = 1.0f/60.0f; //to control the time

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
  for (int i = thing.size() -1; i >=0; i --)
  {
    Object ob = thing.get(i);
    ob.render();
  }
}