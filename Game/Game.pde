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
 ArrayList<Object> gameObject= new ArrayList<Object>();

//Classes
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

/*--------------------------------*
 * draw Function
/*--------------------------------*/
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

/*--------------------------------*
 * Printing the menu
/*--------------------------------*/
void drawMenu()
{
  fill(255);
  textAlign(CENTER);
  rectMode(CENTER);

//print the flashing text
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

  if (state == 0 && (checkKey(RETURN) ||checkKey( ENTER)))
  {
    state =1;

    totalKills =0;
    level =0;
    score =0;
    totalShots =0;
  }
}

/*--------------------------------*
 * 
/*--------------------------------*/

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


/*--------------------------------*
 * Draw the game
/*--------------------------------*/
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
  drawText();
  //for (int i = item.size() -1; i >=0; i --)
  //{
  //Object ob = item.get(i);
  //ob.update();
  // ob.render();
  //}

  //collisionHanlder();
}

/*--------------------------------*
 * Start the game
/*--------------------------------*/
void initialiseGame()
{
  Enemy enemies = new Enemy;
  // ArrayList<Gun> gun = new ArrayList<Gun>();
  //  ArrayList<Enemy> enimies = new ArrayList<Enemy>();
  currentRound = rounds[level].getInt("id");
  amountEnemies = rounds[level].getInt("enemies");
  remainingEnemies = amountEnemies;
  gameOn= true;
}

/*--------------------------------*
 * Player Creation
/*--------------------------------*/
void createPlayer()
{
  // Laser between player & mouse
  strokeWeight(.5);
  stroke(255, 0, 0);
  line(mouseX, mouseY, player.pos.x, player.pos.y);

  fill(0);
  stroke(#FFFFFF);
  theta = atan2(player.pos.y - mouseY, player.pos.x - mouseX);
  translate(player.pos.x, player.pos.y);
  rotate(-player.theta-PI); 
  strokeWeight(4);
  ellipse(0, 0, 50, 50);
  line(0, 10, 0, 40);
}

/*--------------------------------*
 * Text that needs to be displayed every frame
/*--------------------------------*/
void drawText()
{
  textSize(35);
  fill(255);
  textAlign(CENTER);

  //Text for the top of the screen displaying currentRound bullet coold down and ammo.
  text("Round", width*.75, 40);
  text(currentRound, width*.75, 70);

  if (player.bulletCoolDown !=250)
  {
    fill(255, 0, 0);
    textSize(45);
    text(player.ammo, width/2, height -50);
  }

  //Text at the bottom of the screen
  text("Health", width/2, height -90);
  stroke(255, 0, 0);
  fill(255, 0, 0, 90);

  //drawing of the health boxes
  for (int i = 0; i <player.health; i ++)
  {//width-110, height -80
    rect(width*.42+(50*i),height- 60, 30, 30);
  }

  //score
  fill(255);
  text("Score", width/2, 40);
  text(score, width/2, 70);
  text("Enemies Left :", width*.25, 40);
  text(remainingEnemies, width*.25, 70);

  //when the game is completed
  if (rComplete)
  {
    fill(0, 255, 0);
    textSize(70);
    text("Round Complete", width/2, height/2);
    if (millis()- startTime > timeDisplay)
    {
      rComplete = false;
    }
  }
}