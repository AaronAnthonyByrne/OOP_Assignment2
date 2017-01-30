void setup()
{
  size(1200, 650);
  Player player = new Player(width/2, height/2, 0, 50, 'w', 's', 'a', 'd', ' ');
  item.add(player);
}

//Arraylist
ArrayList<Object> item = new ArrayList<Object>();

//Boolean variables
boolean[] keys = new boolean[1000];//to allow multiple key presses
boolean gameOn, win, wComplete, menu;

//float and int global variables
float timeDelta = 1.0f/60.0f; //to control the time(not sure if needed)
int state =0; 
int menuTime, menuAllowance; // to control time of the menu.

//pshapes for the powerups and objects
PShape EnemyBody,PlayerBody,healthSprite,gunSprite, laserSprite;

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

  // draw menu
  if (state ==0)
  {
    drawMenu();
  } else if (state == 1)
  {
    /* drawGame();
     } else if (state == 2)
     {
     gameOver();
     }*/
  }
}
//Print menu to screen
void drawMenu()
{
  fill(255);
  textAlign(CENTER);
  rectMode(CENTER);

  if (millis()- menuTime > menuAllowance)
  {
    menu = !menu;
    menuTime = millis();
  }
  if (menu == true)
  {
    textSize(35);
    text("~~ Press ENTER to Begin ~~", width/2, height/2 + 50);
  }

  /*
  ///
   ////
   TEXT FONT HERE!!
   */
  textSize(100);
  fill(255);
  text("Zombie Attack", width/2, height/2-110);
  textSize(35);
  text("by Aaron Byrne, C15709609", width/2, height/2-60);
  text("Controls: ", width/2 - 200, height/2 + 200);
  stroke(255);
  strokeWeight(3);
  line(width/2 - 270, height/2 + 210, width/2 - 130, height/2 + 210);
  textSize(20);
  text("W A S D / Arrow Keys: Move", width/2 - 200, height/2 + 250);
  text("Mouse: Aim and Shoot", width/2 - 200, height/2 + 300);
  text("How to Play: ", width/2 + 200, height/2 + 200);
  stroke(255);
  strokeWeight(3);
  line(width/2 + 130, height/2 + 210, width/2 + 270, height/2 + 210);
  text("Shoot -->", width/2 + 200, height/2 + 250);
  text("Collect -->", width/2 + 200, height/2 + 300);
  /*
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
   }*/
}