void setup()
{
  //load font here
  size(1200, 650);
  xml = loadXML("rounds.xml");
  rounds = xml.getChildren("round");
  gameOn = false;

  cursor(CROSS);// turn the cursor from a arrow to a cross
  state = 0;//starting game state
  powerTime = millis(); //returns the number of milliseconds since starting the program. Help in timing the powerUps 
  powerAllowance = (int)random(10000, 15000); //cast to and interger value to get whole numbers
  menuAllowance = 500;
  hitCoolDown = 800;
}
/*--------------------------------*
 * Global Variables 
/*--------------------------------*/

//Arraylist
ArrayList<Object> item = new ArrayList<Object>();

//Classes
Text text;
Player player = new Player(width/2, height/2, 0, 50, 'w', 's', 'a', 'd');
//Boolean variables
boolean[] keys = new boolean[1000];//to allow multiple key presses
boolean gameOn, win, rComplete, menu;

//float and int global variables
float timeDelta = 1.0f/60.0f; //to control the time(not sure if needed)
float theta;
int state; 
int menuTime, menuAllowance; // to control time of the menu.
int currentRound, totalKills, totalShots, score, level;
int amountEnemies, remainingEnemies;// for display the total amout of enimeis and how many left to pass the round.
int powerTime, powerAllowance;//Time that the powerups will display and the amount of time between each powerup
int hitTime, hitCoolDown;//
int startTime;
final int timeDisplay = 800;
//pshapes for the powerups and objects
PShape EnemyBody, PlayerBody, healthSprite, gunSprite, laserSprite;

//adding in my XML file.
XML xml;
XML[] rounds;

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

  //might change to a swicth stament.
  if (state ==0)
  {
    drawMenu();
  } else if (state == 1)
  {
    drawGame();
  } else if (state == 2)
  {
    gameOver();
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
  text("Survived until Wave " + currentRound, width/2, height/2 - 50);
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
  if (!gameOn)
  {
    initialiseGame();
  }
  //update and draw all object(enemies, player and powerups) to the screen.
  player.update();
  pushMatrix();
  createPlayer();
  popMatrix();
  text.drawText();
  for (int i = item.size() -1; i >=0; i --)
  {
    Object ob = item.get(i);
    ob.update();
    // ob.render();
  }
  //drawText();
  //collisionHanlder();
}
void initialiseGame()
{
  ArrayList<Gun> gun = new ArrayList<Gun>();
  ArrayList<Enemy> enimies = new ArrayList<Enemy>();
  currentRound = rounds[level].getInt("id");
  amountEnemies = rounds[level].getInt("enemies");
  remainingEnemies = amountEnemies;
  gameOn= true;
}

void createPlayer()
{
  // Laser between player & mouse
  strokeWeight(.5);
  stroke(255, 0, 0);
  line(mouseX, mouseY, player.pos.x, player.pos.y);

  fill(0);
  stroke(#FFFFFF);
  theta = atan2(player.pos.x - mouseX, player.pos.y - mouseY);
  translate(player.pos.x, player.pos.y);
  rotate(-player.theta-PI); 
  strokeWeight(4);
  ellipse(0, 0, 50, 50);
  line(0, 10, 0, 40);
}