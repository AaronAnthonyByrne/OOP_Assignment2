void setup()
{
  size(1200, 650);
  // Player player = new Player(width/2, height/2, 0, 50, 'w', 's', 'a', 'd', ' ');
  //item.add(player);
  Enemy e = new Enemy(width/2, height/2, 0, 50);
  item.add(e);
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
int currentWave,totalKills, totalShots, score;

//pshapes for the powerups and objects
PShape EnemyBody, PlayerBody, healthSprite, gunSprite, laserSprite;

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
}
void gameOver()
{
  textSize(50);
  if (win)
  {
    text("Congratulations! You Won!", width/2, height/2-100);
  } else
  {
    text("Game Over! You Lost", width/2, height/2-100);
  }
  textSize(40);
  text("Survived until Wave " + currentWave, width/2, height/2 - 50);
  text("-- Press ENTER to Restart --", width/2, height/2);
  textSize(30);
  text("Total  Kills: " + totalKills, width/2, height/2 + 100);
  text("Shots Fired: " + totalShots, width/2, height/2 + 150);
  text("Hit Accuracy: " + round(((float)totalKills / (float) totalShots)*100) + "%", width/2, height/2 + 200);
  textSize(38);
  text("Final Score: " + score, width/2, height/2 + 300);
}

void drawGame()
{
  if(!gameOn)
  {
    initialiseGame();
  }
  //print out all object to the screen.
  for (int i = item.size() -1; i >=0; i --)
  {
    Object ob = item.get(i);
    ob.update();
    ob.render();
  }
}
void initialiseGame()
{
  ArrayList<Gun> gun = new ArrayList<Gun>();
  ArrayList<Enemy> enimies = new ArrayList<Enemy>();
}


}