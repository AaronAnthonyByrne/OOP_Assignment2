
/*--------------------------------*
 *Setup
/*--------------------------------*/
void setup()
{

  size(1200, 650);
  xml = loadXML("rounds.xml");
  rounds = xml.getChildren("round");
  mainTitleFont = loadFont("Chiller-Regular-100.vlw");
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
//Fonts being used in game
PFont mainTitleFont;

//Array Lists
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<PowerUp> powerUp = new ArrayList<PowerUp>();

//Classes
Player player = new Player(width/2, height/2, 0, 50, 'w', 's', 'a', 'd');
Enemy enemy;
Bullet bullet;
PowerUp powerUps;

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
int powerTime, powerAllowance, powerCD;//Time that the powerups will display and the amount of time between each powerup
int hitTime, hitCoolDown;//
int startTime;
final int timeDisplay = 800;
//pshapes for the powerups and objects
PShape healthSprite, powerUpSprite, laserSprite;

//adding in my XML file.
XML xml;
XML[] rounds;


/*--------------------------------*
 * Checking for the keys that have been pressed.
/*--------------------------------*/
void keyPressed()
{
  keys[keyCode] = true;
  if (state == 0 && (checkKey(RETURN) ||checkKey( ENTER)))
  {
    player = new Player(width/2, height/2, 0, 50, 'w', 's', 'a', 'd');
    player.pos = new PVector(width/2, height/2);

    state =1;
    totalKills =0;
    level =0;
    score =0;
    totalShots =0;
  } 
  if (state == 2 && (checkKey(RETURN) ||checkKey( ENTER)))
  {
    state =0;
    player.health =5;
  }
}

void keyReleased()
{
  keys[keyCode] = false;
  if (checkKey(RETURN) ||checkKey( ENTER));
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
    textSize(45);
    text("~~ Press ENTER to Begin ~~", width/2, height/2 + 50);
  }

  //main title text
  textFont(mainTitleFont);
  textSize(100);
  fill(255);
  text("Zombie Attack", width/2, height/2-110);
  textSize(40);
  text("by Aaron Byrne, C15709609", width/2, height/2-60);

  //print the control instructions
  text("Controls: ", width/2 - 200, height/2 + 200);
  stroke(255);
  strokeWeight(3);
  line(width/2 - 270, height/2 + 210, width/2 - 130, height/2 + 210);
  text("W A S D / Arrow Keys: Move", width/2 - 200, height/2 + 250);
  text("Mouse: Aim and Shoot", width/2 - 200, height/2 + 300);

  //How to play instructions
  text("How to Play: ", width/2 + 200, height/2 + 200);
  stroke(255);
  strokeWeight(3);
  line(width/2 + 130, height/2 + 210, width/2 + 270, height/2 + 210);
  text("Shoot -->", width/2 + 200, height/2 + 250);
  text("Collect -->", width/2 + 200, height/2 + 300);

  /*--------------------------------*
   * Sprites healthSprite, powerUpSprite, laserSprite
  /*--------------------------------*/
  // Enemy sprite
  stroke(0, 0, 255); 
  fill(0, 0, 255);
  ellipse(width/2 + 280, height/2 + 245, 30, 30);

  // Health sprite
  stroke(255, 0, 0);
  fill(255, 0, 0, 90);
  ellipse(width/2 + 280, height/2 + 290, 30, 30);
  stroke(255);
  fill(255);
  line(width/2 + 270, height/2 + 290, width/2 + 290, height/2 + 290);
  line(width/2 + 280, height/2 + 280, width/2 + 280, height/2 + 300);

  // MachinepowerUp sprite
  stroke(255);
  fill(255, 90);
  ellipse(width/2 + 320, height/2 + 290, 30, 30);
  stroke(255);
  fill(255);
  ellipse(width/2 + 312, height/2 + 290, 4, 4);
  ellipse(width/2 + 320, height/2 + 290, 4, 4);
  ellipse(width/2 + 328, height/2 + 290, 4, 4);

  // Laser Sprite
  stroke(255);
  fill(255, 90);
  ellipse(width/2 + 360, height/2 + 290, 30, 30);
  stroke(0, 0, 255);
  line(width/2 + 352, height/2 + 290, width/2 + 368, height/2 + 290);
}

/*--------------------------------*
 * Game Over Screen
/*--------------------------------*/

void gameOver()
{
  textSize(60);
  if (win)
  {
    text("Congratulations! You Won!", width/2, height/2-100);
  } else
  {
    text("Game Over! You Lost", width/2, height/2-100);
  }
  textSize(50);
  text("Survived until Round " + currentRound, width/2, height/2 - 50);
  text("-- Press ENTER to Restart --", width/2, height/2);
  textSize(40);
  text("Total  Kills: " + totalKills, width/2, height/2 + 100);
  text("Shots Fired: " + totalShots, width/2, height/2 + 150);
  text("Hit Accuracy: " + round(((float)totalKills / (float) totalShots)*100) + "%", width/2, height/2 + 200);
  textSize(48);
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
   println(amountEnemies);
  //update and draw all object(enemies, player and powerups) to the screen.
  player.update();
  updateBullets();
  pushMatrix();
  createPlayer();
  popMatrix();
  updatepowerUps();
  enemyUpdate();
  drawText();
  collisionHandler();
 
}

/*--------------------------------*
 * Start the game
/*--------------------------------*/
void initialiseGame()
{

  enemies = new ArrayList<Enemy>();
  enemies.clear();
  currentRound =(int) rounds[level].getInt("id");
  amountEnemies = (int)rounds[level].getInt("enemies");
  remainingEnemies = amountEnemies;
  gameOn= true;
  println(amountEnemies);
}

/*--------------------------------*
 * Player Creation
/*--------------------------------*/
void createPlayer()
{
  // Laser between player & mouse
  strokeWeight(.9);
  stroke(255, 0, 0);
  line(mouseX, mouseY, player.pos.x, player.pos.y);

  fill(0, 255, 0);
  stroke(#FFFFFF);
  theta = atan2(player.pos.y - mouseX, player.pos.x - mouseY);
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

  if (player.bulletCoolDown <=250)
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
    rect(width*.42+(50*i), height- 60, 30, 30);
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
/*--------------------------------*
 * Update the eneies position
/*--------------------------------*/
void enemyUpdate()
{
  int timer = millis();
  println(amountEnemies);
  if (amountEnemies> 0 &&  timer % 30 == 0 )
  {
      enemyRender();
      println("arrayList is before for loop:"+enemies.size());
  }
  for (int i =0; i< enemies.size(); i++)
  {
    Enemy e = enemies.get(i);

    println("arrayList is:"+enemies.size());
    e.update();
  }

  if ( remainingEnemies == 0 && level < rounds.length -1)
  {
    level ++;
    startTime = millis();
    gameOn = false;
    rComplete = true;
  }
  //All levels beaten
  else if (remainingEnemies == 0 && level == rounds.length-1)
  {
    gameOn = false;
    win = true;
    state = 2;
  }
}
/*--------------------------------*
 * Draws enemies to screen each round.
/*--------------------------------*/

void enemyRender()
{
  int spawnPos = (int) random(0, 3);
  if (spawnPos == 0)
  {
    enemies.add(new Enemy(new PVector(random (-200, 0), random(-200, height + 200)), player));
  }
  if (spawnPos ==1)
  {
    enemies.add(new Enemy(new PVector(random (width, width+200), random(-200, height + 200)), player));
  }
  if (spawnPos == 2)
  {
    enemies.add(new Enemy(new PVector(random (width -200, width+200), random(height, 200)), player));
  } else
  {
    enemies.add(new Enemy(new PVector(random (width -200, width+200), random(-200, 0)), player));
  }
  amountEnemies -- ;
}

/*--------------------------------*
 * Draws bullets and removes them from screen if they have gone off screen
/*--------------------------------*/
void updateBullets()
{
  for (int i= 0; i < bullets.size(); i++)
  {
    Bullet b = bullets.get(i);
    b.update();

    if (b.pos.x < 0 ||b.pos.x > width ||b.pos.y < 0 ||b.pos.x > height ||b.alive ==false)
    {
      bullets.remove(i);
    }
  }
}
/*--------------------------------*
 * Draws differant powerUp types or powerups
/*--------------------------------*/

void updatepowerUps()
{
  if (millis()- powerTime > powerAllowance)
  {
    powerUp.add(new PowerUp(new PVector (random(0, width), random(0, height)), player));
    powerCD = (int) random(9999, 10250);//randomise the time between power ups
    powerTime = millis();
  }

  for (int i =0; i < powerUp.size(); i ++)
  {
    powerUp.get(i).update();
  }
}

/*--------------------------------*
 * Checking for collisions
/*--------------------------------*/
void collisionHandler()
{
  for (int i= bullets.size()-1; i >=0; i--)
  {
    for (int j = enemies.size() -1; j >=0; j --)
    {
      Bullet b = bullets.get(i);
      Enemy e = enemies.get(j);

      if (b.alive && e.active && checkCol(b.pos.x, b.pos.y, e.pos.x, e.pos.y, 15))
      {
        totalKills ++;
        score += 50;
        remainingEnemies --;
        b.alive = false;
        e.active = false;
      }
    }
  }
}

/*--------------------------------*
 * Checking for collisions; using a boolean
/*--------------------------------*/
boolean checkCol(float bulletX, float bulletY, float enemyX, float enemyY, float hit)
{
  if (dist(bulletX, bulletY, enemyX, enemyY)< hit)
  {
    return true;
  } else
  {
    return false;
  }
}